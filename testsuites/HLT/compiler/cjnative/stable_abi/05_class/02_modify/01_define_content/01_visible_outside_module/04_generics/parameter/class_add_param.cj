/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.4
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: class add generic parameter
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
// ASSERT: scan-1 [API/ABI] Added generic param of class visible outside the module
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: generic params
open public class Generics<T, U, V> {
    public var _v1 = 0
    public mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    public var _v3: Int64

    open public func goo1(a: Int64) {
        10
    }

    public static func goo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this._v3 = input
    }

    public func goo3(a: T, b: U) {
        return (a, b)
    }
}

public func checker(): Int64 {
    let g1 = Generics<Int64, Int64, Int64>(101)
    if (g1._v1 == 0 && g1._v2 == 1 && g1._v3 == 101 && g1.goo1(1) == 10 && Generics<UInt64, Int64, Int64>.goo2(10) == 100 && g1.goo3(123, 456) == (123, 456)) {
    } else {
        return 1
    }
    g1._v2 = 202
    if (g1._v1 != 202) {
        return 1
    }
    0
}