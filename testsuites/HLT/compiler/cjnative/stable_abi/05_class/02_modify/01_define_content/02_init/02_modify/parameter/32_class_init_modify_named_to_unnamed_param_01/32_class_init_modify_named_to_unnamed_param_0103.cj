/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.2.2.32
  @Scene: modify
  @Visibility: public class and non-public init used in Frozen declare
  @Object: class init
  @Behavior: modify named to unnamed param
  @Expect: api incompatible & abi  incompatible
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
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Named parameter cannot be made unnamed parameter.
// ASSERT: scan-2 [API/ABI] Deleted default value of named parameter.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-4 [API/ABI]

package test_stable_abi

// test class: constructors--init Constructors
open public class Father {}
public class Son <: Father {}

public class Public_C {
    public let v1: Int64

    public init(a: Int64, b: Int64, c: Int64, d: Int64, e!: Int64 = 1) {
        this.v1 = a
    }

    const init(a: Int64, b: Int64, c!: Int64 = 1) {
        this.v1 = a
    }
    public const func getC1(a: Int64, b: Int64, c: Int64) {
        let class1 = Public_C(a, b)
        1
    }

    init(a: Int64) {
        this.v1 = 1
    }
    @Frozen
    public func getC2() {
        let class2 = Public_C(1)
        class2
    }
}
public class Protected_C {
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