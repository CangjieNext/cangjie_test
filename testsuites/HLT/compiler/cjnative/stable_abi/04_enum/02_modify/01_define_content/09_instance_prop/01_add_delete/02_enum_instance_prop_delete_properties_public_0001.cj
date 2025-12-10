/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.9.1.2
  @Scene: delete
  @Visibility: public
  @Object: enum instance prop
  @Behavior: delete static prop
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Deleted public member property of enum visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: delete non public instance properties
// 删除带public修饰符的静态属性
package test_stable_abi

public enum E1 {
    | A
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
enum E2 {
    | B
    public prop p: Int64 {get(){1}}
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
enum E3 {
    | C
    public prop p: Int64 {get(){1}}
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
public class cls { public var a = B.p }
@Frozen public func f() { C.p }
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.p2, 2)
    assert(A.p4, 4)
    assert(A.g(), 3)
    assert(B.p2, 2)
    assert(B.p4, 4)
    assert(B.g(), 3)
    assert(C.p2, 2)
    assert(C.p4, 4)
    assert(C.g(), 3)
}
