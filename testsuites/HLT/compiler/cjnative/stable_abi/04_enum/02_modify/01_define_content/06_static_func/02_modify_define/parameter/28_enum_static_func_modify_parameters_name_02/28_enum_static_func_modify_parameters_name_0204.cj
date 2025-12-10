/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.28
  @Scene: modify
  @Visibility: used in public class decl
  @Object: enum[static member function]
  @Behavior: modify function unnamed parameters name
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

// test enum: delete non public static member function
// 修改非命名参数的名称
package test_stable_abi

public class A { var a = Rectangle.Red }

enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    @Frozen
    public static func getA(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getC(1, b:1)
        return b + c
    }

    public const static func getB(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getD(1, b:1)
        return b + c
    }

    static const func getC(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static const func getD(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static const func getE(aa: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(Rectangle.getA(1, b: 1), 2)
    assert(Rectangle.getB(1, b: 1), 2)
    assert(Rectangle.getC(1, b: 1), 2)
    assert(Rectangle.getD(1, b: 1), 2)
    assert(Rectangle.getE(1, b: 1), 2)
}
