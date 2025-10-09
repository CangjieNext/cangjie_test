/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.30
  @Scene: modify
  @Visibility: non-public class inherited by visible class and public/protected primary_init
  @Object: class primary_init
  @Behavior: add instancemember funcparam
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Changed number of parameters of function visible outside the module.
// ASSERT: scan-2 [ABI] Added member variable to a class.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

open class Public_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2
    }
    public Public_PC(a: Int64, public var b!: Int64) {
        this.v1 = a
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
        b = 2
    }

    protected Protected_PC(a: Int64, public var b!: Int64) {
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
    }

    internal Internal_PC(a: Int64) {
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
    }

    private Private_PC(a: Int64) {
        this.v1 = a
    }
}

public class Private_PC2 <: Private_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64
    const Const_PC(a: Int64) {
        this.v1 = a
    }
    public const func f1() {
        let class1 = Const_PC(1)
        class1
    }
}

public class Const_PC2 <: Const_PC {
    let v2: Int64
    public init(a: Int64) {
        super(1)
        this.v2 = a
    }
    const Const_PC2() {
        super(1)
        this.v2 = 2
    }
}

open class Rely_Frozen_PC {
    var v1 = 1
    public init() {
    }
    Rely_Frozen_PC(a: Int64) {
    }
    @Frozen
    public func f2() {
        let class1 = Rely_Frozen_PC(1)
        class1
    }
}

public class Rely_Frozen_PC2 <: Rely_Frozen_PC {
    var v2 = 0
    public init(a: Int64) {
        this.v2 = a
    }
    Rely_Frozen_PC2() {
    }
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}