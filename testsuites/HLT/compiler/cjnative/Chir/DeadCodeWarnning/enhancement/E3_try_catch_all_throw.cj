// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E3_try_catch_all_throw] try/catch 全 throw
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E3（catch 可达性 = 显式 throw 路径按源码顺序+类型 pattern 分派; 2026-09-20 新 SDK 实测 1 条与本断言一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func fail() {
    try {
        throw Exception()
    } catch (_: Exception) {
        throw Exception()
    }
    println("dead after all-throw try")
}

main() {
    fail()
}
