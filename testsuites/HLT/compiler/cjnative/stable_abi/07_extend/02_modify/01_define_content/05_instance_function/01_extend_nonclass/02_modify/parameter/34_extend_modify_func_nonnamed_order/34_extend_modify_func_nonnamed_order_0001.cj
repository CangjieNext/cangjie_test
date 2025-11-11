/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.5.1.2.34
  @Scene: modify
  @Visibility: public
  @Object: extend instance func
  @Behavior: modify func nonnamed param order
  @Expect: api incompatible & abi incompatible
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
// ASSERT: scan-1 [API/ABI] Changed unnamed parameter order of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test extend: instance function
public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    public func foo_public( b: Int64, a: Int64,c:Int64, d!:Int64 = 1) {
        a + b + c + d
    }
    const func foo_const(a: Int64, b: String, c:Int64, d!:Int64 = 1){
        a + c + d
    }
    func foo_frozen(a: Int64, b: Int64, c:Int64, d!:Int64 = 1){
        a + b + c + d
    }
    func foo_nonpublic(a: Int64, b: Int64, c:Int64, d!:Int64 = 1){
        a + b + d + c
    }

}
public const func foo_1(){
    let x = TestStruct().foo_const(1,"1",1)
}
@Frozen
public func foo_2(){
    let x = TestStruct().foo_frozen(1,1,1)
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public func foo_unexport(a: Int64, b: Int64, c:Int64, d!:Int64 = 1){
        a + b + c + d
    }
}