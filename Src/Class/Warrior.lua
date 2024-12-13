BananaClassTalent.WARRIOR = function(player)
    return {
        -- 武器
        -- 'CcEAAAAAAAAAAAAAAAAAAAAAAAgtZmZmZmxMz2AzAAAAgBTDzYsYMDMzyMYgZYMjhZYAAAAAAAwMDmZGAZGGLLzmZ2GWMMMzMTb0MAb-LVL-CALak5xFA/qEZymUrOV6ToO6gwQlGe+g5QCLXYoYyCRb4AK0jCQcERSGNUGfFbXvZ1GG82ocNXq8IzlKTC95TnORm8IzmIheE',
        -- 雷霆+撕裂，放弃旋风斩
        'CcEAmidFBOBFf5oKuZ7r/WeW7AgtZMzMzMmZ2GYGAAAAMYaYmZsNjZgZ2mBDMDDMMDAAAAAAAwMDmZGglMDjltBWADYGmQGMsB',
        -- 狂怒
        '',
        -- 防护
        'CkEAmidFBOBFf5oKuZ7r/WeW7YkZAAAAYmZmZmZGMbmFDz2CjBNzYMzMAz2MYAzYYMMDAAAAAAAmZAgZZZDAGYBWWMaMDgZJWY2A'
    }
end

BananaClassMacro.WARRIOR = function(player)
    return {
        ['跑'] = '#showtooltip\n' .. player.transform_on_mount .. '/cast [nocombat,outdoors] 战斗怒吼\n/use [nocombat,outdoors] !' .. player.recommend_mount .. '\n/cast [combat][indoors] 英勇飞跃\n',
        ['乘胜'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 乘胜追击\n/cast 冲锋\n/cast [combat] 无视苦痛\n/cast [combat] 致命平静\n',
        ['冲锋'] = '#showtooltip\n/cast [help] 援护;冲锋\n/cast 断筋\n',
        ['盾猛'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 盾牌猛击\n/cast [mod] 嘲讽\n/cast [combat] 盾牌格挡\n/cast [combat,group] 无视苦痛\n/cast [combat] 法术反射\n/use [combat] 13\n/use [combat] 14\n',
        ['拳击'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 拳击\n/cast 英勇投掷\n',
        ['斩杀'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 斩杀\n/cast 冲锋\n',
        ['致死'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [known:顺劈斩] 顺劈斩;致死打击\n',
        ['压制'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 压制\n/cast [combat] 法术反射\n/cast [combat] 无视苦痛\n/use [combat] 13\n/use [combat] 14\n',
        ['旋风'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [known:顺劈斩] 顺劈斩;旋风斩\n',
        ['晕'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence reset=40 风暴之锤,震荡波\n',
    }
end

BananaClassBar.WARRIOR = function(player)
    return {
        -- 武器
        {
            [1] = {'雷霆一击', '压制', '致死', '拳击', '跑', '英勇飞跃', nil, nil, nil, '无视苦痛', '冲锋', '战斗怒吼'},
            [61] = {'乘胜', '斩杀', '风暴之锤', nil, '横扫攻击', '剑在人在', '集结呐喊', '苦痛免疫', '狂暴之怒'}
        },
        -- 狂怒
        {
            [1] = {},
            [61] = {}
        },
        -- 防护
        {
            [1] = {'雷霆一击', '盾猛', '复仇', '拳击', '跑', '英勇飞跃', nil, nil, '挑战怒吼', '嘲讽', '冲锋', '战斗怒吼'},
            [61] = {'乘胜', '斩杀', '晕', '地精滑翔器工具包', '挫志怒吼', '狂暴之怒', '破釜沉舟', '盾墙', '集结呐喊', '苦痛免疫'}
        },
        -- 无天赋
        [5] = {
            [1] = {'英勇投掷', '猛击', '斩杀', nil, '跑'},
            [61] = {'乘胜追击', '冲锋'}
        }
    }
end
