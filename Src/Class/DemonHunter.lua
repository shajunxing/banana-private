BananaClassTalent.DEMONHUNTER = function(player)
    return {
        -- 浩劫
        'CEkAEDLOxe3SEPP2R8Hw6bhoSYmBzMjZMzMjZmJMzAAAAAAAmlxMMDGLzMzGWmxMGzyw2CsNLmxwsopBzMmBb',
        -- 复仇（去掉咒符和烙印）
        'CUkAEDLOxe3SEPP2R8Hw6bhoSAAMjZmZMzMkZmBDAmZmZbmZmZMzYmZmlZmZZMDzgBAAAAYbWMjhZRTDMjZYD'
    }
end

BananaClassMacro.DEMONHUNTER = function(player)
    return {
        -- 邪能冲撞=地狱火撞击
        ['跑'] = '#showtooltip\n/cast [nocombat,outdoors] !' .. player.recommend_mount .. ';邪能冲撞\n',
        ['滑翔'] = '/dismount\n/cast !滑翔\n',
        ['变形'] = '#showtooltip\n/cast [@player] 恶魔变形\n',
        ['浩劫'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/castsequence [nochanneling] reset=6,combat 投掷利刃,刃舞\n',
        ['刃舞'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 刃舞\n/use [combat,nochanneling] 13\n/use [combat,nochanneling] 14\n',
        ['混打'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 混乱打击\n',
        ['眼棱'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [spec:1,nochanneling] 眼棱\n/cast [spec:2,nochanneling] 邪能毁灭\n',
        ['利刃'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 投掷利刃\n/cast [mod] 折磨\n',
        -- 恶魔之咬=裂魂=破裂
        ['咬'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [nochanneling] 恶魔之咬\n/cast [mod] 折磨\n/cast [combat] 恶魔尖刺\n/use [combat] 13\n/use [combat] 14\n',
        -- ["复防"] = "#showtooltip\n/castsequence [known:烈火烙印,known:灵魂切削,nochanneling] reset=60 烈火烙印,邪能毁灭,灵魂切削\n/castsequence [known:烈火烙印,nochanneling] reset=60 烈火烙印,邪能毁灭\n/castsequence [known:灵魂切削,nochanneling] reset=60 灵魂切削,邪能毁灭\n/cast [nochanneling] 邪能毁灭\n",
        ['献祭'] = '#showtooltip\n/castsequence [spec:1,@player,nochanneling] reset=24 献祭光环,烈焰咒符\n/castsequence [spec:2,@player,nochanneling] reset=12 献祭光环,烈焰咒符\n',
        ['烈焰'] = '#showtooltip\n/cast [@player,nochanneling] 烈焰咒符\n',
        ['悲苦'] = '#showtooltip\n/cast [@player,nochanneling] 悲苦咒符\n'
    }
end

BananaClassBar.DEMONHUNTER = function(player)
    return {
        -- 浩劫
        {
            [1] = {'献祭', '刃舞', '混打', '瓦解', '跑', '复仇回避', nil, nil, nil, nil, nil, '幽灵视觉'},
            [61] = {'眼棱', '利刃', '混乱新星', '滑翔', '疾影', '变形'}
        },
        -- 复仇
        {
            [1] = {'献祭', '咬', '混打', '瓦解', '跑', '悲苦', nil, nil, nil, nil, nil, '幽灵视觉'},
            [61] = {'眼棱', '利刃', '混乱新星', '滑翔', '烈火烙印', '变形'}
        }
    }
end
