/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.2.2.35
  @Scene: modify
  @Visibility: open class inherited and protected init
  @Object: class init
  @Behavior: change param type A to subtype B
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
// EXEC: %mv test_stable_abi.cjo new.cjo
 
// ASSERT: scan Incompatible!
// ASSERT: scan-4 [API/ABI] Changed parameter type of function visible outside the module. The new param type is not a parent type of the old param type.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-4 [API/ABI]

package test_stable_abi

// test class: constructors--init Constructors
open public class Father {
    public const init() {}
}
public class Son <: Father {
    public const init() {}
}
public class Public_C {
    public var v1: Int64 = 1
    public init() {
    }

    public init(a: Int64) {
        this.v1 = a
    }
}
open class Param_C1 {
    public init() {}
    public init(a: Father, b!: Father, c!: Father = Father()) {
    }
    protected init(a: Son, b: Son, c: Son, d: Son) {
    }
}
public class A <: Param_C1 {
    let a: Int64 = 20

    public init() {}
}

open class Param_C2 {
    public init() {}
    const init(a: Father, b!: Father = Father(), c!: Father = Father()) {
    }
    public const func getC2(a: Father) {
        Param_C2(a)
    }
}
public class B <: Param_C2 {
    let a: Int64 = 20

    public init() {}
}

open class Param_C3 {
    public init() {}
    public var v1: Int64 = 1
    init(a: Father, b!: Father = Father(), c!: Father = Father()) {
        this.v1 = 1
    }
    @Frozen
    public func getC3(a: Father) {
        Param_C3(a)
    }
}
public class C <: Param_C3 {
    let a: Int64 = 20

    public init() {}
}
