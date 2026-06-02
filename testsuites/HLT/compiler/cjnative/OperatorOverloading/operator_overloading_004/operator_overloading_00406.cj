/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



struct A{
    public let a : Int32 = 1
}

class C{
    public let a : Int32 = 1
}

interface I{
    let a : Int32 = 1
}

operator func + (inputB:A):Bool{ 
    return true
}

operator func + (inputB:C):Bool{ 
    return true
}

operator func + (inputB:I):Bool{ 
    return true
}

class B <: I{}

main():Int64{
    let a = A()
    let b = B()
    let c = C()
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_illegal_modifier_in_scope
