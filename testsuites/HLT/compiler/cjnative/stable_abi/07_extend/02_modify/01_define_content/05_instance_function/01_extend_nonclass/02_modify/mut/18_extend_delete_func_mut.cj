/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.5.1.2.18
  @Scene: modify
  @Visibility: public,non public
  @Object: extend instance func
  @Behavior: delete mut modifier
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [ABI] Deleted the modifier 'mut' of the member function of the extend.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-3 [ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test extend: instance function
open public class Father {}
public class Son <: Father {}

public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    public func f1() {
        1
    }
    protected func f2() {
        2
    }

    const func f3(): Int64 {
        return 3
    }
    public const mut func f4(): Int64 {
        f3()
    }

    func f5(): Int64 {
        return 5
    }
    @Frozen
    public mut func f6(): Int64 {
        f5()
    }

    // 被全局函数调用
    internal mut func f7(): Int64 {
        return 7
    }

    public func f8() {
        8
    }

    func f10() {
        10
    }
    internal func f11() {
        11
    }

    const func f13(): Int64 {
        return 13
    }
    public const func f14(): Int64 {
        f13()
    }

    func f15(): Int64 {
        return 5
    }
    @Frozen
    public func f16(): Int64 {
        f15()
    }
}

public func global() {
    var s1 = TestStruct()
    s1.f7()
}
