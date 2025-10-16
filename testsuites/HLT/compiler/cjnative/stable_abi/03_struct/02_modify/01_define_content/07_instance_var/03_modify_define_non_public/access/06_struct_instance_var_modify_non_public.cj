/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.7.3.6
  @Scene: modify
  @Visibility: non public
  @Object: struct instance var
  @Behavior: keep non public
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify access modifier: Invisible to Invisible
package test_stable_abi

public struct Rectangle {
    let width = 10
    public let a1 = 20
    let a2 = 20
    public let a3 = 20
    internal let a4 = 20
    protected let a5 = 20
    let a6 = 20
    private let a7 = 20
    public let a8 = 20
    private let a9 = 20
    protected let a10 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct S1{
    var a1 = 20
    public let a2 = 0
    var a3 = 20
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