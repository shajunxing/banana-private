BananaClassTalent.MONK = function(player)
    return {
        -- 酒仙，注意切喉手是必须的，团本boss很多需要打断施法
        'CwQAqCjoPBi1F5zHY9mx8hvRaCAAAAGDzMYmlZeglZmZGDAAAAAAwCjRMzAzYGLGYZGzwsNmZsMbmYWmFYGLAAwysMtMbzsMAABBMzMYB',
        -- 织雾
        '',
        -- 踏风
        ''
    }
end

BananaClassMacro.MONK = function(player)
    return {
        ['跑'] = '#showtooltip\n' .. player.transform_on_mount .. '/use [nocombat,outdoors] !班禄，大宗师的伙伴;滚地翻\n',
        ['火焰'] = '#showtooltip\n/cast 火焰之息\n',
        -- ["酒仙"] = "#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [nochanneling] reset=4 幻灭踢,醉酿投,神鹤引项踢,幻灭踢,猛虎掌,神鹤引项踢,醉酿投,幻灭踢,神鹤引项踢,旭日东升踢\n/cast [mod] 嚎镇八方\n/cast [combat] 活血酒\n/cast [combat] 醉上加醉\n/use [combat] 13\n/use [combat] 14\n",
        -- ['酒仙'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [nochanneling] reset=4 幻灭踢,醉酿投,神鹤引项踢,幻灭踢,神鹤引项踢,旭日东升踢,幻灭踢,醉酿投,神鹤引项踢,移花接木\n/cast [mod] 嚎镇八方\n/cast [combat,nochanneling] 活血酒\n/use [combat,nochanneling] 13\n/use [combat,nochanneling] 14\n',
        ['酒仙'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [nochanneling] reset=5 幻灭踢,醉酿投,神鹤引项踢,幻灭踢,神鹤引项踢,幻灭踢,醉酿投,旭日东升踢,幻灭踢,神鹤引项踢\n/cast [mod] 嚎镇八方\n/cast [combat,nochanneling] 活血酒\n/use [combat,nochanneling] 13\n/use [combat,nochanneling] 14\n',
        ['打断'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence reset=15 切喉手,分筋错骨\n',
        ['禅意'] = '#showtooltip\n/dismount\n/cast !禅意飞行\n',
        ['神鹤'] = '#showtooltip\n/cast [nochanneling:神鹤引项踢] 神鹤引项踢\n',
        ['织雾'] = '#showtooltip\n/cast [nochanneling:抚慰之雾] 抚慰之雾\n/castsequence [channeling:抚慰之雾] reset=combat,12 氤氲之雾,活血术\n',
        ['旭日'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 旭日东升踢\n',
        ['碎玉'] = '#showtooltip\n/cast [nochanneling] 碎玉闪电\n',
        ['自疗'] = '#showtooltip\n/cast [known:天神酒,combat] 天神酒;活血术\n'
    }
end

BananaClassBar.MONK = function(player)
    return {
        -- 酒仙
        {
            [1] = {'轮回之触', '酒仙', '活血术', '打断', '跑', '迅如猛虎', '清创生血', nil, nil, nil, '魂体双分', '魂体双分：转移'},
            [61] = {'自疗', '碎玉', '扫堂腿', nil, '壮胆酒', nil, nil, nil, nil, nil, '禅意'}
        },
        -- 织雾
        {},
        -- 踏风
        {}
    }
end
