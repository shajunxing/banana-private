BananaClassTalent.DEATHKNIGHT = function(player)
    return {
        -- 鲜血（活力分流+符文分流）
        'CoPAtbMOTHlnKIwUyAn+DK70SjZMYGMzMzMDjxMz0MjxMGzYGAAAAAmZMYMDzMzMzAAAYmZmZGAAAwMLbjhxMmtGbLLDT2GG2AYGzA',
        -- 冰霜
        'CsPAtbMOTHlnKIwUyAn+DK70SPGAzgZmZmZYMmZmZmxYGZGzYAMzMmhZmZmZmZbmBAAAAAAAAAAAYssNLmlZYsxwyMbTDNjNMjZMDA',
        -- 邪恶（去掉溃烂之伤）
        'CwPAtbMOTHlnKIwUyAn+DK70SDAzgZmZmZsMGjZ0wYGzMjZAAAAAAAAAYwMjhZGAwsZmZmtxMzMDzYMYZmFzMzoZ2WY2Y2mGLAYmBA'
    }
end

BananaClassMacro.DEATHKNIGHT = function(player)
    return {
        ['跑'] = '#showtooltip\n' .. player.transform_on_mount .. '/use [nocombat,outdoors] !' .. player.recommend_mount .. '\n/cast [combat][indoors] 死亡脚步\n',
        ['血'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence reset=6 精髓分裂,血液沸腾,心脏打击,心脏打击,血液沸腾\n/cast [mod] 黑暗命令\n/cast [combat] 活力分流\n/cast [combat] 亡者复生\n/use [combat] 13\n/use [combat] 14\n',
        ['血握'] = '#showtooltip\n/cast [@player] 血魔之握\n',
        ['凋零'] = '#showtooltip\n/cast [@player] 枯萎凋零\n',
        -- 符文打击是未选择专精的基础技能
        ['符打'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 符文打击\n/cast [combat] 亡者复生\n/use [combat] 13\n/use [combat] 14\n',
        ['灵打'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 灵界打击\n',
        ['死握'] = '#showtooltip\n/cast 死亡之握\n/cast 战争践踏(种族特长)\n',
        ['领域'] = '#showtooltip\n/cast [@player] 反魔法领域\n',
        ['邪'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 天灾打击\n/use [combat] 13\n/use [combat] 14\n',
        ['大便'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 凋零缠绕\n',
        ['邪爆'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast [@pet,noexists] 亡者复生\n/cast 黑暗突变\n',
        ['冰'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/castsequence reset=combat,6 湮灭,凛风冲击\n/cast [combat] 冰霜之柱\n/cast [combat] 符文武器增效\n/cast [combat] 亡者复生\n/use [combat] 13\n/use [combat] 14\n',
        ['严冬'] = '#showtooltip\n/castsequence [@player] reset=20 冷酷严冬,枯萎凋零,冷酷严冬,枯萎凋零,冷酷严冬\n',
    }
end

BananaClassBar.DEATHKNIGHT = function(player)
    return {
        -- 血
        [1] = {
            [1] = {'凋零', '血', '灵打', '心灵冰冻', '跑', nil, nil, nil, nil, nil, nil, '冰霜之路'},
            -- 左下动作条
            [61] = {'反魔法护罩', '死握', '窒息', nil, '吸血鬼之血', '冰封之韧', '巫妖之躯'}
        },
        -- 冰
        [2] = {
            [1] = {'严冬', '冰', '灵打', '心灵冰冻', '跑', nil, nil, nil, nil, nil, nil, '冰霜之路'},
            -- 左下动作条
            [61] = {'反魔法护罩', '死握', '窒息', nil, '冰封之韧', '巫妖之躯'}
        },
        -- 邪
        [3] = {
            [1] = {'凋零', '邪', '大便', '心灵冰冻', '跑', nil, nil, nil, nil, nil, nil, '冰霜之路'},
            [61] = {'邪爆', '死握', '窒息', nil, '反魔法护罩', '冰封之韧', '巫妖之躯'}
        },
        -- 无天赋状态
        [5] = {}
    }
end
