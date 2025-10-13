/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.7.1.2
  @Scene: delete
  @Visibility: public
  @Object: struct instance var
  @Behavior: delete public instance member variable
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Deleted instance public variable member from the struct.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: delete non public instance member variable
// 删除带public修饰符的实例成员变量
package test_stable_abi

public struct Rectangle {
    let width = 10
    let a1 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct S1 {
    let a1 = 20
    public let a2 = 0
    let a3 = 20

    @Frozen
    public func geta1() {
        return a1
    }

    @Frozen
    public func geta2() {
        return a2
    }
}
