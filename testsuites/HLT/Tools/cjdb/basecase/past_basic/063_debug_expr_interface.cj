/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

interface I1 {
    func foo1(): Int32 {
        return 1
    }
}

class testc2 {
    let age: Int64 = 10
    var scores: Float64 = 12.12
    public var dcore: Int32 = 32
    public var bool1: Bool = true
}

class C1 <: I1 {
    var fl: Float16 = 16.16
    public var b1: Bool = true
    private var s1: String = "aaab"
    let r1: Rune = 'A'
    var ra1: Range<Int64> = 1..10 : 2
    var s7: Array<Range<Int64>> = [ra1, ra1, ra1]
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    public var vara: VArray<Int64, $3> = [1, 2, 3]
    var ssss: testc2 = testc2()
    public func foo1(): Int32 {
        return 6
    }
}

main() {
    let a: I1 = C1()
    let b: C1 = C1()
    return 0
}
