BananaClassTalent.ROGUE = function(player)
    return {
        'CMQAA0tw2gAD7pPTLoW5IGZDeYMzMzMzMDAAAAAAwywsNDAAAAAAZbmZGzMDmZmlZZMmZYMjxYGzitxMMYbmlBGzwWDLLDT2wwCA',
        '',
        ''
    }
end

BananaClassMacro.ROGUE = function(player)
    return {
        ['跑'] = '#showtooltip\n/use [nocombat,outdoors] !' .. player.recommend_mount .. ';疾跑\n',
        ['消失'] = '#showtooltip\n/cast 暗影斗篷\n/cast 闪避\n/cast 消失\n',
        ['刺行'] = '#showtooltip\n/cast [nocombat] !潜行;猩红风暴\n',
        ['刺杀'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast 刀扇\n/startattack\n/cast [combat,@focus] 嫁祸诀窍\n/use [combat] 13\n/use [combat] 14\n',
        ['刺终'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 割裂\n',
        ['打断'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 脚踢\n/cast 剧毒之刃\n'
    }
end

BananaClassBar.ROGUE = function(player)
    return {
        -- 刺杀
        {
            [1] = {'刺行', '刺杀', '刺终', '打断', '跑', nil, nil, nil, nil, nil, nil, nil},
            [73] = {'闷棍', '伏击', '搜索', '潜伏帷幕', '跑', '疾跑', nil, nil, nil, nil, nil, nil},
            [61] = {'猩红之瓶', '暗影步', '毒刃', nil, '佯攻', '死亡印记', '夺命药膏', '减速药膏', '致伤药膏', '迟钝药膏', '消失'}
        },
        -- 狂徒
        {},
        -- 敏锐
        {},
        -- 1-9级
        [5] = {}
    }
end
