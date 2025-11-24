/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.8.2.11
  @Scene: modify
  @Visibility: public
  @Object: class instance var
  @Behavior: modify the type of variable
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

// ASSERT: scan Incompatible!
// ASSERT: scan-4 [API/ABI] Modified member variables' type for class visible outside the module.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember variable
public open class Father {
    const init() {}
}

public class Son <: Father {
    const init() {}
}

public class CC {
    public let a1: Int8 = 1
    public var a2: Int32 = 2

    protected let c1: Int8 = 1
    protected var c2: Int32 = 2
}

open class baseClass {
    public let a1: Int64 = 1
    public var a2: Int64 = 2

    protected let c1: Int64 = 1
    protected var c2: Int64 = 2
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public let a1: Int8 = 1
    public var a2: Int32 = 2

    protected let c1: Int8 = 1
    protected var c2: Int32 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(c: CC, b: B): Unit {
    assert(c.a1, 1)
    assert(c.a2, 2)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 2
    assert(c.a2, 2)
    assert(c.c1, 1)
    assert(c.c2, 2)
    c.c2 = 22
    assert(c.c2, 22)
    c.c2 = 2
    assert(c.c2, 2)
    assert(b.b, 20)
}
