BananaClassTalent.MAGE = function(player)
    return {
        -- 奥术
        'C4DAjd9IgsSkCmGQ8vOmZtyV7AMmFjZgZxMmxgx0Mz2MDAAAAAgBCYmZaZ2WmBAiNAAAAAAAgZMmZmZYYmZMMmZGzMzYGD',
        -- 火焰
        '',
        -- 冰霜
        'CAEAjd9IgsSkCmGQ8vOmZtyV7AMmFjZgZxMmxQjxMz2MjBDzMzMzMzwMzMzMzYYMzyMNzsNLQAAQLAAAAAAYAAAAAAAAA'
    }
end

BananaClassMacro.MAGE = function(player)
    return {
        ['跑'] = '#showtooltip\n/stopcasting\n/stopcasting\n/stopattack\n/petfollow\n/cast [nocombat,outdoors,@player] 奥术智慧\n/use [nocombat,outdoors] !大法师的棱光飞碟;闪现术\n',
        ['缓落'] = '#showtooltip\n/cast [@player] 缓落术\n',
        -- ["净化"] = "#showtooltip\n/cast [harm] 法术吸取\n/cast 解除诅咒\n",
        ['盾'] = '#showtooltip\n/cast [spec:1] 棱光护体\n/cast [spec:2] 烈焰护体\n/cast [spec:3] 寒冰护体\n',
        ['奥冲'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 奥术冲击\n/use [combat,nochanneling] 13\n/use [combat,nochanneling] 14\n',
        ['魔爆'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 魔爆术\n\n',
        ['飞弹'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 奥术飞弹\n',
        ['弹幕'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 奥术弹幕\n',
        ['智慧'] = '#showtooltip\n/cast [@player] 奥术智慧\n',
        ['冰枪'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 冰枪术\n',
        ['冰箭'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 寒冰箭\n/use [combat] 13\n/use [combat] 14\n',
        ['冰暴'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 冰风暴\n'
    }
end

BananaClassBar.MAGE = function(player)
    return {
        -- 奥术
        {
            [1] = {'魔爆', '奥冲', '弹幕', '法术反制', '跑', '冰霜新星', '冲击波', nil, nil, nil, '造餐术', '智慧'},
            [61] = {'盾', '飞弹', '奥术宝珠', '缓落', '镜像', '时间扭曲', nil, nil, nil, '寒冰屏障', '隐形术'}
        },
        -- 火焰
        {},
        -- 冰霜
        {
            [1] = {'冰暴', '冰箭', '冰枪', '法术反制', '跑', '冰霜新星', nil, nil, nil, nil, '造餐术', '智慧'},
            [61] = {'盾', '暴风雪', '寒冰宝珠', '缓落', '冰冷血脉', '镜像', '时间扭曲', nil, '寒冰屏障', '急速冷却', '隐形术'}
        },
        [5] = {
            [1] = {'魔爆', '冰箭', '火冲', '法术反制', '艾什阿达，晨曦使者', '冰霜新星', '闪现术', nil, '治疗石', '魔法汉堡', '造餐术', '智慧'},
            [61] = {nil, nil, nil, '缓落术', nil, nil, nil, nil, nil, nil, '隐形术', nil}
        }
    }
end
