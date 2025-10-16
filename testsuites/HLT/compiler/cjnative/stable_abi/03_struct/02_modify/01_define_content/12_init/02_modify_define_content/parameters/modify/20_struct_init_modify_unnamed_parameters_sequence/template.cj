/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

const param1_1 = 1
const param1_2 = 1
const param1_3 = 1.0
public struct S1{
    public var a = 1
    public init(a1:Int64, a2:Int64){a = a1}
    init(a1:Int64, a2:UInt64, a3:Float64, a4:String){a = a1}
    const init(a1:Int64, a2:Int64, a3:Float64){a = a1}
    init(a1:Int64, a2:Float64, a3:Float64){a = a1}
    @Frozen
    public func foo1(){
        let x = S1(1, UInt64(1), 1.0, "init_foo")
    }
    public const func foo2(){
        const x_const = S1(param1_1, param1_2, param1_3)
    }
}

struct S2{
    public var a = 1
    public init(){}
    public init(a1:Int64, a2:Int64){a = a1}
    init(a1:Int64, a2:UInt64, a3:Float64, a4:String){a = a1}
    const init(a1:Int64, a2:Int64, a3:Float64){a = a1}
    init(a1:Int64, a2:Float64, a3:Float64){a = a1}
}
public struct S2_2{
    let x:S2 = S2()
}
public class C2{
    let x:S2 = S2()
}
@Frozen
public func foo_S2_frozen(){
    let x = S2(1,UInt64(1),1.0,"frozen")
}
const param2_1 = 1
const param2_2 = 1
const param2_3 = 1.0
public const func foo_S2_const(){
    let x = S2(param2_1, param2_2, param2_3)
}

struct S3{
    public var a = 1
    public const init(){}
    public init(a1:Int64, a2:Int64){a = a1}
    init(a1:Int64, a2:UInt64, a3:Float64, a4:String){a = a1}
    const init(a1:Int64, a2:Int64, a3:Float64){a = a1}
    init(a1:Int64, a2:Float64, a3:Float64){a = a1}
}
@Frozen
public func foo_S3_frozen(){
    let x = S3(1,UInt64(1),1.0,"frozen")
}
const param3_1 = 1
const param3_2 = 1
const param3_3 = 1.0
public const func foo_S3_const(){
    const x1 = S3()
    const x2 = S3(param3_1, param3_2, param3_3)
}

struct S4{
    public var a = 1
    public init(){}
    public init(a1:Int64, a2:Int64){a = a1}
    init(a1:Int64, a2:UInt64, a3:Float64, a4:String){a = a1}
    const init(a1:Int64, a2:Int64, a3:Float64){a = a1}
    init(a1:Int64, a2:Float64, a3:Float64){a = a1}
}
@Frozen
public func foo_S4_frozen(){
    let x1 = S4()
    let x2 = S4(1,UInt64(1),1.0,"frozen")
}
const param4_1 = 1
const param4_2 = 1
const param4_3 = 1.0
public const func foo_S4_const(){
    const x = S4(param4_1, param4_2, param4_3)
}

struct S5{
    public init(a1:Int64, a2:Float64, a3:UInt64){}
}

