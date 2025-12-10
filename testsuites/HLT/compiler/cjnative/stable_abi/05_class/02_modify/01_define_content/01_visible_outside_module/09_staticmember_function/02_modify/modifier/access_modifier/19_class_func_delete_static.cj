/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.9.2.19
  @Scene: modify
  @Visibility: public/protected
  @Object: class static func
  @Behavior: modifier delete static
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-4 [API/ABI] Deleted static attribute of instance member functions for classes.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember function
public open class Father {}

public class Son <: Father {}

public class TestClass {
    public let check = 0

    public func f1() {
        1
    }

    protected func f2() {
        2
    }

    static const func f3(): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3()
    }

    func f5(): Int64 {
        return 5
    }

    @Frozen
    public func f6(): Int64 {
        f5()
    }

    public func add1(a: Int64, b: Int64): Int64 {
        return a + b
    }

    protected func add2(a: Int64, b: Int64): Int64 {
        return a + b
    }

    public func add3(a!: Int64, b!: Int64): Int64 {
        return a + b
    }

    protected func add4(a!: Int64, b!: Int64): Int64 {
        return a + b
    }

    static const func f7(): Int64 {
        return 7
    }
    public static const func f8(b!: Int64 = 1): Int64 {
        f7() + b
    }

    static func f9(): Int64 {
        return 9
    }

    @Frozen
    public static func f10(b!: Int64 = 1): Int64 {
        f9() + b
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let t = TestClass()
    assert(t.f1(), 1)
    assert(t.f2(), 2)
    assert(TestClass.f3(), 3)
    assert(TestClass.f4(), 3)
    assert(t.f5(), 5)
    assert(t.f6(), 5)
    assert(TestClass.f7(), 7)
    assert(TestClass.f8(), 8)
    assert(TestClass.f9(), 9)
    assert(TestClass.f10(), 10)
}
