/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.9.1.3
  @Scene: delete
  @Visibility: non public
  @Object: enum instance prop
  @Behavior: delete static prop
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

// test enum: delete non public instance properties
// 删除不带public修饰符的静态属性
package test_stable_abi

public enum E1 {
    | A
    public prop p1: Int64 {get(){1}}
}
enum E2 {
    | B
    public prop p: Int64 {get(){1}}
    public prop p1: Int64 {get(){1}}
}
enum E3 {
    | C
    public prop p: Int64 {get(){1}}
    public prop p1: Int64 {get(){1}}
}
public class cls { public var a = B.p }
@Frozen public func f() { C.p }
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(B.p1, 1)
    assert(C.p1, 1)
}
