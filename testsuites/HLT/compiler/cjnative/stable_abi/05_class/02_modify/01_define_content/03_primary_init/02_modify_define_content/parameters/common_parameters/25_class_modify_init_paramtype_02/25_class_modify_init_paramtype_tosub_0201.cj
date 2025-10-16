/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.25
  @Scene: modify
  @Visibility: non-public class inherited by visible class and public/protected primary_init
  @Object: class primary_init
  @Behavior: modify regular funcparam type A to subtype B
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
// ASSERT: scan-4 [API/ABI] Changed parameter type of function visible outside the module. The new param type is not a parent type of the old param type.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

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
    }
    public Public_PC(a: Int64, b: Son, c!: Son) {
    }
}
open class Protected_PC {
    public var v1: Int64 = 1
    public init() {
    }

    protected Protected_PC(a: Int64, b: Son, c!: Son) {
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

    internal Internal_PC(a: Int64, b: Son, c!: Father) {
        this.v1 = a
    }
}

public class Internal_PC1 <: Internal_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Private_PC {
    public var v1: Int64 = 1
    public init() {
    }

    private Private_PC(a: Int64, b: Son, c!: Father) {
        this.v1 = a
    }
}

public class Private_PC1 <: Private_PC {
    public var v2: Int64 = 1
    public init() {
    }
}

open class Const_PC {
    public let v1: Int64
    public const init(a: Int64) {
        this.v1 = a
    }
    const Const_PC(a: Int64, b: Son, c!: Father) {
        this.v1 = a
    }
    public const func f1() {
        let class1 = Const_PC(1, Son(), c:Father())
        class1
    }
}

public class Const_PC3 <: Const_PC {
    let v2: Int64
    public init(a: Int64) {
        super(1)
        this.v2 = a
    }
    const Const_PC3() {
        super(1)
        this.v2 = 2
    }
}

open class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    Rely_Frozen_PC(a: Int64, b: Son, c!: Father) {
    }
    @Frozen
    public func f2() {
        let class1 = Rely_Frozen_PC(1, Son(), c:Father())
        class1
    }
}

public class Rely_Frozen_PC2 <: Rely_Frozen_PC {
    var v2 = 0
    public init(a: Int64) {
        super(a)
        this.v2 = a
    }
    Rely_Frozen_PC2() {
        super(1)
    }
}

public class Frozen_PC {
    public var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    @Frozen
    public Frozen_PC(a: Int64, b: Son, c!: Father) {
        this.v1 = a
    }
}

open class Const_PC1 {
    public let v1: Int64
    public const init() {
        this.v1 = 1
    }
    public const Const_PC1(a: Int64, b: Son, c!: Son) {
        this.v1 = a
    }
}

public class Const_PC2 <: Const_PC1 {
    public let v2: Int64
    public const Const_PC2(a: Int64) {
        this.v2 = a
    }
}

open class Param_PC1 {
    public init() {
    }
    public Param_PC1(a: Int64, b: Son, c!: Son) {
    }
}

public class Param_PC2 <: Param_PC1 {
    public Param_PC2(a: Int64) {
        super()
    }
}