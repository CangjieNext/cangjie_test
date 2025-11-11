/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.8.1.1
  @Scene: add
  @Visibility: public
  @Object: class instance var
  @Behavior: add open class instance var
  @Expect: api compatible & abi incompatible
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
// ASSERT: scan-8 [ABI] Added member variable to a class.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-8 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: instancemember variable

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public open class CC {
    public let check = 0

    public let a1 = 1
    public var a2 = 2

    protected let c1 = 1
    protected var c2 = 2

    internal let b1 = 1
    internal var b2 = 2

    private let d1 = 1
    private var d2 = 2

    public let i1 = 1
    public var i2 = 2

    protected let j1 = 1
    protected var j2 = 2

    internal let k1 = 1
    internal var k2 = 2

    private let l1 = 1
    private var l2 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(c.check, 0)
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
    assert(c.b1, 1)
    assert(c.b2, 2)
    c.b2 = 22
    assert(c.b2, 22)
    c.b2 = 2
    assert(c.b2, 2)
    assert(c.i1, 1)
    assert(c.i2, 2)
    c.i2 = 22
    assert(c.i2, 22)
    c.i2 = 2
    assert(c.i2, 2)
    assert(c.j1, 1)
    assert(c.j2, 2)
    c.j2 = 22
    assert(c.j2, 22)
    c.j2 = 2
    assert(c.j2, 2)
    assert(c.k1, 1)
    assert(c.k2, 2)
    c.k2 = 22
    assert(c.k2, 22)
    c.k2 = 2
    assert(c.k2, 2)
}
