/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.32
  @Scene: modify
  @Visibility: public class and non public/protected primary_init
  @Object: class primary_init
  @Behavior: modify name of unnamed instancemember funcparam
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

// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Deleted class public/protected member variable.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: constructors--Primary Constructors
open public class Father {}
public class Son <: Father {}

public class Public_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }
    public Public_PC(a: Int64, var b: Int64, public var c: Int64) {
        this.v1 = a
    }
}
public class Protected_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c = 3
    }

    protected Protected_PC(a: Int64, private var b: Int64, protected var c: Int64) {
        this.v1 = a
    }
}
public class Internal_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c0 = 3
    }

    internal Internal_PC(a: Int64, var b: Int64, public var c0: Int64) {
        this.v1 = a
    }
}
public class Private_PC {
    public var v1: Int64 = 1
    public init() {
        b = 2;c0 = 3
    }

    private Private_PC(a: Int64, var b: Int64, public var c0: Int64) {
        this.v1 = a
    }
}

public class Const_PC {
    public let v1: Int64
    public const init(){
        this.v1 = 1
        b = 2;c = 3
    }
    const Const_PC(a: Int64, let b: Int64, public let c: Int64) {
        this.v1 = a
    }
}

public const func global1() {
    let class1 = Const_PC(1,2,3)
    class1
}

public class Frozen_PC {
    public var v1 = 1
    public init() {
        b = 2;c = 3
    }
    Frozen_PC(a: Int64, var b: Int64, public var c: Int64) {
    }
}

@Frozen
public func global2() {
    let class1 = Frozen_PC(1,2,3)
    class1
}