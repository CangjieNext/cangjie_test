/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.2.1
  @Scene: modify
  @Visibility: public
  @Object: extend
  @Behavior: move to another file
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template01.cj, template02.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template01.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt %compile_dylib_opt template02.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template01.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

public enum TestE1 {
    XY
}

extend TestE1 {
    public func f1() {
        1
    }

    protected func f2() {
        2
    }

    const func f3(): Int64 {
        return 3
    }

    public const func f4(): Int64 {
        f3()
    }
    func pf3(): Int64 {
        return 3
    }

    @Frozen
    public func pf4(): Int64 {
        pf3()
    }

    func pf5() {
        8
    }

    @Deprecated["This API is deprecated", strict: true]
    public func pf6() {
        pf5()
    }

    const func f5() {
        10
    }

    public const func f6(): Int64 {
        f5()
    }
}

public open class TestClass {
    public const init() {}
}

extend TestClass {
    public func f_1() {
        1
    }
    protected func f_2() {
        2
    }
    const func f_3(): Int64 {
        return 3
    }
    public const func f_4(): Int64 {
        f_3()
    }
    func f_5(): Int64 {
        return 3
    }

    @Frozen
    public func pf_3(): Int64 {
        f_5()
        return 3
    }
}
