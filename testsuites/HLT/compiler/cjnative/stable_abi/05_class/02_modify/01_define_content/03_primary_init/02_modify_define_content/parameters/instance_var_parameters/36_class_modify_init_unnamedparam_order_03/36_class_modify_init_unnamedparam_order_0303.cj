/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.36
  @Scene: modify
  @Visibility: non-public class and non public/protected primary_init
  @Object: class primary_init
  @Behavior: modify unnamed instancemember funcparam order
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

// test class: constructors--Primary Constructors
open public class Father {
    const init(){}
}
public class Son <: Father {
    const init(){}
}

open class Public_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }
    public Public_PC(a: Int64, public var b: Son, public var c: Father) {
    }
}

public class Public_PC2 {
    public var v2: Int64 = 1
    public init() {
    }

    protected Public_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Protected_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    protected Protected_PC(a: Int64, public var b: Son, public var c: Father) {
        this.v1 = a
    }
}

public class Protected_PC2 {
    public var v2: Int64 = 1
    public init() {
    }

    protected Protected_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    internal Internal_PC(a: Int64, public var c: Father, public var b: Son) {
        this.v1 = a
    }
}

public class Internal_PC2 {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    private Private_PC(a: Int64, public var c: Father, public var b: Son) {
        this.v1 = a
    }
}

public class Private_PC2 {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64
    public init() {
        this.v1 = 1
        b = Son()
        c = Son()
    }
    const Const_PC(a: Int64, public let b: Son, public let c: Father) {
        this.v1 = a
    }
    public const func f1() {
        let class1 = Const_PC(1, Son(), Father())
        class1
    }
}

public class Const_PC2 {
    public let v2: Int64 = 1
    public init() {
    }
}

open class Frozen_PC {
    public var v1 = 1
    public init() {
        b = Son()
        c = Son()
    }
    Frozen_PC(a: Int64, public var b: Son, public var c: Father) {
        this.v1 = a
    }
    @Frozen
    public func f2() {
        let class1 = Frozen_PC(1, Son(), Father())
        class1
    }
}

public class Frozen_PC2 {
    public var v2 = 1
    public init() {
    }
}