/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.2.1
  @Scene: delete
  @Visibility: non public
  @Object: class init
  @Behavior: delete non public/protected class init
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: ../main.cj, ../template.cj
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

// test class: constructors--init Constructors
open public class Father {}
public class Son <: Father {}

public class Public_C {
    public var v1: Int64 = 1
    public init() {
    }

    public init(a: Int64) {
        this.v1 = a
    }
}
public class Protected_C {
    public var v1: Int64 = 1
    public init() {
    }

    protected init(a: Int64) {
        this.v1 = a
    }
}
public class Internal_C {
    public var v1: Int64 = 1
    public init() {
    }
}
public class Private_C {
    public var v1: Int64 = 1
    public init() {
    }
}

public class Rely_Frozen_C {
    var v1 = 0
    public init(a: Int64) {
        this.v1 = a
    }
    init() {
    }
}

@Frozen
public func global1() {
    let class1 = Rely_Frozen_C()
    class1
}

public class Deprecated_C1 {
    public let v1: Int64
    @Deprecated["This Init will be deprecated soon"]
    public init(a: Int64) {
        this.v1 = a
    }
}
public class Deprecated_C2 {
    public let v1: Int64
    @Deprecated["This Init is deprecated", strict: true]
    public init(a: Int64) {
        this.v1 = a
    }
}

public class Frozen_C {
    public var v1 = 0
    @Frozen
    public init(a: Int64) {
        this.v1 = a
    }
}

public class Const_C {
    public let v1: Int64
    public const init(a: Int64) {
        this.v1 = a
    }
}

public class Generics_C1<X, Y, Z> where X <: ToString, Y <: ToString, Z <: Son {
    public init(a: X, b!: Y, c!: Z) {}
}
public class Generics_C2<X, Y, Z> where X <: ToString, Z <: Father {
    public init(a: X, b: Y, c: Z) {}
}

public class Param_C1 {
    public init(a: Int64, b!: Int64, c!: Int64 = 1) {
    }
}
public class Param_C2 {
    public init(a: Son, b!: Son, c!: Son = Son()) {
    }
}
public class Param_C3 {
    public init(a: Father, b!: Father, c!: Father = Father()) {
    }
}
public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    assert(Public_C().v1, 1)
    assert(Public_C(2).v1, 2)
    assert(Protected_C().v1, 1)
    assert(Internal_C().v1, 1)
    assert(Private_C().v1, 1)
    assert(Frozen_C(1).v1, 1)
    assert(Const_C(1).v1, 1)
    assert(Generics_C1<Int64, Int64, Son>(1, b: 1, c: Son()) is Generics_C1<Int64, Int64, Son>, true)
    assert(Generics_C2<Int64, String, Father>(1, "", Father()) is Generics_C2<Int64, String, Father>, true)
    assert(Param_C1(1, b: 1) is Param_C1, true)
    assert(Param_C2(Son(), b: Son()) is Param_C2, true)
    assert(Param_C3(Father(), b: Father()) is Param_C3, true)
}
