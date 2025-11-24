/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.1.1
  @Scene: add
  @Visibility: public | non public
  @Object: interface
  @Behavior: add interface
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

package test_stable_abi

// test interface: add interface
public interface I1 { public static func g() {1} }
public interface I2<T> { public static func g() {1} }
public interface I5 { public static func g() {1} }
public interface I6<T> { public static func g() {1} }
interface I7 { public static func g() {1} }
interface I8<T> { public static func g() {1} }
interface I3 { public static func g() {1} }
interface I4<T> { public static func g() {1} }
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(I3.g(), 1)
    assert(I4<Int64>.g(), 1)
    assert(I5.g(), 1)
    assert(I6<Int64>.g(), 1)
    assert(I7.g(), 1)
    assert(I8<Int64>.g(), 1)
}
