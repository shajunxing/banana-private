BananaClassTalent.PALADIN = function(player)
    return {
        -- 神圣
        '',
        -- 防护，专注敌意和飞舞之盾可以共存，专注敌意为翻译错误，实际效果是只命中1目标时伤害翻倍，正义之锤替代祝福之锤，因为单体伤害高得多
        -- https://bbs.nga.cn/read.php?tid=40173164
        'CIEA5ba6OK14IUITjS1kSUVJctNzYG2MMzYMzyyMmZmZZMDAAADAAAAAAAtlZGzgZGDmZJAADMDwMYbAAAmZab2mtZACsZGMgFMMYA',
        -- 惩戒
        ''
    }
end

BananaClassMacro.PALADIN = function(player)
    return {
        ['跑'] = '#showtooltip\n' .. player.transform_on_mount .. '/cast [combat][indoors] 神圣马驹\n/cast [nogroup,noform:1] !十字军光环\n/use [spec:1] !大领主的英勇战马\n/use [spec:2] !大领主的警戒战马\n/use [spec:3] !大领主的复仇战马\n',
        ['防护'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [known:正义之锤] reset=6 !审判,!奉献,!正义之锤,!审判,!正义之锤,!奉献,!审判,!正义之锤\n/castsequence [known:祝福之锤] reset=6 !审判,!奉献,!祝福之锤,!审判,!祝福之锤,!奉献,!审判,!祝福之锤\n/cast [mod] 清算之手\n/cast [combat] 正义盾击\n',
        ['飞盾'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 复仇者之盾\n/use [combat] 13\n/use [combat] 14\n',
        ['光'] = '#showtooltip\n/cast [@player]荣耀圣令\n',
        ['打断'] = '#showtooltip\n/castsequence reset=12 责难,盲目之光\n',
        ['惩戒'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence reset=9 审判,十字军打击,奉献,十字军打击\n/use [combat] 13\n/use [combat] 14\n',
        ['神1'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence reset=9 审判,十字军打击,奉献,十字军打击\n/use [combat] 13\n/use [combat] 14\n',
        ['神2'] = '#showtooltip\n/castsequence reset=6 神圣震击,圣光闪现,圣光术,圣光闪现\n',
        ['防爆'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [known:圣洁鸣钟,known:提尔之眼] reset=60 圣洁鸣钟,提尔之眼\n/cast [known:圣洁鸣钟] 圣洁鸣钟\n/cast [known:提尔之眼] 提尔之眼\n'
    }
end

BananaClassBar.PALADIN = function(player)
    return {
        -- 神圣
        {
            [1] = {'黎明之光', '神圣', '荣耀圣令', nil, player.recommend_mount, nil, nil, nil, nil, nil, nil, nil},
            [61] = {'圣光闪现', '正义盾击', '制裁之锤', nil, '圣盾术', '圣疗术', nil, nil, nil, nil, nil, nil}
        },
        -- 防护
        {
            [1] = {'飞盾', '防护', '光', '打断', '跑', '清毒术'},
            [61] = {'圣光闪现', '圣洁鸣钟', '制裁之锤', nil, '圣盾术', '保护祝福', '圣疗术'}
        },
        -- 惩戒
        {
            [1] = {'十字军打击', '审判', '奉献', '荣耀圣令', player.recommend_mount, nil, nil, nil, nil, nil, nil, nil},
            [61] = {'圣光闪现', '正义盾击', '制裁之锤', nil, '圣盾术', '圣疗术', nil, nil, nil, nil, nil, nil}
        },
        -- 无天赋
        [5] = {
            [1] = {'十字军打击', '审判', '奉献', '荣耀圣令', player.recommend_mount, nil, nil, nil, nil, nil, nil, nil},
            [61] = {'圣光闪现', '正义盾击', '制裁之锤', nil, '圣盾术', '圣疗术', nil, nil, nil, nil, nil, nil}
        }
    }
end
