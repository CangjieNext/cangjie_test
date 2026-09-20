// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M4_nested_option] 嵌套 Option 逐层约束
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M4（None/Some(None)/Some(Some(_)) 覆盖全部 constructor 组合）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

func classify(v: Option<Option<Int64>>): Int64 {
    match (v) {
        case None => 0
        case Some(None) => 1
        case Some(Some(_)) => 2
        case _ => 3
    }
}

main() {
    println(classify(Some(Some(1))))
}
