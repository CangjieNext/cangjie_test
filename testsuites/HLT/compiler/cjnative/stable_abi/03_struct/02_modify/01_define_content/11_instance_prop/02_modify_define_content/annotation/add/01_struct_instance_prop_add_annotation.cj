/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.11.2.1
  @Scene: add
  @Visibility: public
  @Object: struct instance prop
  @Behavior: add annotation
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
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


@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public struct S {
    public var a = 10
    
    @Version["1.1"]
    public mut prop p1: Int64 {
        get() { a }
        set(value) { a = value }
    }

    @Version["1.2"]
    public mut prop p2: Int64 {
        get() { a }
        set(value) { a = value }
    }

    @Version["1.1"]
    public mut prop p3: Int64 {
        get() { a }
        set(value) { a = value }
    }
}