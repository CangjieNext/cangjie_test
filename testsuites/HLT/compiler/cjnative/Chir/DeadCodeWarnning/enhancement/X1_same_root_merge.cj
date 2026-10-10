// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X1_same_root_merge] 同一 source root 的 continuation 只报最细
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 模型接口1（同根合并——新 SDK 形态: 最细粒度根立诊断, 外围只留 hint 不重复; 2026-09-20 实测 hint@C5+call@C13+hint@C29 共 3 项(外层根 hint 即后继区域提示, 后继行不另立), 与 S6 族定式一致, 升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func combine(first: Int64, second: Int64): Int64 { first + second }
func consume(first: Int64, second: Int64, third: Int64): Int64 { first + second + third }

main() {
    consume(combine(stop(), next()), next(), next())
    println("dead successor")
}
