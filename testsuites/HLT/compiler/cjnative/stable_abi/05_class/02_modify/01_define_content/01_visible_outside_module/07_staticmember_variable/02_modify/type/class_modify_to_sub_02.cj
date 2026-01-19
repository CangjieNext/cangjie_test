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
  @Behavior: class staticmember variable from type A to subtype B
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main1.cj, template1.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template1.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main1.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template1.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main1.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let a1: Int64 = 1
    public static var a2: Int64 = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    protected static let c2: Son = Son()
    internal static const c3: Int64 = 1
    private static var c4: Int64 = 1
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert((CC.a1 as Int64).getOrThrow(), 1)
    assert((CC.a2 as Int64).getOrThrow(), 2)
    assert((CC.a3 as Int64).getOrThrow(), 3)
    assert(CC.c1 is Father, true)
    assert(CC.c2 is Father, true)
    assert(CC.c3, 1)
}
