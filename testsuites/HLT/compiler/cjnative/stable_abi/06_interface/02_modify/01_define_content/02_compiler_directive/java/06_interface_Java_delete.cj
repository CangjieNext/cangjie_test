/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.2.6
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: delete @Java
  @Expect: api incompatible & abi incompatible
*/

// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// (not CJNATIVE) EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// (not CJNATIVE) EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// (not CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (not CJNATIVE) EXEC: %rm libstable_abi.*
// (not CJNATIVE) EXEC: %mv test_stable_abi.cjo old.cjo
// (not CJNATIVE) EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// (not CJNATIVE) RUN-EXEC-1: %run %run_opt %output %run_args
// TEST API Compatibility
// (not CJNATIVE) EXEC-1: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// (not CJNATIVE) RUN-EXEC-1: %run %run_opt %output %run_args

package test_stable_abi

// test interface: @Java

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}

public interface I2 {
    public static func typename(): String {
        "interface I2"
    }
}
