/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.7.2.2
  @Scene: add
  @Visibility: public
  @Object: interface prop
  @Behavior: add @Deprecated, strict false
  @Expect: api compatible & abi compatible
*/

// LEVEL: 1
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

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}


public interface I1 {
     public static func typename(): String {
        "interface I1"
    }
   
    @Deprecated["this function is deprecated", strict: true]
    public mut prop a: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    @Deprecated["this function is deprecated", strict: false]
     public mut prop b: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    @Deprecated["this function is deprecated", strict: false]
     public mut prop c: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    @Frozen
    public mut prop d: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }
}