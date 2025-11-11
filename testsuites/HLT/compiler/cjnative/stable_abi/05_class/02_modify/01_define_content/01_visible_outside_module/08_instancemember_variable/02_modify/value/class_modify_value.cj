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
  @Visibility: public & non public & used in public @Frozen declare
  @Object: class instance var
  @Behavior: change original value
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// (not OHOS)DEPENDENCE: ./main.cj, ../../template.cj
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// (not OHOS)EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC-3: %run %run_opt %output %run_args
// (not OHOS)EXEC: %rm libstable_abi.*
// (not OHOS)EXEC: %mv test_stable_abi.cjo old.cjo
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST ABI Compatibility
// (not OHOS)RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// (not OHOS)EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC: %run %run_opt %output %run_args

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
    public let a1 = 10
    public var a2 = 20

    internal let b1 = 10
    internal var b2 = 2

    protected let c1 = 10
    protected var c2 = 2

    private let d1 = 10
    private var d2 = 2

    let e1 = 10
    var e2 = 20

    @Version["1.1"]
    public let f1 = 10
    @Version["1.1"]
    public var f2 = 20

    @Deprecated["This variable will be deprecated soon"]
    public let g1 = 10

    @Deprecated["This variable is deprecated", strict: true]
    public let g2 = 20

    let h1 = 10

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
    assert(c.a1, 10)
    assert(c.a2, 20)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 20
    assert(c.a2, 20)
    assert(c.b1, 10)
    assert(c.b2, 2)
    c.b2 = 22
    assert(c.b2, 22)
    c.b2 = 2
    assert(c.b2, 2)
    assert(c.c1, 10)
    assert(c.c2, 2)
    c.c2 = 22
    assert(c.c2, 22)
    c.c2 = 2
    assert(c.c2, 2)
    assert(c.e1, 10)
    assert(c.e2, 20)
    c.e2 = 22
    assert(c.e2, 22)
    c.e2 = 20
    assert(c.e2, 20)
    assert(c.f1, 10)
    assert(c.f2, 20)
    c.f2 = 22
    assert(c.f2, 22)
    c.f2 = 20
    assert(c.f2, 20)
    assert(c.g1, 10)
    assert(c.h1, 10)
    assert(c.h2(), 10)
    assert(c.x1, 1)
}
