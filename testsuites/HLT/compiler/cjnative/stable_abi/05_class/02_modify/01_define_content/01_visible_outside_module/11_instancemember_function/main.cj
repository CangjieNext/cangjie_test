/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

public class Son_TestClass <: TestClass {
    public func _f2() {
        f2()
    }

    public func _pf6() {
        pf6()
    }

    public func _pf8() {
        pf8()
    }

    public func _pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        pg1<X, Y, Z>(a, b, c)
    }
    public func _pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        pg2<X, Y, Z>(a, b, c)
    }

    public func _pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        pp1(a, b: b, c: c)
    }
    public func _pp2(): Int64 {
        pp2(Son(), b: Son())
        0
    }
    public func _pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        pp3(a, b: b, c: c)
    }

    public func _pano1() {
        pano1()
    }
}

unsafe main() {
    let son = Son_TestClass()
    son._f2()
    son._pf6()
    son._pf8()
    son._pg1<Int64, Int64, Son>(1, 2, Son())
    son._pg2<Int64, String, Son>(1, "a", Son())
    son._pp1(1, b: 2)
    son._pp2()
    son._pp3(Father(), b: Father())
    son._pano1()

    let tc = TestClass()

    if (
        tc.f1() == 1 && tc.f4() == 3
        && tc.f6() == 5 && global() == 7 && tc.openfunc() == 1
        && tc.f8() == 8 && tc.f13() == 13 && tc.f14() == 14 
        && tc.g1<Int64, Int64, Son>(1, 2, Son()) == "12"
        && tc.g2<Int64, String, Son>(1, "a", Son()) == "1"
        && tc.p1(1, b: 2, c: 3) == 6 
        && tc.p2(Son(), b: Son()) is Son && tc.p3(Father(), b: Father()) is Father
        && tc.ano1() == 1 
    ) {
        return 0        
    } else {
        return 1
    }

}


