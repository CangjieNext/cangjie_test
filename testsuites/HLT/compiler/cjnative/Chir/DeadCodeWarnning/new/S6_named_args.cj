// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_named_args] 命名实参按形参声明顺序求值
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6（first/second 在 third 前求值; third 为声明序末位 → 调用内无后缀，仅后继 1 条; 2026-09-20 新 SDK 实测一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consumeNamed(first!: Int64, second!: Int64, third!: Int64): Int64 {
    first + second + third
}

main() {
    consumeNamed(third: stop(), first: next(), second: next())
    println("dead after named call")
}
