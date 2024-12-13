BananaClassTalent.HUNTER = function(player)
    return {
        -- 兽王
        'C0PAjWdaYGhrXhCioy+K0kCnAassNjZmNGT2YWWmlGaGbAAAAAAYAAAAAAAgZYbmZYmZmZmZGzMmZGmhJzYmxMzMDzwMMMmZGjhZYGD',
        -- 射击，副本天赋，不带宝宝
        'C4PAjWdaYGhrXhCioy+K0kCnAyADsNGN2GQmtYDAAAAAAYmZmZGzgxMzMMzMMzMLMmNAAAAAAAYYmZmZGzMz0MzMGGDjxgZGD',
        ''
    }
end

BananaClassMacro.HUNTER = function(player)
    return {
        ['跑'] = (function()
            if player.level <= 20 then
                return '#showtooltip\n/stopattack\n/stopattack\n/petfollow\n/use !' .. player.recommend_mount .. '\n'
            else
                return '#showtooltip\n/stopattack\n/stopattack\n/petfollow\n/use [spec:1] !狩猎大师的忠诚狼鹰\n/use [spec:2] !狩猎大师的恐怖狼鹰\n/use [spec:3] !狩猎大师的凶猛狼鹰\n'
            end
        end)(),
        ['鹰眼'] = '#showtooltip\n/cast !鹰眼术\n',
        -- 某些施法饰品会卡鼠标右键
        ['倒刺'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 倒刺射击\n',
        ['奥术'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 奥术射击\n',
        ['稳固'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 稳固射击\n',
        ['瞄准'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast [nochanneling] 瞄准射击\n',
        -- ["狂野"] = "#showtooltip\n/cast [@pet,noexists] 召唤宠物 1;/cast [@pet,exists] 狂野怒火\n",
        ['灵魂'] = '#showtooltip\n/cast [@player] 灵魂治愈(稀有技能)\n/cast 急奔\n',
        ['摔绊'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast 摔绊\n',
        ['急速'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast [nochanneling] 急速射击\n',
        ['夺命'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast [nochanneling] 夺命射击\n',
        ['生存'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/castsequence reset=4 猛禽一击,杀戮命令,猛禽一击,治疗宠物,杀戮命令,猛禽一击\n/cast [@pet] 误导\n/use [combat,@cursor] 13\n/use [combat,@cursor] 14\n', -- 野火炸弹会卡宏，加感叹号也不行 -- 鱼叉猛刺某些boss会暴毙
        ['治疗'] = '#showtooltip\n/cast [@pet,noexists] 召唤宠物 1\n/cast [@pet,dead] 复活宠物\n/cast 治疗宠物\n',
        ['狂怒'] = '#showtooltip\n/cast [@pet,noexists] 召唤宠物 1\n/cast [@pet,dead] 复活宠物\n/cast 狂野怒火\n',
        -- ['兽王'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/castsequence reset=6 杀戮命令,多重射击,!稳固射击,治疗宠物,杀戮命令,眼镜蛇射击,!稳固射击\n/cast [@pet] 误导\n/use [combat,@cursor] 13\n/use [combat,@cursor] 14\n',
        ['兽王'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/castsequence reset=6 杀戮命令,多重射击,倒刺射击,杀戮命令,眼镜蛇射击,眼镜蛇射击\n/cast [@pet] 误导\n/use [combat,@cursor] 13\n/use [combat,@cursor] 14\n',
        ['射击'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast [nochanneling] 多重射击\n/cast [@pet] 误导\n/use [combat,@cursor] 13\n/use [combat,@cursor] 14\n'
    }
end

BananaClassBar.HUNTER = function(player)
    return {
        -- 野兽控制
        {
            [1] = {'夺命', '兽王', '爆炸射击', '反制射击', '跑', '逃脱', '冰冻陷阱', nil, nil, nil, '宠物管理', '召唤宠物'},
            [61] = {'狂怒', '震荡射击', '胁迫', nil, '意气风发', '灵龟守护', nil, '装死', '假死', '伪装', '猎豹守护'}
        },
        -- 射击
        {
            [1] = {'瞄准', '射击', '急速', '反制射击', '跑', '逃脱', '冰冻陷阱', '焦油陷阱', '束缚射击'},
            [61] = {'百发百中', '照明弹', '胁迫', nil, '意气风发', '灵龟守护', '原始狂怒', nil, '假死', '伪装', '猎豹守护'}
        },
        -- 生存
        {
            [1] = {'夺命', '生存', '野火炸弹', '压制', '跑', '逃脱', '冰冻陷阱', nil, nil, nil, '宠物管理', '召唤宠物'},
            [61] = {'治疗', '鱼叉猛刺', nil, nil, '意气风发', '灵龟守护', nil, nil, '装死', '假死', '猎豹守护'}
        },
        -- 无天赋
        [5] = {
            [1] = {'猎人印记', '奥术', '稳固', '冰冻陷阱', '跑', '逃脱', nil, nil, nil, nil, '宠物管理', '召唤宠物'},
            [61] = {'治疗', nil, nil, nil, '意气风发', '灵龟守护', nil, nil, nil, nil, '猎豹守护', nil}
        }
    }
end
