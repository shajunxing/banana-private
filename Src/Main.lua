function BananaIconButtonTemplate_OnLoad(self)
    if self.icon then
        getglobal(self:GetName() .. 'Icon'):SetTexture(self.icon)
    end
end

function BananaIconButtonTemplate_OnEnter(self, motion)
    if self.tooltip then
        GameTooltip_SetDefaultAnchor(GameTooltip, self)
        GameTooltip:SetText(self.tooltip) -- 注意SetText必须在SetOwner之后，否则不显示
        GameTooltip:Show()
    end
end

function BananaIconButtonTemplate_OnLeave(self, motion)
    GameTooltip:Hide()
end

function BananaSecureIconButtonTemplate_OnLoad(self)
    BananaIconButtonTemplate_OnLoad(self)
    self:RegisterForClicks('AnyUp', 'AnyDown')
    self:SetMouseClickEnabled(true)
end

function BananaPrivateUIButton_OnLoad(self)
    BananaIconButtonTemplate_OnLoad(self)
    BananaOnAddonLoaded(
        'Blizzard_ActionBar',
        function()
            -- 不能self:SetParent(MainMenuBar)，会导致MainMenuBar变形
            self:SetPoint('LEFT', MainMenuBar, 'RIGHT', 14, 0)
        end
    )
end

function BananaPrivateUIButton_OnClick(self, button, down)
    BananaPrivateUIPanel:SetShown(not BananaPrivateUIPanel:IsShown())
end

BananaClassTalent = {}
BananaClassMacro = {}
BananaClassBar = {}

local racial_abilities = {
    -- 联盟
    Human = '生存意志',
    Dwarf = '石像形态',
    NightElf = '影遁',
    Gnome = '逃命专家',
    Draenei = '纳鲁的赐福',
    Worgen = '疾步夜行',
    VoidElf = '空间裂隙',
    LightforgedDraenei = '圣光裁决者',
    DarkIronDwarf = '烈焰之血',
    KulTiran = '强力一击',
    Mechagnome = '超有机光影发生器',
    -- 部落
    Orc = '血性狂怒',
    Scourge = '被遗忘者的意志',
    Tauren = '战争践踏',
    Troll = '狂暴(种族特长)',
    BloodElf = '奥术洪流',
    Goblin = '火箭跳',
    Nightborne = '奥术脉冲',
    HighmountainTauren = '蛮牛冲撞',
    MagharOrc = '先祖召唤',
    ZandalariTroll = '再生！',
    Vulpera = '袋里乾坤',
    -- 中立
    Pandaren = '震山掌'
}
local function get_player()
    local player = {
        race = ({UnitRace('player')})[2],
        class = ({UnitClass('player')})[2],
        faction = ({UnitFactionGroup('player')})[1],
        level = UnitLevel('player'),
        specialization = GetSpecialization(), -- 新创建没有设置专精的返回5
        covenant = C_Covenants.GetActiveCovenantID() -- 未选的返回0
    }
    player.racial_abilitiy = racial_abilities[player.race] or '复活战斗宠物'
    player.dash_or_mount = ((player.level >= 10 and player.class == 'DRUID') or (player.class == 'DEATHKNIGHT') or (player.level >= 20)) and {'macro', '跑'} or {'summonmount', '召唤司机'}
    player.riding_level = 0 -- 骑术，0未学习，1初级，2中级，3高级，4大师级
    if IsSpellKnown(90265) then -- 注意高等级学过之后低等级的IsSpellKnown为false
        player.riding_level = 4
    elseif IsSpellKnown(34090) then
        player.riding_level = 3
    elseif IsSpellKnown(33391) then
        player.riding_level = 2
    elseif IsSpellKnown(33388) then
        player.riding_level = 1
    end
    local instance_id = select(8, GetInstanceInfo())
    -- C_MountJournal.GetMountInfoByID(1589)和C_MountJournal.GetMountUsabilityByID(1589, true)没用，都是true
    player.recommend_mount = '召唤司机'
    if player.riding_level > 0 then
        player.recommend_mount = '烬鬃战马'
    end
    -- 牛头人太大，上坐骑时候变小
    player.transform_on_mount = player.race == 'Tauren' and '/use [nocombat,outdoors] 布尔吉·黑心的时装帽\n/use [nocombat,outdoors] 骷髅黑帆\n' or ''
    return player
end

function BananaTalentPresetButton_OnClick(self, button, down)
    if InCombatLockdown() then
        print('InCombatLockdown()')
        return
    end
    print('BananaTalentPresetButton_OnClick()')
    local player = get_player()
    local talents = BananaClassTalent[player.class] and BananaClassTalent[player.class](player)
    if not talents then
        return
    end
    local talent = talents[player.specialization]
    if not talent then
        return
    end
    -- 删掉之前同名的
    local loadout_name = '我的天赋'
    local config_ids = C_ClassTalents.GetConfigIDsBySpecID()
    for _, config_id in ipairs(config_ids) do
        local config_info = C_Traits.GetConfigInfo(config_id)
        local config_name = (config_info and config_info.name) or ''
        if config_name == loadout_name then
            C_ClassTalents.DeleteConfig(config_id)
        end
    end
    -- 必须要先打开天赋面板，因为需要初始化是谁的天赋（与目标检查共享界面的）
    PlayerSpellsUtil.OpenToClassTalentsTab()
    PlayerSpellsFrame.TalentsFrame:ImportLoadout(talent, loadout_name)
    ClassTalentHelper.SwitchToLoadoutByName(loadout_name)
end

local global_macros = {
    ['扔'] = '#showtooltip\n/cancelaura 神圣惩戒\n/use 画着芜菁的“枪”\n/use 水果篮\n/use 裂心者\n/use 达拉然飞碟\n/use 足球\n/sit\n',
    ['玩具'] = '/use 上层精灵的灵魂镜\n/use 个人全息投影仪\n/use 大法师瓦格斯的备用法杖\n/use 山丘之王的圣杯\n/use 怨恨尖塔\n/use 星图\n/use 松软的绿色沙发垫\n/use 炉石游戏盘\n/use 烈焰舞娘火盆\n/use 神奇的啤酒桶\n/use 莉莉安的警告牌\n/use 永恒沙漏\n/use 堆叠式雄鹿\n/use 寄魂战鼓\n/use 旧娃娃\n/use 浪漫午餐篮\n/use 燃烧军团便携传送门\n/use 虚空图腾\n/use 记忆之盒\n/use 集结战旗\n',
    ['披风'] = '#showtooltip\n/dismount [flying]\n/cancelform [flying]\n/use 15\n/cast [known:拾回] 拾回\n/use 远程拾取器\n/use 芬德尔的远程拾取器\n/cast 钓鱼\n',
    ['腰带'] = '#showtooltip\n/use 6\n',
    ['EAB'] = '/click ExtraActionButton1\n',
    ['日常'] = '/tar 偷懒的龙喉苦工\n/use 训诫靴\n/use 亚兹尔的羊肉\n/use 天空卫队的炸弹\n/use 冠军的钱包\n/use 震地者之鼓\n/use 烈焰之矛\n/use 缴获的克瓦迪尔旗帜\n/use 疣无忧唇膏\n/kiss\n/use 加重的扣网\n/use 唤雾者的符咒\n/use 克瓦迪尔战争号角\n/use 光明祝福圣物\n/use 忏悔者的祈祷书\n/use 新鲜的鱼饵\n/use 狼的尖牙\n/use 魔法药膏\n/use 磁性废料收集器\n/use 戳鸟之矛\n',
    ['离开'] = '/sit\n/afk\n',
    ['旗'] = '#showtooltip\n/use 协同战旗\n/use 神秘水果帽\n/use 世界缩小器\n/use 巨怒射线枪\n/lie\n/afk\n',
    ['箱子'] = '#showtooltip\n/use 勇士的采矿箱\n/use 勇士的剥皮箱\n/use 勇士的裁缝箱\n/use 勇士的附魔箱\n/use 冒险者的采矿箱\n/use 冒险者的剥皮箱\n/use 冒险者的裁缝箱\n/use 冒险者的附魔箱\n',
    ['节日'] = '#showtooltip\n/use 一袋肥美的青蛙\n/use 裹着面粉的青蛙\n/use 封印的暗月箱子\n/target 损坏的坦克\n/use 磨损的扳手\n/use 储备铁块\n/use 马蹄铁\n/use 调酒器\n/use 先祖硬币\n/use 红包\n/use 一把糖果\n/use 装满战利品的南瓜\n/use [@player] 奥术清洁剂\n/use 灭火剂\n/use 心形护匣\n/use 鲜艳的彩蛋\n',
    ['附魔'] = '#show 将当前选择的附魔写到羊皮纸上\n/run TradeSkillFrame.DetailsFrame.CreateButton:Click()\n/use 附魔羊皮纸\n',
    ['辱尸'] = '/usetoy 德鲁斯特仪式匕首\n/usetoy 葬礼火把\n/usetoy 吸魂者\n/usetoy 金鸡双刀\n',
    ['影遁'] = '#showtooltip\n/cancelaura 树皮术\n/cast !影遁\n'
}

function BananaMacroPresetButton_OnClick(self, button, down)
    if InCombatLockdown() then
        print('InCombatLockdown()')
        return
    end
    print('BananaMacroPresetButton_OnClick()')
    local player = get_player()
    local gn, pcn = GetNumMacros()
    -- 通用宏
    for i = gn, 1, -1 do
        local n = ({GetMacroInfo(i)})[1]
        if not global_macros[n] then
            print('DeleteMacro', n)
            DeleteMacro(i)
        end
    end
    for n, b in pairs(global_macros) do
        local i = GetMacroIndexByName(n)
        if i == 0 or i > 120 then
            print('CreateMacro', n)
            CreateMacro(n, 'INV_Misc_QuestionMark', b, nil, 1)
        elseif GetMacroBody(i) ~= b then
            print('EditMacro', n)
            EditMacro(i, nil, nil, b)
        end
    end
    -- 角色专用宏
    if not BananaClassMacro[player.class] then
        return
    end
    local per_char_macros = BananaClassMacro[player.class](player)
    if not per_char_macros then
        return
    end
    for i = pcn + 120, 121, -1 do
        if not per_char_macros[({GetMacroInfo(i)})[1]] then
            DeleteMacro(i)
        end
    end
    for n, b in pairs(per_char_macros) do
        local i = GetMacroIndexByName(n)
        if i == 0 or i < 121 then
            print('CreateMacro', n)
            CreateMacro(n, 'INV_Misc_QuestionMark', b, 1, 1)
        elseif GetMacroBody(i) ~= b then
            print('EditMacro', n)
            EditMacro(i, nil, nil, b)
        end
    end
end

local function clear_slot(slot)
    ClearCursor()
    PickupAction(slot)
    return slot + 1
end

local function place_action(name, slot, warning)
    ClearCursor()
    -- 首先查找宏
    if GetMacroInfo(name) then
        PickupMacro(name)
        PlaceAction(slot)
        return slot + 1
    end
    -- 然后法术，包括坐骑
    if C_Spell.DoesSpellExist(name) then
        C_Spell.PickupSpell(name)
        PlaceAction(slot)
        return slot + 1
    end
    -- 然后flyout，11.0法术书api已修改，参见 https://warcraft.wiki.gg/wiki/API_C_SpellBook.GetSpellBookItemInfo
    for i = 1, C_SpellBook.GetNumSpellBookSkillLines() do
        local skillLineInfo = C_SpellBook.GetSpellBookSkillLineInfo(i)
        local offset, numSlots = skillLineInfo.itemIndexOffset, skillLineInfo.numSpellBookItems
        for j = offset + 1, offset + numSlots do
            local spellBookItemInfo = C_SpellBook.GetSpellBookItemInfo(j, Enum.SpellBookSpellBank.Player)
            local spellType, id = spellBookItemInfo.itemType, spellBookItemInfo.actionID
            if spellType == Enum.SpellBookItemType.Flyout then
                local spellName = GetFlyoutInfo(id)
                if spellName == name then
                    C_SpellBook.PickupSpellBookItem(j, Enum.SpellBookSpellBank.Player)
                    PlaceAction(slot)
                    return slot + 1
                end
            end
        end
    end
    -- 然后物品，包括玩具
    local item_id = GetItemInfoInstant(name)
    if item_id then
        C_Item.PickupItem(item_id)
        PlaceAction(slot)
        return slot + 1
    end
    -- 然后小宠物
    local _, pet_id = C_PetJournal.FindPetIDByName(name)
    if pet_id then
        C_PetJournal.PickupPet(pet_id)
        PlaceAction(slot)
        return slot + 1
    end
    if warning then
        print('找不到"' .. name .. '"')
    end
    return slot
end

function BananaActionBarPresetButton_OnClick(self, button, down)
    if InCombatLockdown() then
        print('InCombatLockdown()')
        return
    end
    print('BananaActionBarPresetButton_OnClick()')
    local player = get_player()
    -- 显示主动作条、左下动作条和右侧两动作条
    Settings.SetValue('PROXY_SHOW_ACTIONBAR_2', true)
    Settings.SetValue('PROXY_SHOW_ACTIONBAR_4', true)
    Settings.SetValue('PROXY_SHOW_ACTIONBAR_5', true)
    -- 新创建的小号
    -- place_action("召唤司机", 5)
    -- 右侧两动作条
    CollectionsJournal_LoadUI() -- 玩具箱是插件形式存在的
    local slot = 25
    -- 常用坐骑、生活技能
    slot = place_action('雄壮远足牦牛', slot)
    slot = place_action('切换飞行模式', slot)
    slot = place_action('符文熔铸', slot) -- 类似于附魔
    slot = place_action('呼叫大胖', slot) -- 地精的银行
    slot = place_action('战团银行距离抑制器', slot)
    slot = place_action('移动银行', slot)
    -- 传送类
    slot = place_action('星界传送', slot) -- shaman
    slot = place_action('城镇传送之书', slot)
    slot = place_action('传送：月光林地', slot) -- dru
    slot = place_action('梦境行者', slot)
    slot = place_action('传送', slot) -- mage
    slot = place_action('传送门', slot)
    slot = place_action('黑锋之门', slot) -- dk
    slot = place_action('禅宗朝圣', slot) -- monk
    slot = place_action('钻探机', slot) -- 黑铁矮人
    slot = place_action('烈酒的遥控器', slot)
    slot = place_action('要塞炉石', slot)
    slot = place_action('海军上将的罗盘', slot)
    slot = place_action('达拉然炉石', slot)
    slot = place_action('飞行管理员的哨子', slot)
    if C_Spell.DoesSpellExist('工程学') then
        slot = place_action('虫洞发生器：潘达利亚', slot)
        slot = place_action('虫洞离心机', slot)
        slot = place_action('虫洞发生器：阿古斯', slot)
        slot = place_action('虫洞发生器：库尔提拉斯', slot)
        slot = place_action('虫洞发生器：赞达拉', slot)
        slot = place_action('虫洞发生器：暗影界', slot)
        slot = place_action('龙洞发生器：巨龙群岛', slot)
        slot = place_action('虫洞发生器：卡兹阿加', slot)
    end
    -- 复活和战复
    local respawn_spells =
        ({
        DRUID = {'起死回生', '复生', '新生'},
        DEATHKNIGHT = {'复活盟友'},
        PALADIN = {'救赎', '宽恕', '代祷'},
        SHAMAN = {'先祖之魂', '先祖视界'}, -- 萨满有个被动也叫“复生”会提示不能放置
        PRIEST = {'复活术', '群体复活'},
        MONK = {'轮回转世', '死而复生'},
        EVOKER = {'生还', '群体生还'}
    })[player.class]
    if respawn_spells then
        for _, spell in ipairs(respawn_spells) do
            -- print(spell)
            slot = place_action(spell, slot)
        end
    end
    -- 主动作条，左下动作条
    if not BananaClassBar[player.class] then
        return
    end
    local class_bars = BananaClassBar[player.class](player)
    if not class_bars then
        print('class_bars not found')
        return
    end
    local spec_bars = class_bars[player.specialization]
    if not spec_bars then
        print('spec_bars not found')
        return
    end
    for k, actions in pairs(spec_bars) do
        local i = tonumber(k)
        assert(type(i) == 'number')
        assert(type(actions) == 'table')
        for j = 0, 11 do
            local action = actions[j + 1]
            if action then
                place_action(action, i + j, true)
                if i == 1 and j < 5 then -- 驭龙术动作条
                    place_action(action, 121 + j, true)
                end
            end
        end
    end
    -- 驭龙术动作条
    slot = 126
    slot = place_action('向前突进', slot, true)
    slot = place_action('复苏之风', slot, true)
    slot = place_action('空中急停', slot, true)
    slot = place_action('青铜时光之锁', slot, true)
    slot = place_action('冲天升腾', slot, true)
    slot = place_action('奔雷疾冲', slot, true)
    -- 种族技能
    place_action(player.racial_abilitiy, 72)
    -- 最后清理一下光标
    ClearCursor()
    print('建议重载界面')
end

function BananaActionBarCleanupButton_OnClick(self, button, down)
    -- 121-132是驭龙术，参见 https://warcraft.wiki.gg/wiki/Action_Bar
    for slot = 1, 132 do
        clear_slot(slot)
    end
end

function BananaActionBarCheckButton_OnClick(self, button, down)
    local code = ''
    for _, i in ipairs({1, 73, 97, 109, 61}) do
        local line = string.format('[%d] = {', i)
        local in_use = nil
        for j = 0, 11 do
            slot = i + j
            local name = nil
            if HasAction(slot) then
                local type, id, stype = GetActionInfo(slot)
                if type == 'spell' then
                    name = C_Spell.GetSpellInfo(id)
                elseif type == 'flyout' then
                    name = GetFlyoutInfo(id)
                elseif type == 'item' then
                    name = C_Item.GetItemInfo(id)
                elseif type == 'macro' then
                    name = GetMacroInfo(id)
                elseif type == 'companion' then
                    _, name = GetCompanionInfo(stype, id)
                elseif type == 'equipmentset' then
                    name = id
                    id = C_EquipmentSet.GetEquipmentSetID(name)
                elseif type == 'summonmount' then
                    name = C_MountJournal.GetMountInfoByID(id)
                elseif type == 'summonpet' then
                    _, _, _, _, _, _, _, name = C_PetJournal.GetPetInfoByPetID(id)
                end
                print(slot, type, id, stype, name)
            end
            if name then
                in_use = true
                name = '"' .. tostring(name) .. '"'
            else
                name = 'nil'
            end
            line = line .. name .. ','
        end
        line = line .. '},\n'
        if in_use then
            code = code .. line
        end
    end
    -- T.ShowEditableMessageFrame(code)
end
