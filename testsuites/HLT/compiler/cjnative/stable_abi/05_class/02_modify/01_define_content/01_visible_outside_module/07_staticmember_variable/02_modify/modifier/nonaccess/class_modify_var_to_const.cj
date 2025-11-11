/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.7.2
  @Scene: modify
  @Visibility: public
  @Object: class static var
  @Behavior: class staticmember variable var to const
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: ../../../main.cj, ../../../template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Modified static member variables' non-access modifier for class visible outside the module.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember variable
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let a1 = 1
    public static const a2 = 2
    public static const a3 = 3

    static let b1 = 1
    static const b2 = 2
    static const b3 = 3
    protected static let b4 = 4
    internal static const b5 = 5
    private static const b6 = 6

    public static let c1: Father = Son()

    static const d1 = 1
    public static const d2 = d1

    static const e1 = 1
    static let e2 = 2
    public static const func e3() {
        e1
    }

    @Frozen
    public func e4() {
        e2
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c0 = CC()
    assert(CC.a1, 1)
    assert(CC.a2, 2)
    assert(CC.a3, 3)

    assert(CC.b1, 1)
    assert(CC.b2, 2)
    assert(CC.b3, 3)
    assert(CC.b4, 4)
    assert(CC.b5, 5)

    assert(CC.c1 is Son, true)

    assert(CC.d1, 1)
    assert(CC.d2, 1)

    assert(CC.e1, 1)
    assert(CC.e2, 2)
    assert(CC.e3(), 1)
    assert(c0.e4(), 2)
}
