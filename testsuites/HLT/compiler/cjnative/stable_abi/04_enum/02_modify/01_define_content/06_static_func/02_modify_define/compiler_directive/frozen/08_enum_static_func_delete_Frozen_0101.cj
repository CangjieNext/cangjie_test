/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.6.2.8
  @Scene: delete
  @Visibility: used in public @Frozen declare
  @Object: enum static func
  @Behavior: delete @Frozen
  @Expect: api compatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed member function's annotation of enum visible outside the module. Frozen deleted.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: delete @Frozen
package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public static func getWidth(): Int64 {
        return 11
    }

    @Frozen
    static func geta(): Int64 {
        return 0
    }

    @Frozen
    public static func getb(): Int64 {
        return 0
    }

    static func getc(): Int64 {
        return 0
    }

    @Frozen
    public static func getd() {
        let c = getc()
        return c
    }
}
