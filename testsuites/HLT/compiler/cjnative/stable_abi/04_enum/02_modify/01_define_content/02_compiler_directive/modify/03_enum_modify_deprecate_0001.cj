/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.2.3
  @Scene: modify
  @Visibility: public | used in public const declare | used in public struct/class instance var
  @Object: enum
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

// ASSERT: scan Incompatible!
// ASSERT: scan-8 [API/ABI] Modified enum deprecated annotation with compilation error.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-8 [API/ABI]

// test enum: modify @Deprecated
// modify operation: 修改 @Deprecated 编译标记参数条件，使该变量在下游模块中从可⽤变为不可⽤时
package test_stable_abi

@Deprecated["deprecated", strict: true]
enum E11 {
    | E1
    public func g() {11}
}
@Deprecated["deprecated", strict: true]
enum E12 {
    | E2
    public func g() {12}
}
@Deprecated["deprecated", strict: true]
enum E13 {
    | E3
    public const func g() {13}
}
@Deprecated["deprecated", strict: true]
public enum E14 {
    | E4
    public func g() {14}
}
@Deprecated["deprecated", strict: true]
enum E21<T> {
    | E1(T)
    public func g() {21}
}
@Deprecated["deprecated", strict: true]
enum E22<T> {
    | E2(T)
    public func g() {22}
}
@Deprecated["deprecated", strict: true]
enum E23<T> {
    | E3(T)
    public const func g() {23}
}
@Deprecated["deprecated", strict: true]
public enum E24<T> {
    | E4(T)
    public func g() {24}
}
@Deprecated["deprecated", strict: true]
public enum E15 {
    | E5
    public func g() {15}
}
@Deprecated["deprecated", strict: true]
public enum E25<T> {
    | E5(T)
    public func g() {25}
}
@Frozen
public func f1() {
}
public const func f2() {
    36
}
public func check() {
}
