/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.40
  @Scene: modify
  @Visibility: public
  @Object: class primary_init
  @Behavior: delete default value for instancemember funcparam
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

// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Deleted default value of named parameter.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

public class Public_PC {
    public var v1: Int64 = 1
    public Public_PC() {
    }

    public init(a: Int64) {
        this.v1 = a
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
    }

    protected Protected_PC(a: Int64) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
    }

    internal Internal_PC(a: Int64) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
    }

    private Private_PC(a: Int64) {
        this.v1 = a
    }
}

public class Rely_Frozen_PC {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    Rely_Frozen_PC() {
    }
}

@Frozen
public func global2() {
    let class1 = Rely_Frozen_PC()
    class1
}

public class Deprecated_PC1 {
    public let v1: Int64
    @Deprecated["This Init will be deprecated soon"]
    public Deprecated_PC1(a: Int64) {
        this.v1 = a
    }
}
public class Deprecated_PC2 {
    public let v1: Int64
    @Deprecated["This Init is deprecated", strict: true]
    public Deprecated_PC2(a: Int64) {
        this.v1 = a
    }
}

public class Frozen_PC {
    public var v1 = 0
    @Frozen
    public Frozen_PC(a: Int64) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    public const Const_PC(a: Int64) {
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
    public Param_PC1(a: Int64, b!: Int64, c!: Int64 = 1, public var d!: Int64 = 2, private var e!: Int64 = 3) {
    }
}
public class Param_PC2 {
    public Param_PC2(a: Int64, internal var a0: Int64, public var d!: Int64, private var e!: Int64) {
    }
}
public class Param_PC3 {
    public const Param_PC3(a: Int64, b!: Int64 = 2) {
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
public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    assert(Public_PC().v1, 1)
    assert(Public_PC(2).v1, 2)
    assert(Protected_PC().v1, 1)
    assert(Internal_PC().v1, 1)
    assert(Private_PC().v1, 1)
    assert(global2() is Rely_Frozen_PC, true)
    assert(Deprecated_PC1(1).v1, 1)
    assert(Frozen_PC(1).v1, 1)
    assert(Const_PC(1).v1, 1)
    assert(Generics_PC1<Int64, Int64, Son>(1, b: 1, c: Son()) is Generics_PC1<Int64, Int64, Son>, true)
    assert(Generics_PC2<Int64, String, Father>(1, "", Father()) is Generics_PC2<Int64, String, Father>, true)
    assert(Param_PC1(1, b: 1, c: 2, d: 3, e: 4) is Param_PC1, true)
    assert(Param_PC2(1, 1, d: 1, e: 1) is Param_PC2, true)
    assert(Param_PC3(1) is Param_PC3, true)
    assert(Param_PC5(Son(), b: Son(), c: Son(), d: Son()) is Param_PC5, true)
    assert(Param_PC6(Father(), b: Father(), c: Father(), d: Father()) is Param_PC6, true)
}
