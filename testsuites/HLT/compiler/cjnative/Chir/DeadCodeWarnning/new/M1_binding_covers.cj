// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M1_binding_covers] binding/通配符覆盖
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M1（binding 覆盖全部值; 后续 sibling 各 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_unreachable_pattern"

main() {
    match (1) {
        case binding => println(binding)
        case 1 => println("covered constant")
        case _ => println("covered wildcard")
    }
}
