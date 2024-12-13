BananaClassTalent.EVOKER = function(player)
    return {
        -- 湮灭
        'CsbBV7//nP39x/JJympTqouKSAAAAAAAAAAAAzMmhxsMzMYmxMMmZyYmpZYWmxMzMzMsNDgZwMDGDAYwGsMGNWGQmJAbYG',
        -- 恩护
        'CwbBV7//nP39x/JJympTqouKSAAAAAAmZmZMMzMMzMYmhNjhBAAYmxMMmx0YmZAAAAmZmmhZmBjBAG2GziFWswAzMN0MGWMA',
        ''
    }
end

BananaClassMacro.EVOKER = function(player)
    return {
        ['跑'] = '#showtooltip\n/cast [nocombat,outdoors] 青铜龙的祝福\n/use [nocombat,outdoors] !' .. player.recommend_mount .. '\n/cast [combat][indoors] 悬空\n',
        ['活化'] = '#showtooltip\n/cast [spec:1,@player] 活化烈焰\n/cast [spec:2] 活化烈焰\n',
        ['翡翠'] = '#showtooltip\n/cast [@player] 翡翠之花\n',
        ['碧蓝'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [spec:1,nochanneling] 碧蓝打击\n/cast [spec:2,nochanneling] 活化烈焰\n',
        ['葬火'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [spec:1,nochanneling,nomod] 葬火\n/cast [spec:1,nochanneling,mod] 裂解\n/cast [spec:2,nochanneling] 裂解\n',
        ['吐息'] = '#showtooltip\n/targetenemy [noharm][dead]\n/startattack\n/cast [channeling:火焰吐息] 火焰吐息\n/cast [channeling:永恒之涌] 永恒之涌\n/cast [channeling:梦境吐息] 梦境吐息\n/castsequence [spec:1,nochanneling] reset=30 火焰吐息,永恒之涌\n/castsequence [spec:2,nochanneling] reset=30 火焰吐息,梦境吐息\n'
    }
end

BananaClassBar.EVOKER = function(player)
    local class_bars = {
        -- 湮灭
        [1] = {
            [1] = {'吐息', '碧蓝', '葬火', '镇压', '跑', '山崩', nil, nil, nil, '翱翔', '扫尾', '飞翼打击'},
            [61] = {'活化', '翡翠', '深呼吸', nil, '灼烧之焰', '黑曜鳞片', '守护巨龙之怒', nil, nil, '青铜龙的祝福', '幻容', '面随心动'}
        },
        -- 恩护
        [2] = {
            [1] = {'吐息', '碧蓝', '葬火', '镇压', '跑', '自然平衡', '微风', nil, nil, '翱翔', '扫尾', '飞翼打击'},
            [61] = {'活化', '翡翠', '深呼吸', '青翠之拥', '灼烧之焰', '回溯', '守护巨龙之怒', nil, nil, '青铜龙的祝福', '幻容', '面随心动'}
        },
        -- 无天赋状态
        [5] = {}
    }
    return class_bars
end
