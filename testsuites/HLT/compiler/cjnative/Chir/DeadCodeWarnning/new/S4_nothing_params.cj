// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S4_nothing_params] Nothing 形参生成 unreachable function
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S4（每形参各 1 条 unreachable function，主范围=形参名; body 0 warning; 官方 29 例无此锚，talkless 补盲）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_function"
// ASSERT: scan-0 "DiagKind": "chir_dce_unreachable_expression_hint"

func consume(first: Nothing, second: Nothing) {
    println("body")
}

main() {}
