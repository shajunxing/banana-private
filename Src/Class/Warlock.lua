BananaClassTalent.WARLOCK = function(player)
    return {
        '',
        'CoQAA81jxQD71lYhS/t8p6HgAwMmZmZmZEMgZZmZmhFAAAAAAAAAAmZssMwAmgZYJkxGmZmxyMzYZMMYGMzMzMmZmZGAAA',
        ''
    }
end

BananaClassMacro.WARLOCK = function(player)
    return {
        ['跑'] = '#showtooltip\n/cancelaura [nocombat,outdoors] 爆燃冲刺\n/use [nocombat,outdoors] !' .. player.recommend_mount .. ';爆燃冲刺\n',
        ['吸血'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast [nochanneling:吸取生命] 吸取生命\n',
        ['暗箭'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast [nochanneling:吸取灵魂] 暗影箭\n/use [combat] 13\n/use [combat] 14\n',
        ['痛苦'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/castsequence [talent:2/3] reset=target,combat,6 痛楚,生命虹吸,腐蚀术\n/castsequence reset=target,combat,12 痛楚,痛苦无常\n/use [combat] 13\n/use [combat] 14\n',
        ['腐蚀'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast 腐蚀术\n',
        ['腐种'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast 腐蚀之种\n',
        ['古手'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast 古尔丹之手\n',
        ['魔箭'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cancelaura 爆燃冲刺\n/cast 恶魔之箭\n'
    }
end

BananaClassBar.WARLOCK = function(player)
    return {
        -- 痛苦
        {},
        -- 恶魔
        {
            [1] = {'魔箭', '暗箭', '古手', '能量虹吸', '跑', '生命通道', nil, nil, nil, '召唤仪式', '邪能统御', '召唤恶魔卫士'},
            [61] = {'吸血', '恐惧嚎叫', '恶魔掌控', nil, '不灭决心', '魔典：恶魔卫士', nil, nil, nil, '制造灵魂之井', '灵魂石'}
        },
        -- 毁灭
        {}
    }
end
