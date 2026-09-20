// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M2_ctor_covers] constructor 参数与前序 pattern 覆盖
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M2（Some(_) 覆盖 Some(1) + selector 已知 constructor 排除 None → 2 条; 本 SDK 实测 sema+chir 各 1）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"
// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

main() {
    let value = Option<Int64>.Some(1)
    match (value) {
        case Some(_) => println("some")
        case Some(1) => println("covered constructor")
        case None => println("nonmatching constructor")
    }
}
