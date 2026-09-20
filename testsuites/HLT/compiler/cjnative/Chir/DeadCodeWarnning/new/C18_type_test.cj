// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C18_type_test] 直接构造动态类型 is 判定
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C18
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

open class Base {}
class Derived <: Base {}
class Sibling <: Base {}

main() {
    let value = Derived()
    if (value is Base) {
        println("base")
    } else {
        println("dead supertype else")
    }

    if (value is Sibling) {
        println("dead sibling branch")
    }
}
