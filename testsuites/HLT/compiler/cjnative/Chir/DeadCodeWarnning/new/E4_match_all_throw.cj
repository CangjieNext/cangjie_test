// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E4_match_all_throw] 穷举 match 全 throw
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E4; 2026-09-20 新 SDK 实测 1 条与本断言一致，升 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func fail(flag: Bool) {
    match (flag) {
        case true => throw Exception()
        case false => throw Exception()
    }
    println("dead after all-throw match")
}

main() {
    fail(true)
}
