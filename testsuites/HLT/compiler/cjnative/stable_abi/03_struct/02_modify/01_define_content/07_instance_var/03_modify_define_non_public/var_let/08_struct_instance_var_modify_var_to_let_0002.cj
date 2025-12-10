/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.7.3.8
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: struct instance var
  @Behavior: modifier: var to let
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Modified member variables' non-access modifier for struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: delete access modifier: Invisible to Invisible
package test_stable_abi

public struct Rectangle {
    let width = 10
    public let a1 = 20
    let a2 = 20
    public let a3 = 20
    private let a4 = 20
    internal let a5 = 20
    let a6 = 20
    protected let a7 = 20
    public let a8 = 20
    let a9 = 20
    let a10 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct S1{
    var a1 = 20
    public let a2 = 0
    let a3 = 20
    public let a4 = 0

    @Frozen
    public func geta3() {
        return a3
    }

    @Frozen
    public func geta4() {
        return a4
    }
}