// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C19_selected_result] 已选选择表达式结果传播
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C19（else 分支 1 条 + 第二个 if then 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var selected = if (true) {
        1
    } else {
        2
    }
    if (selected != 1) {
        println("dead selected-value branch")
    }
}
