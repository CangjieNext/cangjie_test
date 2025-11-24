/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.11.2.44
  @Scene: modify
  @Visibility: open class inherited and non-public instance func used in const declare
  @Object: class instance func
  @Behavior: modify return type
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
 
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Changed return type of function visible outside the module. The new return type is not a subtype of the old return type.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-2 [ABI]

package test_stable_abi

// test class: instancemember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    public const init() {}
    public  func f1(): Father {
        Father()
    }

    const func f2(a: Father, b: Son): Father {
        a
    }
    public  const func f3(a: Father, b: Son): Father {
        f2(a, b)
    }

     func f4(): Father {
        Father()
    }
    @Frozen
    public  func f5(): Father {
        f4()
    }

    public  func g1(): Son {
        Son()
    }

     const func g2(a: Father, b: Son): Son {
        b
    }
    public  const func g3(a: Father, b: Son): Son {
        g2(a, b)
    }

     func g4(): Son {
        Son()
    }
    @Frozen
    public  func g5(): Son {
        g4()
    }
}

open class baseClass {
    const init() {}
    public  func f1(): Father {
        Father()
    }

     const func f2(a: Father, b: Son): Father {
        a
    }
    public  const func f3(a: Father, b: Son): Father {
        f2(a, b)
    }

     func f4(): Father {
        Father()
    }
    @Frozen
    public  func f5(): Father {
        f4()
    }

    public  func g1(): Son {
        Son()
    }

     const func g2(a: Father, b: Son): Father {
        a
    }
    public  const func g3(a: Father, b: Son): Father {
        g2(a, b)
    }

     func g4(): Son {
        Son()
    }
    @Frozen
    public  func g5(): Son {
        g4()
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    const init() {}
    public  func f1(): Father {
        Father()
    }

     const func f2(a: Father, b: Son): Father {
        a
    }
    public  const func f3(a: Father, b: Son): Father {
        f2(a, b)
    }

     func f4(): Father {
        Father()
    }
    @Frozen
    public  func f5(): Father {
        f4()
    }

    public  func g1(): Son {
        Son()
    }

     const func g2(a: Father, b: Son): Son {
        b
    }
    public  const func g3(a: Father, b: Son): Son {
        g2(a, b)
    }

     func g4(): Son {
        Son()
    }
    @Frozen
    public  func g5(): Son {
        g4()
    }
}
public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(tc: TestClass, b: B): Unit {
    assert(tc.f1() is Father, true)
    assert(tc.f2(Father(), Son()) is Father, true)
    assert(tc.f3(Father(), Son()) is Father, true)
    assert(tc.f4() is Father, true)
    assert(tc.f5() is Father, true)
    assert(tc.g1() is Son, true)
    assert(tc.g2(Father(), Son()) is Son, true)
    assert(tc.g3(Father(), Son()) is Son, true)
    assert(tc.g4() is Son, true)
    assert(tc.g5() is Son, true)

    assert(b.f1() is Father, true)
    assert(b.f2(Father(), Son()) is Father, true)
    assert(b.f3(Father(), Son()) is Father, true)
    assert(b.f4() is Father, true)
    assert(b.f5() is Father, true)
    assert(b.g1() is Son, true)
    assert(b.g2(Father(), Son()) is Son, true)
    assert(b.g3(Father(), Son()) is Son, true)
    assert(b.g4() is Son, true)
    assert(b.g5() is Son, true)
}
