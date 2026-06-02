/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A{
    public let a : Int32
    public operator func + (inputB:A):A 
}

class C{
    public let a : Int32
    public operator func + (inputB:C):C 
    public init(a : Int32){
        this.a = a
    }
}

interface I{
    let a : Int32 = 1
    operator func + (inputB:I):I
}

class B <: I{} 

main():Int64{
    var a = A(1)
    var b = A(-1)
    var c = C(1)
    var d = C(-1)
    var e : I = B()
    return 1
}
// ASSERT: scan parse_missing_body
// ASSERT: scan parse_unexpected_declaration_in_scope
