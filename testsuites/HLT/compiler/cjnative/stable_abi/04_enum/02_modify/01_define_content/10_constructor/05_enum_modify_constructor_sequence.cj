/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.10.5
  @Scene: modify
  @Visibility: public | non publuc | used in @Frozen public declare
  @Object: enum
  @Behavior: modify constructor sequence
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-6 [ABI] Modified order of constructor for enum visible outside the module.
// ASSERT: scan-6 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// 修改构造器的顺序

package test_stable_abi

public enum E11 {
    | Green | Blue(UInt8) | Red
    public func g() {1}
}
enum E12 {
    | Green | Blue(UInt8) | Red
    public func g() {1}
}
enum E13 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
public class C1 {public let v = E12.Red.g()}
@Frozen public func f1() {E13.Blue(1).g()}
public enum E21 {
    | Green | Blue | Red | ...
    public func g() {1}
}
enum E22 {
    | Green | Blue | Red | ...
    public func g() {1}
}
enum E23 {
    | Green | Blue | Red | ...
    public func g() {1}
}
public class C2 {public let v = E22.Blue.g()}
@Frozen public func f2() {E23.Red.g()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E12.Red.g(), 1)
    assert(E12.Green.g(), 1)
    assert(E12.Blue(1).g(), 1)
    assert(E13.Red.g(), 1)
    assert(E13.Green.g(), 1)
    assert(E13.Blue(1).g(), 1)
    assert(E22.Red.g(), 1)
    assert(E22.Green.g(), 1)
    assert(E22.Blue.g(), 1)
    assert(E23.Red.g(), 1)
    assert(E23.Green.g(), 1)
    assert(E23.Blue.g(), 1)
}
