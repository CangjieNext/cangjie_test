/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.1.1
  @Scene: add
  @Visibility: public
  @Object: enum
  @Behavior: add enum
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

package test_stable_abi

// test enum: add enum
public enum RGBColor {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

enum Testb {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum Testc {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum Testd {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}
