// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N12_where_false] for-in where 过滤 0 warning
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N12（where false 使体内写入不进入循环后合流; 有限 range 同时为空时 C14 仍报 1 条——交互形态见 C14_where_false_interplay）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    for (number in 0..3 where false) {
        println(number)
    }

    let values = [1, 2, 3]
    for (value in values where false) {
        println(value)
    }
}
