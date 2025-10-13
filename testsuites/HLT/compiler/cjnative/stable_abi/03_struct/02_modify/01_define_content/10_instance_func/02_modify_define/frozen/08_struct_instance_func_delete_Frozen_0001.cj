/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.10.2.8
  @Scene: delete
  @Visibility: public
  @Object: struct instance func
  @Behavior: deelete @Frozen
  @Expect: api compatible & abi incompatible
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
// ASSERT: scan-1 [ABI] Changed member function's annotation of struct visible outside the module. Frozen deleted.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API/ABI]

// test struct: delete @Frozen with member function
package test_stable_abi

public struct Rectangle {
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64 {
        return width
    }

    public func geta(): Int64 {
        return 0
    }

    @Frozen
    func geta1() {
        return 0
    }

    @Frozen
    public func geta2() {
        let x = geta1()
        return x
    }
}
