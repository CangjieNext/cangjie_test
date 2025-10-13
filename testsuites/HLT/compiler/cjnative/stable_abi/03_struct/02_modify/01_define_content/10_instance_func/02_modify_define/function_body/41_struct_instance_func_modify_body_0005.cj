/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.10.2.41
  @Scene: modify
  @Visibility: used in public const declare
  @Object: struct instance func
  @Behavior: modify const function body
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
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API/ABI]

// test struct: modify non public instance member function
// 修改const函数或标记@Frozen函数的函数体
package test_stable_abi

public struct Rectangle {
    let width = 10
    let a1 = 20

    public const init() {}

    public func getWidth(): Int64 {
        return width
    }

    public func geta(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    public const func getb(a: Int64): Int64 {
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
        return 1
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
}
