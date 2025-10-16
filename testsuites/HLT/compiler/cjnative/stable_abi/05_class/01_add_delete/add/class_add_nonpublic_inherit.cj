/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.1
  @Scene: add
  @Visibility: non public
  @Object: class
  @Behavior: add class
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
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

// test class: add new class
open public class Father {
    public var v1 = 0
    public mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    public var v3: Int64

    open public func foo1(a: Int64) {
        10
    }

    public static func foo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this.v3 = input
    }
}

open public class Generics<T> {
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

    public func goo3(a: T) {
        return a
    }
}

class Son <: Father {
    public var v4 : Int64
    public override func foo1(a: Int64) {
        100
    }

    redef public static func foo2(a: Int64) {
        1001
    }

    public init(input: Int64) {
        super(input)
        this.v4 = 0
    }
}

class Son_Generics<T> <: Generics<T> {
    public var _v4: Int64

    public override func goo1(a: Int64) {
        101
    }

    redef public static func goo2(a: Int64) {
        1002
    }

    public init(input: Int64) {
        super(input)
        this._v4 = input
    }
}
