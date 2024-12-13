BananaClassTalent.DRUID = function(player)
    return {
        -- 平衡
        '',
        -- 野性
        'CcGAvcQZXENQPQXqed372Hg2KCAAAAAADL2Mz2MzwMLWMzsNzMzMzMAAAAAALNYMzMDjxYamxgBjZGAAAAAAgBAYAAQACAmtZ2aWmZbDjZMA',
        -- 守护
        'CgGAvcQZXENQPQXqed372Hg2KCAAAAAAAAAAAAzYmZMMjFzYMjZzYGmFLDwMMMzYimZmhZGjZYjBAAAAAAMMDwyyMbYMLjATBAgAsxMzAA',
        -- 恢复
        ''
    }
end

BananaClassMacro.DRUID = function(player)
    return {
        ['跑'] = (function()
            if player.level < 20 then
                return '#showtooltip\n/cast [@player] 野性印记\n/use !' .. player.recommend_mount .. '\n'
            else
                return '#showtooltip\n/cancelaura [nocombat] 树皮术\n/cast [noform:3,outdoors][noform:3,swimming] 旅行形态\n/cast [noform:2/3,indoors][form:3,noflying] 猎豹形态\n/cast [form:2,indoors] 熊形态\n'
            end
        end)(),
        ['坐骑'] = '#showtooltip\n/cast [@player] 野性印记\n/use !' .. player.recommend_mount .. '\n',
        ['潜行'] = '#showtooltip\n/cancelaura 树皮术\n/cast [known:影遁,combat] !影遁\n/cast [nocombat] !潜行\n',
        ['日月'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [known:阳炎术] reset=target,combat,9 阳炎术,月火术\n/cast [noknown:阳炎术] 月火术\n/use [combat] 13\n/use [combat] 14\n',
        -- 星涌术跟碧玉疾风一样有重置casesequence的bug
        ['星涌'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [known:星涌术] 星涌术;愤怒\n',
        ['月火'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 月火术\n',
        ['野行'] = '#showtooltip\n/cast [noform:2,nocombat] 猎豹形态\n/cast [form:2,nocombat,nostealth] !潜行\n/cast [form:2,stealth] 斜掠\n/castsequence [form:2,combat,nochanneling] reset=25 激变蜂群,万灵之召\n',
        ['野性'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast [stealth,nochanneling] 斜掠\n/cast [nostealth,nochanneling]横扫\n/startattack\n/cast [combat,nochanneling] 猛虎之怒\n/use [combat,nochanneling] 13\n/use [combat,nochanneling] 14\n',
        ['野终'] = '#showtooltip\n/targetenemy [noharm][dead]\n/cast [nochanneling] 原始之怒\n',
        ['守行'] = '#showtooltip\n/cancelaura [nocombat] 树皮术\n/cast [noform:2,nocombat] 猎豹形态\n/cast [form:2,nocombat,nostealth] !潜行\n/cast [form:2,stealth] 斜掠\n/cast [form:2,combat] 撕碎\n/cast [form:1,combat] 痛击\n/cast [form:1,combat] 铁鬃\n/use [combat] 13\n/use [combat] 14\n',
        ['守护'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nocombat] 横扫\n/castsequence [combat] reset=3 裂伤,横扫,!月火术,!痛击\n/cast [mod] 低吼\n/cast [combat] 铁鬃\n/cast [combat] 树皮术\n/use [combat] 13\n/use [combat] 14\n',
        ['熊'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nocombat] 横扫\n/castsequence [combat] reset=6 !痛击,裂伤,横扫,横扫\n/cast [mod] 低吼\n/use [combat] 13\n/use [combat] 14\n',
        ['重殴'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [known:重殴] 重殴\n/cast [known:野性力量] 野性力量\n',
        ['缠绕'] = '#showtooltip\n/cast [known:群体缠绕,@player] 群体缠绕\n/cast [known:乌索尔旋风,@player] 乌索尔旋风\n',
        ['自疗'] = '#showtooltip\n/cast [@player] 愈合\n'
    }
end

BananaClassBar.DRUID = function(player)
    local class_bars = {
        -- 平衡
        [1] = {},
        -- 野性
        [2] = {
            [1] = {'猎豹形态', '日月', '星涌', '纠缠根须', '跑', '愈合', '清除腐蚀'},
            -- 猫形态
            [73] = {'野行', '野性', '野终', '迎头痛击', '跑', '愈合', '清除腐蚀'},
            -- 熊形态
            [97] = {'猎豹形态', '熊', '野性力量', '迎头痛击', '跑', '愈合', '清除腐蚀'},
            -- 枭兽形态
            [109] = {},
            -- 左下动作条
            [61] = {'愈合', '野性冲锋', '台风', nil, '树皮术', '甘霖', '狂暴', '生存本能', '狂奔怒吼', '急奔', '坐骑'}
        },
        -- 守护
        [3] = {
            [1] = {'猎豹形态', '熊形态', '熊形态', '熊形态', '跑', '自疗', '清除腐蚀'},
            -- 猫形态
            [73] = {'守行', '熊形态', '熊形态', '熊形态', '跑', '自疗', '清除腐蚀'},
            -- 熊形态
            [97] = {'守行', '守护', '月火', '迎头痛击', '跑', '自疗', '清除腐蚀'},
            -- 左下动作条
            [61] = {'狂暴回复', '野性冲锋', '缠绕', nil, '甘霖', '生存本能', nil, nil, '狂奔怒吼', '急奔', '坐骑'}
        },
        -- 恢复
        [4] = {},
        -- 无天赋状态
        [5] = {
            [1] = {'猎豹形态', '日月', '星涌', nil, '坐骑'},
            -- 猫形态
            [73] = {'潜行', '日月', '星涌', nil, '坐骑'},
            -- 左下动作条
            [61] = {'愈合', '纠缠根须'}
        }
    }
    return class_bars
end
