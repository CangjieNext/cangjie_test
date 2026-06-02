/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.22
  @Scene: modify
  @Visibility: public class and non public/protected primary_init used by Frozen or const declaration
  @Object: class primary_init
  @Behavior: modify named regular funcparam to unnamed regular funcparam
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
// ASSERT: scan-2 [API/ABI] Named parameter cannot be made unnamed parameter.
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

public class Public_PC {
    public var v1: Int64 = 1
    public init(a: Int64) {
        this.v1 = a
    }
    public Public_PC(a: Int64, b!: Int64) {
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
    }

    protected Protected_PC(a: Int64, b!: Int64) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
    }

    internal Internal_PC(a: Int64, b!: Int64) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
    }

    private Private_PC(a: Int64, b!: Int64) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    public init(a: Int64) {
        this.v1 = a
    }
    const Const_PC(a: Int64, b: Int64) {
        this.v1 = a
    }
}

public const func global1() {
    let class1 = Const_PC(1, 2)
    class1
}

public class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    Rely_Frozen_PC(a: Int64, b: Int64) {
    }
}

@Frozen
public func global2() {
    let class1 = Rely_Frozen_PC(1, 2)
    class1
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}

public class Generics_PC1<X, Y, Z> where X <: ToString, Y <: ToString, Z <: Son {
    public Generics_PC1(a: X, b!: Y, c!: Z) {}
}
public class Generics_PC2<X, Y, Z> where X <: ToString, Z <: Father {
    public Generics_PC2(a: X, b: Y, c: Z) {}
}

public class Param_PC1 {
    public Param_PC1(a: Int64, b!: Int64, c!: Int64, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}
public class Param_PC2 {
    public Param_PC2(a: Int64, internal var a0: Int64, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}
public class Param_PC3 {
    public Param_PC3(a: Int64, b!: Int64) {
    }

    public init(a: UInt64) {}
}
public class Param_PC5 {
    public Param_PC5(a: Son, b!: Son, c!: Son = Son(), public var d!: Son = Son()) {
    }
}
public class Param_PC6 {
    public Param_PC6(a: Father, b!: Father, c!: Father = Father(), public var d!: Father = Father()) {
    }
}