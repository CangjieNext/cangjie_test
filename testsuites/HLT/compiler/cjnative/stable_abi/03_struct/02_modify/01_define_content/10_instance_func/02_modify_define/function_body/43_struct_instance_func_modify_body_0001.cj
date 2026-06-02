/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.10.2.43
  @Scene: modify
  @Visibility: public
  @Object: struct instance func
  @Behavior: modify non const frozen function body.
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: delete non public instance member function
// 修改非const且未标记@Frozen函数的函数体
package test_stable_abi


public struct Rectangle {
    let width = 10
    let a1 = 20

    const public init() {}

    public func getWidth(): Int64{
        return width
    }

    public func geta(a: Int64): Int64 {
        var b = a + 2
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

    public const func getd2(b!: Int64 = 2, c!: Int64 = 2): Int64 {
        return 10
    }
}

