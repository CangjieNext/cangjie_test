/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.9.2.2
  @Scene: add
  @Visibility: public | non public
  @Object: enum instance prop
  @Behavior: add @Deprecated, strict: false
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: add @Deprecated
package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    @Deprecated["this function is deprecated", strict: false]
    prop geta1: Int64 {
        get() {
            println("get")
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    public prop geta2: Int64 {
        get() {
            println("get")
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    prop geta3: Int64 {
        get() {
            println("get")
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    public prop geta4: Int64 {
        get() {
            println("get")
            0
        }
    }

    @Deprecated["this function is deprecated", strict: true]
    public prop geta5: Int64 {
        get() {
            println("get")
            0
        }
    }
}

public enum Rectangle1 {
    AB

    public prop geta: Int64 {
        get() {
            0
        }
    }

    prop getb: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1() {
        getb
    }

    @Deprecated["this function is deprecated", strict: false]
    public prop getc: Int64 {
        get() {
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    prop getd: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f2() {
        getd
    }
}
