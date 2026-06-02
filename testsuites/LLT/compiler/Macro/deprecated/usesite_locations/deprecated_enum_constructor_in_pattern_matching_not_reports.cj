// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan 
// ASSERT: scan 

enum Enum {
    EnumA
    | @Deprecated
    EnumB
    | @Deprecated EnumC(Bool)
}

main() {}

func foo(e: Enum) {
    match (e) {
        case EnumA => ()
        case EnumB => ()
        case EnumC(false) => ()
        case _ => ()
    }
}

// Deprecation diagnostic should not be ignored in right part of `case`
func boo(e: Enum) {
    let _ = match (e) {
        case EnumA => EnumB
        case EnumB => throw Exception()
        case EnumC(false) => EnumC(true)
        case _ => throw Exception()
    }
}

