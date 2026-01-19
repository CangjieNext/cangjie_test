/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.2.15
  @Scene: modify
  @Visibility: non public
  @Object: struct static var
  @Behavior: modifier: const -> var
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify access modifier: const to var
package test_stable_abi

public struct Rectangle {
    public static let a1 = 20
    static let a2 = 20
    protected static let a3 = 20
    private static let a4 = 20
    internal static let a5 = 20
    static let a6 = 20
    static let a7 = 20
    static let a8 = 20
    public static const a9 = 20
    static var a10 = 20
    public static var a11 = 20
    static var a12 = 20
}


public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func f(){
    assert(Rectangle.a2, 20)
    assert(Rectangle.a3, 20)
    assert(Rectangle.a5, 20)
    assert(Rectangle.a6, 20)
    assert(Rectangle.a7, 20)
    assert(Rectangle.a8, 20)
    assert(Rectangle.a10, 20)
    assert(Rectangle.a12, 20)
    return 0
}