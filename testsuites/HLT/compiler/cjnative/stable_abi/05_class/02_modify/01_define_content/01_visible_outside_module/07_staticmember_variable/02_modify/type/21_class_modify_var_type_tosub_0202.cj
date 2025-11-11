/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.7.2.21
  @Scene: modify
  @Visibility: public
  @Object: class static var
  @Behavior: class staticmember variable from type A to subtype B
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-1 [ABI] Modified static constant variables' initial value for class visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
public open class Father {
    const init() {}
}

public class Son <: Father {
    const init() {}
}

public class CC {
    public static let a1: Any = 1
    public static var a2: Any = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    public static let c2: Son = Son()

    static const c3: Father = Father()
    public static const func f3(): Father {
        c3
    }

    static const c4: Son = Son()
    public static const func f4(): Son {
        c4
    }

    static var c5: Father = Father()

    @Frozen
    public static func f5(): Father {
        c5
    }

    static var c6: Son = Son()

    @Frozen
    public static func f6(): Son {
        c6
    }
}

open class baseClass {
    public static let a1: Any = 1
    public static var a2: Any = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    public static let c2: Son = Son()

    static const c3: Son = Son()
    public static const func f3(): Son {
        c3
    }

    static const c4: Son = Son()
    public static const func f4(): Son {
        c4
    }

    static var c5: Father = Father()

    @Frozen
    public static func f5(): Father {
        c5
    }

    static var c6: Son = Son()

    @Frozen
    public static func f6(): Son {
        c6
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public static let a1: Any = 1
    public static var a2: Any = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    public static let c2: Son = Son()

    static const c3: Father = Father()
    public static const func f3(): Father {
        c3
    }

    static const c4: Son = Son()
    public static const func f4(): Son {
        c4
    }

    static var c5: Father = Father()

    @Frozen
    public static func f5(): Father {
        c5
    }

    static var c6: Son = Son()

    @Frozen
    public static func f6(): Son {
        c6
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
    assert((CC.a1 as Int64).getOrThrow(), 1)
    assert((CC.a2 as Int64).getOrThrow(), 2)
    assert((CC.a3 as Int64).getOrThrow(), 3)
    assert(CC.c1 is Father, true)
    assert(CC.c2 is Son, true)
    assert(CC.c3 is Father, true)
    assert(CC.f3() is Father, true)
    assert(CC.c4 is Son, true)
    assert(CC.f4() is Son, true)
    assert(CC.c5 is Father, true)
    assert(CC.f5() is Father, true)
    assert(CC.c6 is Son, true)
    assert(CC.f6() is Son, true)

    let bc = baseClass()
    assert((baseClass.a1 as Int64).getOrThrow(), 1)
    assert((baseClass.a2 as Int64).getOrThrow(), 2)
    assert((baseClass.a3 as Int64).getOrThrow(), 3)
    assert(baseClass.c1 is Father, true)
    assert(baseClass.c2 is Son, true)
    assert(baseClass.c3 is Father, true)
    assert(baseClass.f3() is Father, true)
    assert(baseClass.c4 is Son, true)
    assert(baseClass.f4() is Son, true)
    assert(baseClass.c5 is Father, true)
    assert(baseClass.f5() is Father, true)
    assert(baseClass.c6 is Son, true)
    assert(baseClass.f6() is Son, true)

    let b = B()
    assert((B.a1 as Int64).getOrThrow(), 1)
    assert((B.a2 as Int64).getOrThrow(), 2)
    assert((B.a3 as Int64).getOrThrow(), 3)
    assert(B.c1 is Father, true)
    assert(B.c2 is Son, true)
    assert(B.c3 is Father, true)
    assert(B.f3() is Father, true)
    assert(B.c4 is Son, true)
    assert(B.f4() is Son, true)
    assert(B.c5 is Father, true)
    assert(B.f5() is Father, true)
    assert(B.c6 is Son, true)
    assert(B.f6() is Son, true)
    assert(b.b, 20)

    let pc = privateClass()
    assert((privateClass.a1 as Int64).getOrThrow(), 1)
    assert((privateClass.a2 as Int64).getOrThrow(), 2)
    assert((privateClass.a3 as Int64).getOrThrow(), 3)
    assert(privateClass.c1 is Father, true)
    assert(privateClass.c2 is Son, true)
    assert(privateClass.c3 is Father, true)
    assert(privateClass.f3() is Father, true)
    assert(privateClass.c4 is Son, true)
    assert(privateClass.f4() is Son, true)
    assert(privateClass.c5 is Father, true)
    assert(privateClass.f5() is Father, true)
    assert(privateClass.c6 is Son, true)
    assert(privateClass.f6() is Son, true)
}
