-- 增大TalentTreeViewer的界面
BananaOnAddonLoaded(
    'TalentTreeViewer_TWW',
    function()
        hooksecurefunc(
            TalentViewer,
            'InitFrame',
            function(self)
                TalentViewer_DF:SetScale(0.9)
            end
        )
    end
)

-- 禁用HelpTip，另有一套HelpPlate的正常
-- 会造成“插件导致界面行为失效”，Message: ...e/AddOns/Blizzard_EditMode/Mainline/EditModeUtil.lua:37: bad argument #1 to 'abs' (number expected, got nil)，法术书快捷键打不开等严重错误
-- 原因应该是很多secure组件调用HelpTip，插件代码会导致taint
-- HelpTip.Show = function(self, parent, info, relativeRegion)
-- end
-- HelpTip:ForceHideAll()

-- 自定义“复活”按钮
-- UIPanelLargeSilverButton模板并未设置disable状态，除了按不下去，观感和enabled一样，弃用
-- “返回墓地”按钮往左挪，参见 Interface\AddOns\Blizzard_FrameXML\GhostFrame.lua
function BananaRecoverCorpseButton_OnLoad(self)
    self:Disable()
    self:RegisterEvent('CORPSE_IN_RANGE')
    self:RegisterEvent('CORPSE_OUT_OF_RANGE')
    BananaHookStaticPopup(
        'RECOVER_CORPSE',
        function(which, dialog)
            dialog:Hide()
        end
    )
end
function BananaRecoverCorpseButton_OnEvent(self, event, ...)
    if event == 'CORPSE_IN_RANGE' then
        self:Enable()
    elseif event == 'CORPSE_OUT_OF_RANGE' then
        self:Disable()
    end
end

-- CVars设置
BananaOnLoggedIn(
    function()
        for k, v in pairs(
            {
                scriptErrors = '1', -- 显示Lua错误
                scriptWarnings = '1',
                ffxDeath = '0',
                ffxGlow = '0',
                ffxNether = '0',
                weatherDensity = '0',
                overrideArchive = '0', -- 反和谐
                rawMouseEnable = '0', -- 鼠标偶然乱晃问题 2020.07.23更新后如果为1那么右键不按下也会旋转屏幕
                -- 控制
                -- autoLootDefault = T.GetUnitName("player") == "斯给-金色平原" and "0" or "1", -- 自动拾取
                autoLootDefault = '1',
                -- 姓名板
                nameplateMaxDistance = 60, -- 姓名板距离，当前无效
                nameplateLargeTopInset = 0.16, -- （默认0.1）
                nameplateLargeBottomInset = 0.15, -- （默认0.15）
                nameplateOtherTopInset = 0.14, -- 敌方姓名板与屏幕顶端的最少距离（默认0.08）确保debuff不被自己的buff遮挡
                nameplateOtherBottomInset = 0.15, -- 敌方姓名板与屏幕底端的最少距离（默认0.1）
                nameplateSelfTopInset = 0.5, -- 自己姓名板与屏幕顶端的最少距离（默认0.5），不能比/tinspect LossOfControlFrame高
                nameplateSelfBottomInset = 0.3, -- 自己姓名板与屏幕底端的最少距离（默认0.2）
                nameplateSelfScale = 1, -- （默认1）
                nameplateSelfAlpha = 1, -- （默认0.75）
                nameplateMotion = 0, -- 姓名板排列方式
                -- 姓名板
                nameplateShowAll = '1', -- 显示所有姓名板
                nameplateShowEnemyMinus = '0', -- 不显示杂兵姓名板
                nameplateShowSelf = '1', -- 自己的姓名板
                nameplateGlobalScale = '1.2',
                nameplateMaxAlpha = '1.0',
                nameplateMaxAlphaDistance = '40', -- 与相机的距离
                nameplateMaxScale = '1.0',
                nameplateMaxScaleDistance = '10',
                nameplateMinAlpha = '1.0',
                nameplateMinAlphaDistance = '10', -- 与nameplateMaxDistance的距离
                nameplateMinScale = '0.8',
                nameplateMinScaleDistance = '10',
                nameplateSelectedScale = '1.2',
                nameplateSelectedAlpha = '1.0',
                nameplateLargerScale = '1.4',
                -- 注意大小写
                NamePlateHorizontalScale = '1.0',
                NamePlateVerticalScale = '1.3',
                NameplatePersonalShowAlways = '1',
                NameplatePersonalShowInCombat = '1',
                NameplatePersonalShowWithTarget = '1',
                NameplatePersonalHideDelaySeconds = '0',
                -- 团队界面配置
                useCompactPartyFrames = '1', -- 团队风格小队框体
                -- 地图
                questLogOpen = '0', -- 地图右侧显示任务
                mapFade = '0', -- 移动时地图透明
                -- 任务
                autoQuestWatch = '1', -- 接任务时自动追踪
                autoQuestProgress = '1', -- 任务更新时自动追踪
                -- 其它
                cameraDistanceMaxZoomFactor = '2.6', -- 镜头最远距离（15的倍数），最大2.6
                screenshotFormat = 'jpeg', -- png tga会有透明部分，无法解决
                screenshotQuality = '10',
                chatBubbles = '1',
                chatStyle = 'im',
                whisperMode = 'popout',
                statusText = '1',
                statusTextDisplay = 'BOTH', -- 姓名板显示状态文字
                showToastWindow = '0', -- 战网信息显示在浮窗中
                displaySpellActivationOverlays = '1', -- 法术警告
                spellActivationOverlayOpacity = '0.5', -- 法术警告透明度 默认0.65
                -- NPC姓名：敌对、任务及可互动的NPC
                UnitNameNPC = '0',
                UnitNameHostleNPC = '0',
                UnitNameFriendlySpecialNPCName = '0',
                UnitNameInteractiveNPC = '0',
                -- 总是比较物品
                alwaysCompareItems = 0,
                -- 浮动伤害数字
                WorldTextScale = '0.8', -- 增大字体
                floatingCombatTextFloatMode = 3, -- 1 = up, 2 = down, 3 = arc 没用
                -- floatingCombatTextCombatDamage是目标血条上的伤害数字，是单独的。别的指的是下方的状态文字，受enableFloatingCombatText控制，在设置里就有：“战斗”“滚动战斗记录”
                -- 幻化
                missingTransmogSourceInItemTooltips = '1',
                -- 帧数
                maxFPS = '30',
                maxFPSBk = '8',
                targetFPS = '30',
                -- 分辨率比例
                RenderScale = '0.5',
                -- 团队界面
                raidOptionDisplayPets = '1',
                raidFramesDisplayClassColor = '1',
                raidFramesHealthText = 'health',
                -- 卡顿问题
                GxAllowCachelessShaderMode = '0',
                -- 游戏内导航
                showInGameNavigation = '1',
                -- 姓名
                UnitNameFriendlyGuardianName = '0',
                UnitNameFriendlyMinionName = '0',
                UnitNameFriendlyPetName = '0',
                UnitNameFriendlyPlayerName = '0',
                UnitNameFriendlyTotemName = '0',
                UnitNameEnemyGuardianName = '0',
                UnitNameEnemyMinionName = '0',
                UnitNameEnemyPetName = '0',
                UnitNameEnemyPlayerName = '0',
                UnitNameEnemyTotemName = '0'
            }
        ) do
            C_CVar.SetCVar(k, v)
        end
    end
)

-- 隐藏账户成就，含义貌似反了
ShowAccountAchievements(true)

-- 反向整理背包
C_Container.SetSortBagsRightToLeft(true)

-- 检查目标玩家
-- 战场target敌人报错
--[[
Message: ...rd_AchievementUI/Mainline/Blizzard_AchievementUI.lua:748: Usage: GetCategoryNumAchievements(categoryID, includeSuperceded)
Time: Fri Aug 23 14:40:42 2024
Count: 8
Stack: ...rd_AchievementUI/Mainline/Blizzard_AchievementUI.lua:748: Usage: GetCategoryNumAchievements(categoryID, includeSuperceded)
[string "@Interface/AddOns/Blizzard_AchievementUI/Mainline/Blizzard_AchievementUI.lua"]:748: in function `AchievementFrameComparison_UpdateStatusBars'
[string "@Interface/AddOns/Blizzard_AchievementUI/Mainline/Blizzard_AchievementUI.lua"]:2732: in function <...rd_AchievementUI/Mainline/Blizzard_AchievementUI.lua:2728>

Locals: id = "summary"

]]
-- local function player_string(name, realm, class)
--     -- 玩家链接字符串格式：https://wow.gamepedia.com/PlayerString
--     -- 对于realm相同，UnitName返回nil而GetPlayerInfoByGUID返回""
--     local fname = (not realm or realm == '') and name or string.format('%s-%s', name, realm)
--     local _, _, _, color = GetClassColor(class) -- 失败返回的color为ffffffff
--     return string.format('|c%s|Hplayer:%s|h%s|h|r', color, fname, fname)
-- end
-- BananaRegisterEvent(
--     'PLAYER_TARGET_CHANGED',
--     function(event, ...)
--         local uid = 'target'
--         if not UnitIsPlayer(uid) then
--             return
--         end
--         local name, realm = UnitName(uid)
--         local descr = player_string(name, realm, UnitClassBase(uid))
--         descr = descr .. string.format(' 荣誉%d', UnitHonorLevel(uid))
--         local guild, grank, gindex = GetGuildInfo(uid)
--         if guild then
--             descr = descr .. string.format(' %s%d阶%s', guild, gindex, grank)
--         end
--         SendSystemMessage(descr)
--         ClearAchievementComparisonUnit()
--         SetAchievementComparisonUnit(uid) -- 继续比较成就
--     end
-- )
-- BananaRegisterEvent(
--     'INSPECT_ACHIEVEMENT_READY',
--     function(event, guid)
--         local _, class, _, _, _, name, realm = GetPlayerInfoByGUID(guid)
--         SendSystemMessage(string.format('%s 成就%d', player_string(name, realm, class), GetComparisonAchievementPoints()))
--     end
-- )

-- 删掉世界地图左下方的追踪圆
-- Interface\AddOns\Blizzard_UIPanels_Game\Mainline\WorldMapFrameTemplates.xml:117
-- Interface\AddOns\Blizzard_UIPanels_Game\Mainline\WorldMapBountyBoard.lua:574
-- Interface\AddOns\Blizzard_WorldMap\Blizzard_WorldMap.lua:126
--[[ 偶尔会弹出ADDON_ACTION_BLOCKED错误，堆栈信息如下，强烈怀疑是此处代码的污染
1x [ADDON_ACTION_BLOCKED] 插件 'BananaPrivate' 尝试调用保护功能 'Button:SetPassThroughButtons()'。
[string "@!BugGrabber/BugGrabber.lua"]:485: in function <!BugGrabber/BugGrabber.lua:485>
[string "=[C]"]: in function `SetPassThroughButtons'
[string "@Blizzard_MapCanvas/MapCanvas_DataProviderBase.lua"]:224: in function `CheckMouseButtonPassthrough'
[string "@Blizzard_MapCanvas/Blizzard_MapCanvas.lua"]:209: in function `AcquirePin'
[string "@Blizzard_SharedMapDataProviders/BonusObjectiveDataProvider.lua"]:97: in function <...haredMapDataProviders/BonusObjectiveDataProvider.lua:92>
[string "=[C]"]: in function `xpcall'
[string "@Blizzard_ObjectAPI/Mainline/AsyncCallbackSystem.lua"]:76: in function `FireCallbacks'
[string "@Blizzard_ObjectAPI/Mainline/AsyncCallbackSystem.lua"]:35: in function <.../Blizzard_ObjectAPI/Mainline/AsyncCallbackSystem.lua:31>
[string "=[C]"]: in function `accessor'
[string "@Blizzard_ObjectAPI/Mainline/AsyncCallbackSystem.lua"]:52: in function `AddCallback'
[string "@Blizzard_ObjectAPI/Mainline/AsyncCallbackSystem.lua"]:60: in function `AddCancelableCallback'
[string "@Blizzard_SharedMapDataProviders/BonusObjectiveDataProvider.lua"]:92: in function `RefreshAllData'
[string "@Blizzard_SharedMapDataProviders/BonusObjectiveDataProvider.lua"]:65: in function `OnEvent'
[string "@Blizzard_MapCanvas/MapCanvas_DataProviderBase.lua"]:99: in function `SignalEvent'
[string "@Blizzard_MapCanvas/Blizzard_MapCanvas.lua"]:106: in function <...aceBlizzard_MapCanvas/Blizzard_MapCanvas.lua:105>
[string "=[C]"]: in function `secureexecuterange'
[string "@Blizzard_MapCanvas/Blizzard_MapCanvas.lua"]:109: in function `OnEvent'
[string "@Blizzard_WorldMap/Blizzard_WorldMap.lua"]:148: in function <...rfaceBlizzard_WorldMap/Blizzard_WorldMap.lua:147>
Locals:
_ = Frame {
}
event = "ADDON_ACTION_BLOCKED"
events = <table> {
}
]]
-- local activity_tracker
-- for i, v in ipairs(WorldMapFrame.overlayFrames) do
--     if v.BountyDropdown then
--         activity_tracker = v
--         break
--     end
-- end
-- if activity_tracker then
--     activity_tracker:UnregisterAllEvents()
--     activity_tracker:SetScript('OnEvent', nil)
--     activity_tracker.Refresh = function()
--     end
--     activity_tracker:Hide()
-- end

-- 聊天设置
-- Interface\AddOns\Blizzard_ChatFrame\Mainline\ChatConfigFrame.lua:16
-- Interface\AddOns\Blizzard_ChatFrame\Mainline\ChatConfigFrame.lua:1255
-- 那个FCF_GetCurrentChatFrame()很恶心，直接用ChatFrame1就行了
-- Interface\AddOns\Blizzard_ChatFrameBase\Mainline\ChatFrame.lua:3037
-- Interface\AddOns\Blizzard_ChatFrameBase\Mainline\FloatingChatFrame.xml:629
-- 需要两个步骤：一、调用Chat Window节的API增删改消息组，二、每个消息组对应一个或多个事件，register/unregister之，对应关系位于全局表ChatTypeGroup，于Interface\AddOns\Blizzard_ChatFrameBase\Mainline\ChatFrame.lua:157，其中也定义了一系列一并操作的辅助函数
-- ChatFrame_RemoveAllMessageGroups辅助函数并没有清空.messageTypeList，却放在了ChatFrame_UnregisterAllMessageGroups里清空，这是一个明显的代码缺陷，所以我不调用它们
-- 注意ChatConfigFrame.lua:238定义的CHAT_CONFIG_OTHER_PVP，type是显示名，后面IsListeningForMessageType里的参数才是消息组名，大部分显示名=消息组名，但CHAT_CONFIG_OTHER_PVP里的不是
local my_message_type_list = {}
hooksecurefunc(
    'ChatFrame_RegisterForMessages',
    function(frame, ...)
        if frame == ChatFrame1 then
            -- DevTools_Dump(frame.messageTypeList)
            -- 清空当前所有的
            for _, mg in pairs(frame.messageTypeList) do
                RemoveChatWindowMessages(frame:GetID(), mg)
                for _, ev in pairs(ChatTypeGroup[mg]) do
                    frame:UnregisterEvent(ev)
                end
            end
            -- 增加我需要的
            frame.messageTypeList = {'SAY', 'EMOTE', 'YELL', 'ACHIEVEMENT', 'BN_WHISPER', 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER', 'MONSTER_SAY', 'MONSTER_EMOTE', 'MONSTER_YELL', 'MONSTER_WHISPER', 'MONSTER_BOSS_EMOTE', 'MONSTER_BOSS_WHISPER', 'COMBAT_XP_GAIN', 'COMBAT_HONOR_GAIN', 'COMBAT_FACTION_CHANGE', 'SKILL', 'LOOT', 'CURRENCY', 'MONEY', 'BG_HORDE', 'BG_ALLIANCE', 'BG_NEUTRAL', 'SYSTEM', 'ERRORS', 'IGNORED', 'CHANNEL', 'BN_INLINE_TOAST_ALERT', 'PET_BATTLE_INFO', 'PING'}
            for _, mg in pairs(frame.messageTypeList) do
                AddChatWindowMessages(frame:GetID(), mg)
                for _, ev in pairs(ChatTypeGroup[mg]) do
                    frame:RegisterEvent(ev)
                end
            end
        end
    end
)
hooksecurefunc(
    'ChatFrame_RegisterForChannels',
    function(frame, ...)
        LeaveChannelByName('综合')
        LeaveChannelByName('交易')
        LeaveChannelByName('本地防务')
        LeaveChannelByName('服务')
    end
)

-- 增加我需要的buff提示
-- BananaRegisterEvent(
--     'SPELL_ACTIVATION_OVERLAY_SHOW',
--     function(event, spell_id, texture, positions, scale, r, g, b)
--         print(event, texture)
--     end
-- )
-- BananaRegisterEvent(
--     'UNIT_AURA',
--     function(event, unit, info)
--         print(event, unit)
--         DevTools_Dump(info)
--     end
-- )
-- Interface\AddOns\Blizzard_BuffFrame\Mainline\BuffFrame.lua:172
-- 钩子这个函数是个好的选择，能准确知道什么时候需要更新
-- local function for_each_aura_slot(_, ...)
--     for i = 1, select('#', ...) do
--         local slot = select(i, ...)
--         local aura = C_UnitAuras.GetAuraDataBySlot('player', slot) -- 返回值为table，内存占用很大
--         -- print(slot, aura.icon, aura.name, aura.spellId)
--     end
-- end
-- hooksecurefunc(BuffFrame, 'Update', function()
--     -- print('BuffFrame:Update()')
--     for_each_aura_slot(C_UnitAuras.GetAuraSlots('player', 'HELPFUL'))
-- end)

-- BananaRegisterEvent('PLAY_MOVIE', print)
-- MovieFrame:EnableMouse(true)
-- hooksecurefunc(
--     MovieFrame,
--     'StartMovie',
--     function(self, movie_id, looping)
--         self:EnableMouse(true)
--         self.CloseDialog:Show()
--     end
-- )
-- -- /run MovieFrame_PlayMovie(MovieFrame, 962)有光标，但是任务弹出的没有，EnableMouse也没用，只有CloseDialog显示才有，这里让其处于显示状态但不用它
-- MovieFrame:SetScript('OnKeyUp', nil)
-- MovieFrame.CloseDialog:ClearAllPoints()
-- MovieFrame.CloseDialog:SetPoint('BOTTOM', MovieFrame, 'TOP')

-- 注意Cinematic是直接在WorldFrame上面渲染的，没有外部调用接口，CinematicFrame只是控制其关闭的空架子，可以通过WorldFrame:SetPoint('BOTTOMRIGHT', -80, 80)改变WorldFrame位置验证，注意WorldFrame的TOPLEFT无法变动。
-- CinematicFrame:ClearAllPoints()
-- CinematicFrame:SetPoint('TOP')
-- CinematicFrame:SetSize(800, 600)
-- CinematicFrame:UnregisterAllEvents()

-- 防离，没用了，内部也有倒计时，无法禁用
-- BananaRegisterEvent(
--     'PLAYER_CAMPING',
--     function()
--         StaticPopup_Hide('CAMP')
--     end
-- )
-- BananaHookStaticPopup(
--     'CAMP',
--     function(which, dialog) -- CAMP：返回角色选择对话框
--         StaticPopup_Hide('CAMP')
--     end
-- )
-- ChatFrame_AddMessageEventFilter(
--     'CHAT_MSG_SYSTEM',
--     function(self, event, text, ...)
--         -- 因长时间没有动作，将自动退出游戏。如果你希望继续游戏，请点击取消键。
--         -- 你现在处于离开状态：离开
--         -- 你不再处于离开状态。
--         return text:find(IDLE_MESSAGE)
--     end
-- )

-- 放大任务文本
-- Interface\AddOns\Blizzard_UIPanels_Game\Mainline\QuestInfo.xml
-- Interface\AddOns\Blizzard_UIPanels_Game\Mainline\ItemTextFrame.xml
local simplehtml_text_types = {'h1', 'h2', 'h3', 'p'}
local function adjust_font_size(widget, diff)
    local widget_type = widget:GetObjectType()
    local font_file, height, flags
    if widget_type == 'FontString' then
        font_file, height, flags = widget:GetFont()
        widget:SetFont(font_file, height + diff, flags)
    elseif widget_type == 'SimpleHTML' then
        for _, text_type in ipairs(simplehtml_text_types) do
            -- print(text_type)
            font_file, height, flags = widget:GetFont(text_type) -- 可能会返回nil, 0, ''
            if font_file then
                widget:SetFont(text_type, font_file, height + diff, flags)
            end
        end
    end
end
for _, widget in ipairs({QuestInfoTitleHeader, QuestInfoQuestType, QuestInfoObjectivesText, QuestInfoRewardText, QuestInfoRequiredMoneyText, QuestInfoGroupSize, QuestInfoAnchor, QuestInfoDescriptionHeader, QuestInfoObjectivesHeader, QuestInfoDescriptionText, QuestInfoAccountCompletedNotice, ItemTextPageText}) do
    adjust_font_size(widget, 3)
end

-- 异步化测试
function async(f)
    return function(...)
        local co = coroutine.create(f)
        local ret = {true, ...}
        while coroutine.status(co) ~= 'dead' do
            ret = {coroutine.resume(co, unpack(ret, 2))}
        end
        return unpack(ret, 2)
    end
end
await = coroutine.yield
local function sleep(secs)
    local co = coroutine.running()
    local done = false
    local ret = nil
    C_Timer.After(
        secs,
        function()
            done = true
            ret = secs
            if coroutine.status(co) == 'suspended' then
                print('resume', coroutine.resume(co))
            end
        end
    )
    if not done then
        coroutine.yield(secs)
    end
    return ret
end
local function test_async()
    coroutine.wrap(
        function()
            print('thread1', sleep(1))
            print('thread1', sleep(1))
            print('thread1', sleep(1))
        end
    )()
    coroutine.wrap(
        function()
            print('thread2', sleep(1.8))
            print('thread2', sleep(1.8))
            print('thread2', sleep(1.8))
        end
    )()
end

-- 防止重复声音测试
local sound_handle
local function test_sound()
    local is_playing = sound_handle and C_Sound.IsPlaying(sound_handle)
    print(is_playing)
    if not is_playing then
        _, sound_handle = PlaySoundFile(568274)
    end
end

-- 测试延长副本进度
local function test_instance()
    for i = 1, GetNumSavedInstances() do
        print(GetSavedInstanceInfo(i))
    end
end
local extended_label = UIParent:CreateFontString(nil, 'BACKGROUND', 'GameTooltipText')
extended_label:SetPoint('TOPLEFT', UIParent, 'CENTER', 256, -256)
local function update_extended_label()
    for i = 1, GetNumSavedInstances() do
        local name, _, reset, difficulty_id, _, extended, _, _, _, difficulty_name, _, _, _, instance_id = GetSavedInstanceInfo(i)
        if instance_id == 1762 and difficulty_id == 23 then -- 诸王之眠
            -- 参考 Interface\AddOns\Blizzard_RaidFrame\RaidFrame.lua:136
            extended_label:SetText(string.format('%s %s %s %s', name, difficulty_name, SecondsToTime(reset, true, nil, 1), extended and EXTENDED or ''))
        end
    end
end
local function extend_instance()
    for i = 1, GetNumSavedInstances() do
        local name, _, reset, difficulty_id, _, extended, _, _, _, difficulty_name, _, _, _, instance_id = GetSavedInstanceInfo(i)
        if instance_id == 1762 and difficulty_id == 23 and not extended then -- 诸王之眠
            SetSavedInstanceExtend(i, true)
        end
    end
    RequestRaidInfo() -- 触发UPDATE_INSTANCE_INFO事件
end
BananaRegisterEvent('PLAYER_ENTERING_WORLD', extend_instance)
BananaRegisterEvent('BOSS_KILL', extend_instance)
BananaRegisterEvent('UPDATE_INSTANCE_INFO', update_extended_label)

local test_button = CreateFrame('Button', nil, ChatFrame1, 'UIPanelButtonTemplate')
test_button:SetText('test')
test_button.tooltipText = 'test'
test_button:SetSize(56, 24)
test_button:SetPoint('BOTTOMRIGHT', ChatFrame1, 'TOPRIGHT', 0, 0)
test_button:SetScript('OnClick', test_instance)

local aura_tex = UIParent:CreateTexture()
aura_tex:SetSize(64, 64)
aura_tex:SetPoint('CENTER', 256, 0)
aura_tex:SetTexture('Interface\\Icons\\INV_Misc_QuestionMark')
-- aura_tex:SetAlpha(0.65)
-- 显示酒仙的“活力苏醒”，可用函数C_UnitAuras.GetAuraDataBySpellName('player', '活力苏醒')获得spell_id
local function toggle_aura_display(spell_id)
    if C_UnitAuras.GetPlayerAuraBySpellID(spell_id) then
        local texture = C_Spell.GetSpellTexture(spell_id)
        aura_tex:SetTexture(texture)
        -- SetPortraitToTexture(aura_tex, texture)
        aura_tex:Show()
    else
        aura_tex:Hide()
    end
end
BananaRegisterEvent(
    'UNIT_AURA',
    function(event, unit_target, update_info)
        if unit_target == 'player' then
            toggle_aura_display(392883)
        end
    end
)
toggle_aura_display(392883)

-- 取消一些过场动画
BananaRegisterEvent(
    'CINEMATIC_START',
    function()
        local name, _, _, _, _, _, _, instance_id, _, _ = GetInstanceInfo()
        if instance_id == 1762 or instance_id == 2070 then -- 诸王之眠，达萨罗之战
            print(name, CANCEL, CINEMATICS)
            CinematicFrame_CancelCinematic()
        end
    end
)

-- 取消一些电影
hooksecurefunc(
    'MovieFrame_PlayMovie',
    function(frame, index)
        local name, _, _, _, _, _, _, instance_id, _, _ = GetInstanceInfo()
        if instance_id == 2070 then -- 达萨罗之战
            print(index, 'stop')
            frame:StopMovie()
        end
    end
)

-- 自动确认一些对话框
--  如果hook对话框GOSSIP_CONFIRM，直接dialog.button1:Click()，会弹出错误“bad argument #1 to '?' (Usage: C_GossipInfo.SelectOption(optionID [, text, confirmed]))”
-- 原因在于Interface\AddOns\Blizzard_UIParent\Mainline\UIParent.lua：1919先show了再设置dialog.data，致使我hook的show里面dialog.data为空
BananaRegisterEvent(
    'GOSSIP_CONFIRM',
    function(event, gossip_id, text, cost)
        local name, _, _, _, _, _, _, instance_id, _, _ = GetInstanceInfo()
        if gossip_id == 49426 then -- “确定要离开这个副本吗？”
            if instance_id == 1841 then -- 地渊孢林
                print(name, INSTANCE_LEAVE)
                -- 参考 Interface\AddOns\Blizzard_StaticPopup_Frame\Mainline\StaticPopup.lua:3373
                C_GossipInfo.SelectOption(gossip_id, '', true)
            end
        elseif gossip_id == 50645 then -- 达萨罗之战公主对话
            if instance_id == 2070 then
                print(name, CONTINUE)
                -- 参考 Interface\AddOns\Blizzard_StaticPopup_Frame\Mainline\StaticPopup.lua:3373
                C_GossipInfo.SelectOption(gossip_id, '', true)
            end
        elseif gossip_id == 52077 or gossip_id == 52078 then -- 史诗达萨罗之战联盟一开始跳过
            if instance_id == 2070 then
                print(name, CONTINUE)
                -- 参考 Interface\AddOns\Blizzard_StaticPopup_Frame\Mainline\StaticPopup.lua:3373
                C_GossipInfo.SelectOption(gossip_id, '', true)
            end
        end
    end
)

-- 备忘
UIParent:CreateFontString('BananaMemosText', 'BACKGROUND', 'SystemFont_OutlineThick_Huge4')
BananaMemosText:SetPoint('LEFT')
BananaMemosText:SetWidth(768)
BananaMemosText:SetJustifyH('LEFT')
BananaRegisterEvent('PLAYER_LOGIN', function()
    memos = memos or ""
    BananaMemosText:SetText(memos)
end)