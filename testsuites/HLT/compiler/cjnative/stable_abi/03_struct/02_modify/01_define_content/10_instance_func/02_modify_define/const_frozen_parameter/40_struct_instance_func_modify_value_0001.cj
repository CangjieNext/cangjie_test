/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.40
  @Scene: modify
  @Visibility: public
  @Object: struct instance func
  @Behavior:  modify non const func or non @Frozen func default value
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

// 修改非 const 函数且未标记 @Frozen 函数的参数的默认值
package test_stable_abi

public struct Rectangle {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
}

open public class A {const init() {}}
public class B <: A {const init() {}}
public class C <: A {const init() {}}

public struct S1 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    @Frozen
    public func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
}