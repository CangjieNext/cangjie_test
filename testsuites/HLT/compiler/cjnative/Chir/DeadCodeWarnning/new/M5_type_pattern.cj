// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M5_type_pattern] 类型 pattern 覆盖与 sibling 继续
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M5（_: Base 覆盖 _: Derived → 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

open class Base {}
class Derived <: Base {}
class Sibling <: Base {}

func classify(value: Base): Int64 {
    match (value) {
        case _: Base => 0
        case _: Derived => 1
    }
}

main() {
    println(classify(Derived()))
}
