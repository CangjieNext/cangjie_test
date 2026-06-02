/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.39
  @Scene: modify
  @Visibility: public
  @Object: struct static func
  @Behavior: modify const function default value
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed parameter default value of a const function or function marked with @Frozen.
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// test struct: modify public const function body.
// 修改参数的默认值


package test_stable_abi


public struct Rectangle {
    let width = 10
    let a1 = 20

    const public init() {}

    public func getWidth(): Int64{
        return width
    }

    public func geta(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    const public func getb(a: Int64): Int64 {
        let b = a + 1
        return b
    }

    @Frozen
    public func getc(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    func getd() {
        return 0
    }

    @Frozen
    public func gete() {
        let x = getd()
        return x
    }

    const func getf() {
        return 0
    }

    public const func getg() {
        let x = getf()
        return x
    }

    @Frozen
    func geth() {
        return 0
    }

    @Frozen
    public func geti() {
        let x = geth()
        return x
    }

    @Frozen
    public func getd1(b!: Int64 = 2, c!: Int64 = 2): Int64 {
        return 10
    }

    public const func getd2(b!: Int64 = 3, c!: Int64 = 2): Int64 {
        return 10
    }

}