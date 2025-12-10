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
  @Object: struct instance func
  @Behavior:  modify const func or @Frozen func default value
  @Expect: api compatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed parameter default value of a const function or function marked with @Frozen.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// ASSERT: scan-not [API/ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// 修改 const 函数或标记 @Frozen 函数的参数的默认值
package test_stable_abi

public struct Rectangle {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
}

open public class A {const init() {}}
public class B <: A {const init() {}}
public class C <: A {const init() {}}

public struct S1 {
    const init() {}
    public func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    public const func f22() {
        return f2(1.1, B(), c:1, d:3)
    }

    @Frozen
    public func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(S1().f1(1.2, B(), c:7, d:1), 1.2)
    assert(S1().f2(1.2, B(), c:7, d:3), 1.2)
    assert(S1().f3(1.2, B(), c:7, d:3), 1.2)
    return 0
}