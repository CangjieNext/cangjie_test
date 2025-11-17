/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
open class C1 {
    public var aInt64: Int64 = 1
    let aarr01:ArrayList<Int64> = ArrayList<Int64>([10, 20])
    public func foo1(): Int64 {
        return 11
    }
}
open class C2 <: C1 {
    public var ci64: Int64=10
    var cl01=C1()
    public init(){
        super()
        var intervar01:Int64=10
    }
    public func foo2(): Int64 {
        return super.foo1()
    }
}
var global_i64:Int64 = 10
func test_int() {
    var a = 10
    return a
}
main() {
    var c2 = C2()
    return 0
}
