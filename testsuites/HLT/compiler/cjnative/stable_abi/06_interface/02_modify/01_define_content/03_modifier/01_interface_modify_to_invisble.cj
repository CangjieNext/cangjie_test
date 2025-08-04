/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 6.2.1.3.1
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: modify modifier: public -> non public
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

// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Interface declaration visible outside the module made protected or internal.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test interface: access modifier
protected interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}

protected interface I2 {}

internal interface I3 {}

interface I4 {}

private interface I5 {}
