/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



struct R{
    public var r : Int32
}

class C{
    public var a : Int32
    public operator func test (inputA:A,inputB:A):A{ 
        var output = A(inputA.a + inputB.a)
        return output
    }
}

interface I{
    let a : Int32 = 1
    operator func test (inputA:A,inputB:A):A{ 
        var output = A(inputA.a + inputB.a)
        return output
    }
}

class T {

}

interface update{
    operator func test(a:This):This 
}


main():Int64{
    return 1
}
// ASSERT: scan parse_invalid_overloaded_operator
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_this_type_not_allow
