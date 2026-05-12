/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.7.2.8
  @Scene: delete
  @Visibility: public
  @Object: interface prop
  @Behavior: delete @Frozen
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
// ASSERT: scan-4 [ABI] Deleted the annotation '@Frozen' of the member property of the interface visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-4 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface I1 {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I2 {
    static mut prop p1: Int64
    mut prop p2: Int64
    static mut prop p3: Int64
    mut prop p4: Int64
}
public class C1 <: I1 {}
public class C2 <: I2 {
    public static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    public mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Frozen
    public static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    @Frozen
    public mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
}
