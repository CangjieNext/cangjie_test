/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.7.2.10
  @Scene: modify
  @Visibility: public
  @Object: struct instance var
  @Behavior: modify name
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
// ASSERT: scan-1 [ABI] Added member variable to a struct.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [API/ABI]

// test struct: modify name
// 修改带public修饰符的实例成员变量的变量名
package test_stable_abi

public struct Rectangle {
    let width = 10
    let a1 = 20
    private let a2 = 20
    internal let a3 = 20
    protected let a4 = 20
    public let a5 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public open class A {}

public class B <: A {}

public class C {}

public struct S2 {
    public let a: A = B()
    let b: A = B()
    public let cc = 1
    public let d = 1

    @Frozen
    public func getb() {
        return b
    }

    @Frozen
    public func getd() {
        return d
    }
}
