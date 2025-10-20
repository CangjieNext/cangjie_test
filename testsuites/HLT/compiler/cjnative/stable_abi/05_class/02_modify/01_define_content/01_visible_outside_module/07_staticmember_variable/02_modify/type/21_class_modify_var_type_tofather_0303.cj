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
  @Visibility: nonpublic
  @Object: class static var
  @Behavior: class staticmember variable from type A to Fathertype B
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
 
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
open public class Father {
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

    static var c6: Father = Father()
    @Frozen
    public static func f6(): Father {
        c6
    }
}
