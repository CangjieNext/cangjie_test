// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S2_throw] throw 后继（含调用者 catch 形态）
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S2（throw 规则对调用者存在 catch 的场景仍适用）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func fail() {
    throw Exception()
    println("dead after throw")
}

func failWithCallerCatch() {
    try {
        fail()
    } catch (e: Exception) {
        println("caller catches")
    }
    throw Exception()
    println("dead after caller throw")
}

main() {
    try {
        fail()
    } catch (e: Exception) {
    }
}
