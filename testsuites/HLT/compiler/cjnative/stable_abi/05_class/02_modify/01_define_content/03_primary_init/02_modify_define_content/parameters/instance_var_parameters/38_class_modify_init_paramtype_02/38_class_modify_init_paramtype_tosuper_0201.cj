/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.38
  @Scene: modify
  @Visibility: non-public class inherited by visible class and public/protected primary_init
  @Object: class primary_init
  @Behavior: modify instancemember funcparam type A to supertype B
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Changed parameter type of constructor visible outside the module.
// ASSERT: scan-2 [API/ABI] Modified member variables' type for class visible outside the module.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
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
    public Public_PC(a: Int64, public var b: Father, public var c!: Father) {
    }
}

public class Public_PC2 <: Public_PC {
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

    protected Protected_PC(a: Int64, public var b: Father, public var c!: Father) {
        this.v1 = a
    }
}

public class Protected_PC2 <: Protected_PC {
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

    internal Internal_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}

public class Internal_PC2 <: Internal_PC {
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

    private Private_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}

public class Private_PC2 <: Private_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }
    const Const_PC(a: Int64, public let b: Son, public let c!: Father) {
    }
    public const func f1() {
        let class1 = Const_PC(1, Son(), c:Father())
        class1
    }
}

public class Const_PC2 <: Const_PC {
    public let v2: Int64 = 1
    public init() {
    }
}

open class Frozen_PC {
    var v1 = 0
    public init() {
        b = Son()
        c = Son()
    }
    Frozen_PC(a: Int64, public var b: Son, public var c!: Father) {
    }
    @Frozen
    public func f2() {
        let class1 = Frozen_PC(1, Son(), c:Father())
        class1
    }
}

public class Frozen_PC2 <: Frozen_PC {
    public var v2 = 1
    public init() {
    }
}