// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_range_step] range step 表达式 Nothing
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6 range 行（规格完整口径另含 unreachable 'call'+后继; 本 SDK 单条 hint 形态已实测）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func rangeCase(): Int64 {
    1..2 : (return 0)
    return 1
}

main() {
    println(rangeCase())
}
