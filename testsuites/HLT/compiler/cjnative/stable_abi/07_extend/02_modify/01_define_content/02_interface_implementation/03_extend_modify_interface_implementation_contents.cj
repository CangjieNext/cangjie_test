/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.2.3
  @Scene: modify
  @Visibility: public
  @Object: extend
  @Behavior: modify interface implementation contents
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
// ASSERT: scan-2 [API/ABI] Changed interfaces that extend implemented.
// ASSERT: scan-2 [API/ABI] Deleted public/protected member function of extend or made it private when the extended type is class.
// ASSERT: scan-2 [API/ABI] Deleted public member function of extend or made it private when the extended type is struct.
// ASSERT: scan-6 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: interface implementation
interface I1 {
    public func f1(): Int64
    public func ff1(): Int64
}
interface I2 {
    public func f2(): Int64
}
interface I3 {}

public class C1 {}
public struct S1 {}

extend C1 <: I2 & I3 {
    public func f2() {
        100
    }

}  

extend S1 <: I2 & I3 {
    public func f2() {
        100
    }
}  

public func global_func_01() {
    true
}
