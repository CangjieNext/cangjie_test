/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.6.1.2.1
  @Scene: modify
  @Visibility: public
  @Object: extend instance prop
  @Behavior: modify instance prop annotation
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

// test extend: instance prop
@Annotation
public class CustomAnnotation {
    let name: String
    let version: Int64

    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

public struct TestStruct {
    public static var a: Int64 = 0
}

extend TestStruct {
    @CustomAnnotation["Sample1", version: 2]
    public prop prop1: Int64 {
        get() {
            1
        }
    }

    @CustomAnnotation["Sample1", version: 11]
    mut prop prop2: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @CustomAnnotation["Sample11", version: 11]
    mut prop prop3: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @Frozen
    public func n1() {
        prop3
    }

    public prop prop_1: Int64 {
        get() {
            1
        }
    }

    mut prop prop_2: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    mut prop prop_3: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @Frozen
    public func n_1() {
        prop_3
    }
}
