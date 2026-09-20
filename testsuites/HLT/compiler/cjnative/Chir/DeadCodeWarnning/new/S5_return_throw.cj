// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S5_return_throw] return 后随 throw 子表达式
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 规格 §4 控制转移表达式（throw 作 return 的子表达式——throw 求值即离开, return 不可达）; 2026-09-20 新 SDK 实测 0 warning(旧 0911 报 1 条 hint) → 规格要求警告缺失 bug 证据(与 S5_nested_transfer 同族: 控制转移表达式作子表达式整体漏报); 保持规格口径 Tier-B 留证
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func throwOnly(): Int64 {
    return throw Exception("t")
}

main() {
    try {
        println(throwOnly())
    } catch (e: Exception) {
        println("caught")
    }
}
