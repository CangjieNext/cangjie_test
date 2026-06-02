/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A{
    interface B{} 
}

class C <: A.B{}

func test(): Int64 {
    var i : A.B = C()
    var res = match (i) {
        case i : A.B => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
