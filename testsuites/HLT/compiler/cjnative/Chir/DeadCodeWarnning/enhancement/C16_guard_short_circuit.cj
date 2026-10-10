// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C16_guard_short_circuit] guard 内短路组合
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.2 C16 表（false&&/true||/Some?? 三形态）; 规格真口径=2 pattern+3 expression: match1 guard false → 整臂死, case _ 运行期可达(打印 b)不报 pattern、短路跳过的 sideEffect 报 1 expression; match2/match3 臂可达 → case _ 各 1 pattern、sideEffect 各 1 expression; 2026-09-20 新 SDK 实测 3 pattern+1 expression: match1 case _ 假阳性(与 C16_guard_false 同根)+短路右操作数只报 1 条 → 双向偏差 bug 证据, 保持真口径 Tier-B 留证
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_unreachable_pattern"
// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression"

func sideEffect(): Bool { true }

main() {
    match (3) {
        case 3 where false &&
            sideEffect() => println("a")
        case _ => println("b")
    }
    match (3) {
        case 3 where true ||
            sideEffect() => println("c")
        case _ => println("d")
    }
    match (Option<Int64>.Some(3)) {
        case Some(x) where Option<Bool>.Some(true) ??
            sideEffect() => println(x)
        case _ => println("e")
    }
}
