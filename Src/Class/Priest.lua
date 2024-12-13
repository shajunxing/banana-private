BananaClassTalent.PRIEST = function(player)
    return {
        '',
        -- 神圣
        'CEQAJSbRac/22NxZbHdYKOQzcAAAAAAAAYZWMGzMDmZmBmxMMzyMzAAAAAMmlZbYjZYmFGzMzMGjllBmRZBAYmFLTmFDAZMYD',
        -- 暗影
        'CIQAJSbRac/22NxZbHdYKOQzcMMDGDAAAAAAAAAAAAwYGmZZgZbmZmZGjZWGYbYmZMzyYWMgZMLLD1MAMDgZWsM1sYAIjxCA'
    }
end

BananaClassMacro.PRIEST = function(player)
    return {
        ['跑'] = '#showtooltip\n/cast [spec:3,noform] !暗影形态\n/cast [nocombat,outdoors,@player] 真言术：韧\n/use [nocombat,outdoors] !大祭司的光誓寻觅者\n/cast [combat,@player][indoors,@player] 天堂之羽\n',
        ['漂浮'] = '#showtooltip\n/cast [@player] 漂浮术\n',
        ['韧'] = '#showtooltip\n/cast [@player] 真言术：韧\n',
        ['净化'] = '#showtooltip\n/cast [harm] 驱散魔法\n/cast [spec:1/2] 纯净术;净化疾病\n',
        ['群驱'] = '#showtooltip\n/cast [@player] 群体驱散\n',
        ['震爆'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 心灵震爆\n',
        ['惩击'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [spec:2,mod] 神圣新星;惩击\n/use [combat] 13\n/use [combat] 14\n',
        ['罚'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 圣言术：罚\n',
        ['触'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 吸血鬼之触\n',
        ['神圣'] = '#showtooltip\n/castsequence reset=16 快速治疗,治疗术\n',
        ['守护'] = '#showtooltip\n/cast [@player] 守护之魂\n',
        ['灌注'] = '#showtooltip\n/cast [@player] 能量灌注\n',
        ['灵'] = '#showtooltip\n/cast [@player] 圣言术：灵\n'
    }
end

BananaClassBar.PRIEST = function(player)
    return {
        -- 戒律
        {},
        -- 神圣
        {
            [1] = {'震爆', '惩击', '罚', '净化', '跑', '群驱', nil, nil, nil, nil, '渐隐术', '韧'},
            [61] = {'神圣', '圣言术：静', '灵', '漂浮', '绝望祷言', '守护', '灌注', '光晕', '神圣赞美诗', nil, '心灵尖啸'}
        },
        -- 暗影
        {
            [1] = {'触', '惩击', '震爆', '噬灵疫病', '跑', '净化', nil, nil, nil, nil, '渐隐术', '韧'},
            [61] = {'快速治疗', '光晕', '心灵尖啸', '漂浮', '绝望祷言', '灌注', '暗影魔', nil, nil, nil, '消散'}
        }
    }
end
