/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.7.2.16
  @Scene: modify
  @Visibility: public
  @Object: interface prop
  @Behavior: modify getter\setter function marked with @Frozen
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-4 [ABI] The body of a const function or function marked with @Frozen changed
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-4 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface I {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Frozen
    static mut prop p3: Int64 {
        get() {1;1}
        set(v) {1;v}
    }
    @Frozen
    mut prop p4: Int64 {
        get() {1;1}
        set(v) {1;v}
    }
}
public class C <: I {}
