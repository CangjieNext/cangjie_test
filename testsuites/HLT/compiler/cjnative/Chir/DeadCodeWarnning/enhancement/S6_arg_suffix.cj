// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_arg_suffix] 实参后缀: 首位 Nothing 实参
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6（后缀根主范围=第二个 next(); 2026-09-20 新 SDK 实测 call1+hint2 与官方 nothing_first_argument SCAN-IN 完全一致(call@15:5+hint@15:21+hint@16:5), 升 A; 旧 0911 0 warning 为发散口径）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"
// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64): Int64 { first + second + third }

main() {
    consume(stop(), next(), next())
    println("dead after call")
}
