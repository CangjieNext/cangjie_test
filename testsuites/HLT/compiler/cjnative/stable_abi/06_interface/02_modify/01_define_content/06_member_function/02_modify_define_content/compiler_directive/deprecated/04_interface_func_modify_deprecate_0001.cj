/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.6.1.4
  @Scene: modify
  @Visibility: public
  @Object: interface func
  @Behavior: modify @Deprecated, warning -> error
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

// ASSERT: scan Incompatible
// ASSERT: scan-not [ABI] 
// ASSERT: scan-2 [API/ABI] Changed the annotation '@Deprecated' of the member function of the interface.
// ASSERT: scan-not [API]
// ASSERT: scan-2 [API/ABI]

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface I1 {
    static func g1() {1}
    func g2() {1}
    @Deprecated["this function is deprecated", strict: true]
    static func g3() {1}
    @Deprecated["this function is deprecated", strict: true]
    func g4() {1}
    @Deprecated["this function is deprecated", strict: true]
    static func g5() {1}
    @Deprecated["this function is deprecated", strict: true]
    func g6() {1}
}
public interface I2 {
    static func g1(): Int64
    func g2(): Int64
    @Deprecated["this function is deprecated", strict: false]
    static func g3(): Int64
    @Deprecated["this function is deprecated", strict: false]
    func g4(): Int64
    @Deprecated["this function is deprecated", strict: true]
    static func g5(): Int64
    @Deprecated["this function is deprecated", strict: true]
    func g6(): Int64
}
public class C1 <: I1 {}
public class C2 <: I2 {
    public static func g1() {1}
    public func g2() {1}
    public static func g3() {1}
    public func g4() {1}
    @Deprecated["this function is deprecated", strict: true]
    public static func g5() {1}
    @Deprecated["this function is deprecated", strict: true]
    public func g6() {1}
}
public func f() {}
