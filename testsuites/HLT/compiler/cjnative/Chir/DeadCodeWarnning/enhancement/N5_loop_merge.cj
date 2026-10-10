// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N5_loop_merge] 循环合流未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N5（至少一次迭代可达且体内有可达写入 → 循环后未知）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    var value = 0
    for (index in 0..3) {
        value += index
    }
    if (value < 0) {
        println("post-loop branch")
    }
}
