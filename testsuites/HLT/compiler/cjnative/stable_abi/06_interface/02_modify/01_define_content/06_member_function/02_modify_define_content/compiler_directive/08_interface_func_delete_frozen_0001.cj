/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.6.1.8
  @Scene: delete
  @Visibility: public
  @Object: interface func
  @Behavior: delete @Frozen
  @Expect: api compatible & abi incompatible
*/

// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible
// ASSERT: scan-not [API/ABI] 
// ASSERT: scan-1 [ABI] Deleted the annotation '@Frozen' of the member function of the interface.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

package test_stable_abi

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }

    @Deprecated["this function is deprecated", strict: false]
    public static func testOne(): Unit {

    }

    @Deprecated["this function is deprecated", strict: true]
    public func testTwo(): Unit {
        
    }

    public static func testThree(): String {
          "interface testThree"
    }

    public static func testFour(): String {
          "interface testThree"
    }
}
