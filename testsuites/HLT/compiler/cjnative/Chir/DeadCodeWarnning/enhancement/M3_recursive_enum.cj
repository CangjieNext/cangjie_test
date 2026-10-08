// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M3_recursive_enum] 递归 enum 按constructor 集合穷举
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M3（enum/单 constructor/重载/递归 enum 均按 constructor 集合判断）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

enum Tree {
    | Leaf
    | Node(Int64, Tree)
}

func classify(t: Tree): Int64 {
    match (t) {
        case Leaf => 0
        case Node(_, _) => 1
        case _ => 2
    }
}

main() {
    println(classify(Tree.Leaf))
}
