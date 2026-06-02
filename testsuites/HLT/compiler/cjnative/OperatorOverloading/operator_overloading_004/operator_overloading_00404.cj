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
    public func test(){
        operator func + (inputB:A):Bool{
          return true
        }
        return
    }
}

class C{
    public let a : Int32
    public func test(){
        operator func + (inputB:C):Bool{
          return true
        }
        return
    }
    public init(a:Int32) {
        this.a = a
    }
}

interface I{
    let a : Int32 = 1
    static func test(){
        operator func + (inputB:I):Bool{
          return true
        }
        return
    }
}

class B <: I{}

main():Int64{
    let a = A(1)
    let b : I = B()
    let c = C()
     if (a+a && b+b && c+c) { 
        return 1
    }
    return 0
}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_unexpected_declaration_in_scope
