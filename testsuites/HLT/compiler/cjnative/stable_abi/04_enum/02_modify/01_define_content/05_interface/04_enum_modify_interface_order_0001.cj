/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.5.4
  @Scene: modify
  @Visibility: public
  @Object: enum
  @Behavior: modify implement interface order
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

// test enum: modify interface
// 修改实现接口的顺序
package test_stable_abi

interface I1 { func f1() {1} }
interface I2 { func f2() {2} }
public enum E1 <: I2 & I1 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
    public func f1() {11}
}
public enum E2 <: I1 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
enum E3 <: I1 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
enum E4 <: I1 {
    | Red | Green | Blue(UInt8)
    public const func g() {1}
}
public class C1 {public let v = E3.Red.g()}
public const func f1() {E4.Green.g()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func f() {
    assert(E3.Red.g(), 1)
    assert(E3.Red.f1(), 1)
    assert(E4.Red.g(), 1)
    assert(E4.Red.f1(), 1)
}
