/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.2.2.27
  @Scene: modify
  @Visibility: open class inherited and public init
  @Object: class init
  @Behavior: add func parameter
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
 
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed number of parameters of function visible outside the module.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: constructors--init Constructors
open public class Father {}
public class Son <: Father {}

open class Public_C {
    public let v1: Int64

    public init(a: Int64, b: Int64, c: Int64, d: Int64) {
        this.v1 = a
    }

    const init(a: Int64, b: Int64) {
        this.v1 = a + b
    }
    public const func getC1(a: Int64, b: Int64) {
        let class1 = Public_C(a, b)
        1
    }

    init() {
        this.v1 = 1
    }

    init (a: Int64, b: Int64, c: Int64) {
        this.v1 = 2
    }
    @Frozen
    public func getC2() {
        let class2 = Public_C(1, 2, 3)
        class2
    }
}

public class A <: Public_C {
    let a: Int64 = 20

    public init() {}
}

open class Protected_C {
    public var v1: Int64 = 1
    public init() {
    }

    protected init(a: Int64) {
        this.v1 = a
    }
}

public class B <: Protected_C {
    let b: Int64 = 20

    public init() {}
}
