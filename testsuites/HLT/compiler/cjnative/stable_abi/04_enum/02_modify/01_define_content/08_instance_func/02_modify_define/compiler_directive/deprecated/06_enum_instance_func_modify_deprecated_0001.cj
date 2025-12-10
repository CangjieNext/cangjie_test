/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.8.2.6
  @Scene: modify
  @Visibility: public | used in public @Frozen declare
  @Object: enum instance func
  @Behavior: modify @Deprecated, keep strict
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: modify @Deprecated
// modify operation: modify @Deprecated: keep result
package test_stable_abi

public enum E {
    | A
    public func g1() {1}
    @Deprecated["deprecated1"] public func g2() {1}
    @Deprecated["deprecated1", strict: true] public func g3() {1}
    func g4() {1}
    @Deprecated["deprecated2", strict: false] func g5() {1}
    @Deprecated["deprecated2", strict: true] func g6() {1}
}
@Frozen public func f1() {A.g4() + A.g5()}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {A.g3() + A.g6()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.g4(), 1)
    assert(A.g5(), 1)
}
