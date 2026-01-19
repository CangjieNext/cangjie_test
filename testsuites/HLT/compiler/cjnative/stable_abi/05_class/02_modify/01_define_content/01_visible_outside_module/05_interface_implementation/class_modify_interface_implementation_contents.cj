/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.5
  @Scene: modify
  @Visibility: public
  @Object: class
  @Behavior: class modify interface implementation contents
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Changed interfaces that class implemented.
// ASSERT: scan-1 [API] Added instance member function without default implementation of class.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-1 [API]
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

public class C1 <: I1 & I2 {
    public func f1() {
        100
    }
    public func ff1() {
        100
    }
    public func f2(): Int64 {
        1
    }
} 

public func checker(): Int64 {
    let c1 = C1()
    if (c1.f1() == 100 && c1.ff1() == 100 && c1.f2() == 1) {
    } else {
        return 1
    }
    0
}