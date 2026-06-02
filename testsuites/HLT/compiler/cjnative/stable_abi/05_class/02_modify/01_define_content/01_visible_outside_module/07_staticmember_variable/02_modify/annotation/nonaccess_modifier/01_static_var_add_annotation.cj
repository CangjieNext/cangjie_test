/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.7.2.1
  @Scene: modify
  @Visibility: public & non public & used in public @Frozen declare
  @Object: class static var
  @Behavior: add annotation
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
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
    @Version["1.1"]
    static const a1 = 1
    @Version["1.2"]
    static var a2 = 2
    @Version["1.3"]
    static let a3 = 3

    @Version["1.1"]
    static const b1 = 1
    @Version["1.1"]
    static var b2 = 2
    @Version["1.1"]
    static let b3 = 3

    public static const func f1() {
        a1
    }

    @Frozen
    public func f2() {
        a2
    }

    @Frozen
    public func f3() {
        a3
    }

    public static const func f4() {
        b1
    }

    @Frozen
    public func f5() {
        b2
    }

    @Frozen
    public func f6() {
        b3
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

    assert(CC.f1(), 1)
    assert(c0.f2(), 2)
    assert(c0.f3(), 3)

    assert(CC.f4(), 1)
    assert(c0.f5(), 2)
    assert(c0.f6(), 3)
}
