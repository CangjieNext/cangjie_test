/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o ./pkgb.%middle 2>&1  | compare %f




// 对权限访问受限的成员变量自增减，编译报错
package pkga

func foo(){
    Base().a1++
}

 class Base {
    protected let a1: Int32 = 0
    protected let a2 :Int32 = 0
    private let b1: Int32 = 0
    private let b2:Int32 = 0
    public init(x:Int32){
        a2 = x
    }
}

public class Data <: Base {
    public var a1: Int32 = 10
    public let b1: Int32 = 10
    public let c1: Int32 = 10
    public static let d1: Int32 = 10
    public var m:Int32 = 1
    public init(x:Int32){
        super(x)
        this.c1++
        super.b1++ 
        d1++
    }
    public func get():Int32{
        this.c1++ 
        c1++ 
        d1++ 
        return 0
    }
}

struct Red {
    public var a1: Int32 = 10
    public let b1: Int32 = 10
    public let c1: Int32 = 10
    public var m:Int32 = 1
    public init(x:Int32){
        this.c1++
    }
    public func get():Int32{
        this.c1++ 
        c1++ 
        return 0
    }
}

interface Ice {
    var a1: Int32 = 10
    let b1: Int32 = 10
    let c1: Int32 = 10
    var m:Int32 = 1
    func get():Int32{
        c1++ 
        a1++
        return 0
    }
}
// ASSERT: scan parse_unexpected_declaration_in_scope
