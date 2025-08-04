/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 7.2.1.5.2.2.1
  @Scene: modify
  @Visibility: public
  @Object: extend instance func
  @Behavior: add instance func annotation
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

// test extend: instance function
@Annotation
public class CustomAnnotation {
    let name: String
    let version: Int64

    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

public class TestClass {
    public const init() {}
}

extend TestClass {
    @CustomAnnotation["Sample", version: 1]
    public func f1() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    func f2() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    const func f3() {
        1
    }

    public const func n1() {
        f3()
    }

    @CustomAnnotation["Sample", version: 1]
    func f4() {
        1
    }

    @Frozen
    public func n2() {
        f4()
    }

    @CustomAnnotation["Sample", version: 1]
    public func f_1() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    func f_2() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    const func f_3() {
        1
    }

    public const func n_1() {
        f_3()
    }

    @CustomAnnotation["Sample", version: 1]
    func f_4() {
        1
    }

    @Frozen
    public func n_2() {
        f_4()
    }
}
