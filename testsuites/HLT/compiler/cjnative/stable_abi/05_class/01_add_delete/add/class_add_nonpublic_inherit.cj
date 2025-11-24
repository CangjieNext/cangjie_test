/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.1
  @Scene: add
  @Visibility: non public
  @Object: class
  @Behavior: add class
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: add new class
open public class Father {
    public var v1 = 0
    public mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    public var v3: Int64

    open public func foo1(a: Int64) {
        10
    }

    public static func foo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this.v3 = input
    }
}

open public class Generics<T> {
    public var _v1 = 0
    public mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    public var _v3: Int64

    open public func goo1(a: Int64) {
        10
    }

    public static func goo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this._v3 = input
    }

    public func goo3(a: T) {
        return a
    }
}

class Son <: Father {
    public var v4 : Int64
    public override func foo1(a: Int64) {
        100
    }

    redef public static func foo2(a: Int64) {
        1001
    }

    public init(input: Int64) {
        super(input)
        this.v4 = 0
    }
}

class Son_Generics<T> <: Generics<T> {
    public var _v4: Int64

    public override func goo1(a: Int64) {
        101
    }

    redef public static func goo2(a: Int64) {
        1002
    }

    public init(input: Int64) {
        super(input)
        this._v4 = input
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func check<T>(f1: Father, g1: Generics<T>, t: T): Unit where T <: Equatable<T> & ToString {
    assert(f1.v1, 0)
    assert(f1.v2, 1)
    assert(f1.v3, 5)
    assert(f1.foo1(9), 10)
    assert(Father.foo2(90), 100)
    assert(g1._v1, 0)
    assert(g1._v2, 1)
    assert(g1._v3, 101)
    assert(g1.goo1(1), 10)
    assert(Generics<T>.goo2(10), 100)
    assert(g1.goo3(t), t)

    let s1 = Son(5)
    assert(s1.v1, 0)
    assert(s1.v2, 1)
    assert(s1.v3, 5)
    assert(s1.foo1(9), 100)
    assert(Son.foo2(90), 1001)

    let s2 = Son_Generics<T>(101)
    assert(s2._v1, 0)
    assert(s2._v2, 1)
    assert(s2._v3, 101)
    assert(s2._v4, 101)
    assert(s2.goo1(1), 101)
    assert(Son_Generics<T>.goo2(1), 1002)
    assert(s2.goo3(t), t)
}
