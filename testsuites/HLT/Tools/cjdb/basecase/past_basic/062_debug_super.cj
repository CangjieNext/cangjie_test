/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
struct rect{
    let boolr:Bool = true
    let width:Int64 = 10
    var height:Int32 = 32

}
class S1{
    public var ss1:Int64
    public init(a:Int64) {
        this.ss1 = a
    }
}
enum TimeUnit{
    Red
}
open class C1 {
    public var a1: Int64 = 1
    let au2:UInt64 = 10
    var af2:Float16 = 16.16
    var ae = TimeUnit.Red
    let aal:ArrayList<Int64> = ArrayList<Int64>([10, 20])
    var ahm:HashMap<Int64, Int64> = HashMap<Int64, Int64>([(10, 11), (20,21)])
    protected var hs:HashSet<Bool> = HashSet<Bool>([true, false])
    protected var ab2:Bool = true
    public var aa2:Array<Int64>=[1,2,3]
    public var ass: rect = rect()
    let acc = S1(a1)
    public func foo1(): Int64 {
        return 1
    }
}
open class C2 <: C1 {
    public var a2: Int64
    public init(){
        super()
        a2 = super.a1
    }
    public func foo2(): Int64 {
        return super.foo1()
    }
}
main() {
    var rr=C2()
    return 0
}
