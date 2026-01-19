/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.26
  @Scene: modify
  @Visibility: public
  @Object: struct instance func
  @Behavior: modify public function generics constraint: sub type -> parent type
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed generic constraint of function visible outside the module.
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify generics
// 修改某个泛型参数的上界约束A为B，B是A的父类型
package test_stable_abi

import std.random.*

open public class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public struct Rectangle {
    let width = 10
    let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    func geta<T, U>(): Int64 {
        return 0
    }

    public func getb<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public func getc<T, U>(): Int64 where T <: Object {
        return 0
    }

    func geta1<T, U>(): Int64 where T <: B {
        return 0
    }

    @Frozen
    public func geta2() {
        let x = geta1<B, Random>()
        return 1
    }

    public func geta3<T, U>(): Int64 where T <: B {
        return 1
    }
}