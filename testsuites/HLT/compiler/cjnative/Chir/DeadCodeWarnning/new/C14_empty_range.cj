// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C14_empty_range] 空 for-in: body block + 写入保持进入前值
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C14（空 range body 1 条; 不可达 body 写入保持 0 → 后续 if 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var value = 0
    for (_ in 0..0) {
        value = 1
    }
    if (value != 0) {
        println("dead post-loop branch")
    }
}
