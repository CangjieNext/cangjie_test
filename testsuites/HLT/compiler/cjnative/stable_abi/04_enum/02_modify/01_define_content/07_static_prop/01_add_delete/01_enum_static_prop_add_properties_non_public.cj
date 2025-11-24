/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.7.1.1
  @Scene: add
  @Visibility: public
  @Object: enum static prop
  @Behavior: add static property
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

// test enum: add static properties
// 新增non public静态属性
package test_stable_abi

public enum E1 {
    | A
    public static prop p1: Int64 {get(){1}}
    protected static prop p2: Int64 {get(){2}}
    private static prop p3: Int64 {get(){3}}
    static prop p4: Int64 {get(){4}}
    static prop p5: Int64 {get(){5}}
    static func g() { p3 }
}
enum E2 {
    | B
    public static prop p1: Int64 {get(){1}}
    protected static prop p2: Int64 {get(){2}}
    private static prop p3: Int64 {get(){3}}
    static prop p4: Int64 {get(){4}}
    static prop p5: Int64 {get(){5}}
    static func g() { p3 }
}
enum E3 {
    | C
    public static prop p1: Int64 {get(){1}}
    protected static prop p2: Int64 {get(){2}}
    private static prop p3: Int64 {get(){3}}
    static prop p4: Int64 {get(){4}}
    static prop p5: Int64 {get(){5}}
    static func g() { p3 }
}
public class cls { public var a = E2.p1 }
@Frozen public func f() { E3.p1 }
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E1.p2, 2)
    assert(E1.p4, 4)
    assert(E1.g(), 3)
    assert(E2.p1, 1)
    assert(E2.p2, 2)
    assert(E2.p4, 4)
    assert(E2.g(), 3)
    assert(E3.p1, 1)
    assert(E3.p2, 2)
    assert(E3.p4, 4)
    assert(E3.g(), 3)
    assert(E1.p5, 5)
    assert(E2.p5, 5)
    assert(E3.p5, 5)
}
