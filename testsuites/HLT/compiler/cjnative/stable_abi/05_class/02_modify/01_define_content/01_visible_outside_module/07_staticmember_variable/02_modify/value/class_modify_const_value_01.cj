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
  @Behavior: modify non const value
  @Expect: api compatible & abi incompatible
 */
// LEVEL: 0
// (not OHOS)DEPENDENCE: main2.cj, ../../template.cj
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// (not OHOS)EXEC: %compiler %cmp_opt main2.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC: %run %run_opt %output %run_args
// (not OHOS)EXEC: %rm libstable_abi.*
// (not OHOS)EXEC: %mv test_stable_abi.cjo old.cjo
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-3 [ABI] Modified static constant variables' initial value for class visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-3 [ABI]
// TEST API Compatibility
// (not OHOS)EXEC: %compiler %cmp_opt main2.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC-1: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let a1 = 1
    public static var a2 = 2
    public static const a3 = 30

    static let b1 = 1
    static var b2 = 2
    static const b3 = 30
    protected static let b4 = 4
    internal static var b5 = 5
    private static const b6 = 60

    public static let c1: Father = Son()

    static const d1 = 10
    public static const d2 = d1

    static const e1 = 10
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
    CC.a2 = 1
    assert(CC.a2, 1)
    CC.a2 = 2
    assert(CC.a2, 2)
    assert(CC.a3, 30)

    assert(CC.b1, 1)
    assert(CC.b2, 2)
    CC.b2 = 22
    assert(CC.b2, 22)
    CC.b2 = 2
    assert(CC.b2, 2)
    assert(CC.b3, 30)
    assert(CC.b4, 4)
    assert(CC.b5, 5)
    CC.b5 = 55
    assert(CC.b5, 55)
    CC.b5 = 5
    assert(CC.b5, 5)

    assert(CC.c1 is Son, true)

    assert(CC.d1, 10)
    assert(CC.d2, 10)

    assert(CC.e1, 10)
    assert(CC.e2, 2)
    assert(CC.e3(), 10)
    assert(c0.e4(), 2)
}
