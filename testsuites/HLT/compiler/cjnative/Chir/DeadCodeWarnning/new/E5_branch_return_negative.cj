// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E5_branch_return_negative] 分支内 return 不构成 do-while 全转移
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E5 反例（return 位于 if 分支内时 CFG 保留未进入分支的边，循环可继续 → 后继可达 0 warning; 本 SDK 0 warning 与规格一致）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

func value(flag: Bool): Int64 {
    do {
        if (flag) {
            return 0
        }
    } while (true)
    return 1
}

main() {
    println(value(true))
}
