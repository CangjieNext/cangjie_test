/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.7.2.16
  @Scene: modify
  @Visibility: public
  @Object: interface prop
  @Behavior: modify getter\setter function marked with @Frozen
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
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-2 [ABI] 

package test_stable_abi

public interface I1 {
     public static func typename(): String {
        "interface I1"
    }

    public static mut prop a: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    @Frozen
     public mut prop b: String {
         get() {
            println("Bird flying")
           "interface b"
        }
        set(value) {
            println("Bird flying")
            "interface b"
        }
    }

      public prop c: String {
         get() {
           "interface testThree"
        }
    }

    public mut prop d: Int64 {
         get() {
           0
        }
        set(value) {
            "interface testThree"
        }
    }

}
