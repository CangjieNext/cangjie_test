// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C13_loop_write_unknown] 循环体内写入使循环体条件未知 → 0 warning
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C13（写入前位置同样记未知; 期望 0）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    var number = 1
    while (number < 2) {
        if (number < 0) {
            println("before-write branch")
        }
        number++
        if (number < 0) {
            println("after-write branch")
        }
    }
}
