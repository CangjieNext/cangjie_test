/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.2.2.31
  @Scene: modify
  @Visibility: non public class and non-public init used in Frozen declare
  @Object: class init
  @Behavior: modify unnamed to named param
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
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

class Public_C {
    public let v1: Int64

    public init(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        this.v1 = a
    }

    const init(a: Int64, b: Int64, c: Int64) {
        this.v1 = a
    }
    public const func getC1(a: Int64, b: Int64, c: Int64) {
        let class1 = Public_C(a, b, c)
        1
    }

    init(a!: Int64 = 1) {
        this.v1 = 1
    }
    @Frozen
    public func getC2() {
        let class2 = Public_C()
        class2
    }
}
class Protected_C {
    public var v1: Int64 = 1
    public init() {
    }

    protected init(a: Int64, b: Int64) {
        this.v1 = a
    }
}

public class TestClass {
    public var v1: Int64 = 1

    public init() {}
}