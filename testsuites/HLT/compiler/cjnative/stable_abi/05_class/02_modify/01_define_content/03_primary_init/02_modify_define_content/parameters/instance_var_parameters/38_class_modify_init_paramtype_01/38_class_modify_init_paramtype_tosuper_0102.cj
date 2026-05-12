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
  @Visibility: public class and non public/protected primary_init used by Frozen or const declaration
  @Object: class primary_init
  @Behavior: modify instancemember funcparam type A to subtype B
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Changed parameter type of constructor visible outside the module.
// ASSERT: scan-2 [API/ABI] Modified member variables' type for class visible outside the module.
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {
    const init(){}
}
public class Son <: Father {
    const init(){}
}

public class Public_PC {
    public var v1: Int64 = 1
    public init(a: Int64) {
        this.v1 = a
        b = Son()
        c = Son()
    }
    public Public_PC(a: Int64, public var b: Son, public var c!: Father) {
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    protected Protected_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    internal Internal_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = Son()
        c = Son()
    }

    private Private_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    public init(a: Int64) {
        this.v1 = a
        b = Son()
        c = Son()
    }
    const Const_PC(a: Int64, public let b: Father, public let c!: Father) {
        this.v1 = a
    }
}

public const func global1() {
    let class1 = Const_PC(1, Father(), c:Father())
    class1
}

public class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
        b = Son()
        c = Son()
    }
    Rely_Frozen_PC(a: Int64, public var b: Father, public var c!: Father) {
    }
}

@Frozen
public func global2() {
    let class1 = Rely_Frozen_PC(1, Father(), c:Father())
    class1
}

public class Frozen_PC {
    public var v1 = 0
    public init(a: Int64) {
        this.v1 = a
        b = Son()
        c = Son()
    }
    @Frozen
    public Frozen_PC(a: Int64, public var b: Son, public var c!: Father) {
        this.v1 = a
    }
}