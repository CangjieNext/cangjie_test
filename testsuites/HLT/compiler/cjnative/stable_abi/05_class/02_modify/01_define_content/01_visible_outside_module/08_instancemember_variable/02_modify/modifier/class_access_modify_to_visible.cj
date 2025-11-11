/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.8.2
  @Scene: modify
  @Visibility: non public
  @Object: class instance var
  @Behavior: modifier nonpublic to public
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: ../../main.cj, ../../template.cj
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

// test class: instancemember variable
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class CC {
    public let a1 = 1
    public var a2 = 2

    public let b1 = 1
    public var b2 = 2

    protected let c1 = 1
    protected var c2 = 2

    public let d1 = 1
    public var d2 = 2

    let e1 = 1
    var e2 = 2

    @Version["1.1"]
    public let f1 = 1
    @Version["1.1"]
    public var f2 = 2

    @Deprecated["This variable will be deprecated soon"]
    public let g1 = 1

    @Deprecated["This variable is deprecated", strict: true]
    public let g2 = 2

    let h1 = 1

    @Frozen
    public func h2() {
        h1
    }

    let x1 = 1
    private var x2 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(c.a1, 1)
    assert(c.a2, 2)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 2
    assert(c.a2, 2)
    assert(c.b1, 1)
    assert(c.b2, 2)
    c.b2 = 22
    assert(c.b2, 22)
    c.b2 = 2
    assert(c.b2, 2)
    assert(c.c1, 1)
    assert(c.c2, 2)
    c.c2 = 22
    assert(c.c2, 22)
    c.c2 = 2
    assert(c.c2, 2)
    assert(c.d1, 1)
    assert(c.d2, 2)
    c.d2 = 22
    assert(c.d2, 22)
    c.d2 = 2
    assert(c.d2, 2)
    assert(c.e1, 1)
    assert(c.e2, 2)
    c.e2 = 22
    assert(c.e2, 22)
    c.e2 = 2
    assert(c.e2, 2)
    assert(c.f1, 1)
    assert(c.f2, 2)
    c.f2 = 22
    assert(c.f2, 22)
    c.f2 = 2
    assert(c.f2, 2)
    assert(c.g1, 1)
    assert(c.h1, 1)
    assert(c.h2(), 1)
    assert(c.x1, 1)
}
