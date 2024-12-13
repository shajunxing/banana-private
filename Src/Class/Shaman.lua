BananaClassTalent.SHAMAN = function(player)
    return {
        '',
        '',
        'CgQAYp+JUk5Lea12OyacsLNThAAAAAAAAAAAYmZmZWGWGzMzMbzCGjNsMWswYGLasMzGTmJsZmBMzyMGysww0YMmZxMbzMzYjtxyYGAAwA'
    }
end

BananaClassMacro.SHAMAN = function(player)
    return {
        ['跑'] = '#showtooltip\n/cast [nocombat,outdoors,@player] 水上行走\n/use [nocombat,outdoors] !' .. player.recommend_mount .. ';!幽魂之狼\n',
        ['狼'] = '#showtooltip\n/cast !幽魂之狼\n',
        ['净化'] = '#showtooltip\n/cast [harm] 净化术\n/cast 净化灵魂\n',
        ['恢复'] = (function()
            -- 27级治疗波
            if player.level < 27 then
                return '#showtooltip\n/castsequence reset=6 !激流,治疗之涌,治疗之涌,治疗之涌\n'
            else
                return '#showtooltip\n/castsequence reset=6 !激流,治疗波,治疗链,治疗波\n'
            end
        end)(),
        ['灵魂'] = '#showtooltip\n/cast [@player] 灵魂链接图腾\n',
        ['火震'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast 烈焰震击\n',
        ['闪电'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast [nomod] 闪电箭\n/cast [mod] 闪电链\n/cast [combat] 流星\n/cast [combat] 风暴之眼\n/use [combat] 13\n/use [combat] 14\n',
        ['电链'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 闪电链\n/cast [combat] 流星\n/cast [combat] 风暴之眼\n/use [combat] 13\n/use [combat] 14\n',
        ['熔岩'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/petattack\n/cast 熔岩爆裂\n',
        ['冰震'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nomod] 冰霜震击\n/cast [mod] 闪电链\n/cast [combat] 流星\n/cast [combat] 风暴之眼\n/use [combat] 13\n/use [combat] 14\n',
        ['地震'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [@cursor] 地震术\n',
        ['电能'] = '#showtooltip\n/cast [@player] 电能图腾\n',
        ['狂风'] = '#showtooltip\n/cast [@player] 狂风图腾\n',
        ['视界'] = '#showtooltip\n/cast !视界术\n',
        ['嗜血'] = '#showtooltip\n/cast [known:嗜血] 嗜血\n/cast [known:英勇] 英勇\n',
        -- 灵魂连接图腾由低等级号施放会让高等级号瞬间空血bug，用别的替代
        ['先祖'] = '#showtooltip\n/cast [known:先祖护佑图腾,@player] 先祖护佑图腾\n/cast [known:大地之墙图腾,@player] 大地之墙图腾\n',
        ['泉'] = '#showtooltip\n/castsequence [@player] reset=22 !治疗之泉图腾,!治疗之雨\n', -- 要加感叹号，否则治疗之泉图腾放不出来，涌动图腾副本里各种放不出来，“没有可行进的路径”
    }
end

BananaClassBar.SHAMAN = function(player)
    return {
        -- 元素
        {},
        -- 增强
        {},
        -- 恢复
        {
            [1] = {'熔岩', '电链', '火震', '风剪', '跑', '净化', '雷霆风暴', nil, '天怒', '幽魂步', '狂风', '水上行走'},
            [61] = {'恢复', '泉', '电能图腾', nil, '星界转移', '土元素', '先祖', '治疗之潮图腾', '法力之潮图腾', '清毒图腾', '嗜血'}
        }
    }
end
