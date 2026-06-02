/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.9.2.42
  @Scene: modify
  @Visibility: open class inherited and non-public static func used in const declare
  @Object: class static func
  @Behavior: modify return type tosub
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
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

// test class: instancemember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    public static func f1(): Father {
        Father()
    }

    static const func f2(a: Father, b: Son): Father {
        a
    }
    public static const func f3(a: Father, b: Son): Father {
        f2(a, b)
    }

    static func f4(): Father {
        Father()
    }
    @Frozen
    public static func f5(): Father {
        f4()
    }

    public static func g1(): Son {
        Son()
    }

    static const func g2(a: Father, b: Son): Son {
        b
    }
    public static const func g3(a: Father, b: Son): Son {
        g2(a, b)
    }

    static func g4(): Son {
        Son()
    }
    @Frozen
    public static func g5(): Son {
        g4()
    }
}

open class baseClass {
    public static func f1(): Father {
        Father()
    }

    static const func f2(a: Father, b: Son): Father {
        a
    }
    public static const func f3(a: Father, b: Son): Father {
        f2(a, b)
    }

    static func f4(): Father {
        Father()
    }
    @Frozen
    public static func f5(): Father {
        f4()
    }

    public static func g1(): Son {
        Son()
    }

    static const func g2(a: Father, b: Son): Son {
        b
    }
    public static const func g3(a: Father, b: Son): Son {
        g2(a, b)
    }

    static func g4(): Son {
        Son()
    }
    @Frozen
    public static func g5(): Son {
        g4()
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public static func f1(): Father {
        Father()
    }

    static const func f2(a: Father, b: Son): Son {
        b
    }
    public static const func f3(a: Father, b: Son): Son {
        f2(a, b)
    }

    static func f4(): Father {
        Father()
    }
    @Frozen
    public static func f5(): Father {
        f4()
    }

    public static func g1(): Son {
        Son()
    }

    static const func g2(a: Father, b: Son): Son {
        b
    }
    public static const func g3(a: Father, b: Son): Son {
        g2(a, b)
    }

    static func g4(): Son {
        Son()
    }
    @Frozen
    public static func g5(): Son {
        g4()
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
    assert(TestClass.f1() is Father, true)
    assert(TestClass.f2(Father(), Son()) is Father, true)
    assert(TestClass.f3(Father(), Son()) is Father, true)
    assert(TestClass.f4() is Father, true)
    assert(TestClass.f5() is Father, true)
    assert(TestClass.g1() is Son, true)
    assert(TestClass.g2(Father(), Son()) is Son, true)
    assert(TestClass.g3(Father(), Son()) is Son, true)
    assert(TestClass.g4() is Son, true)
    assert(TestClass.g5() is Son, true)

    assert(B.f1() is Father, true)
    assert(B.f2(Father(), Son()) is Father, true)
    assert(B.f3(Father(), Son()) is Father, true)
    assert(B.f4() is Father, true)
    assert(B.f5() is Father, true)
    assert(B.g1() is Son, true)
    assert(B.g2(Father(), Son()) is Son, true)
    assert(B.g3(Father(), Son()) is Son, true)
    assert(B.g4() is Son, true)
    assert(B.g5() is Son, true)
}
