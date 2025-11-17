/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.5.1.2.41
  @Scene: modify
  @Visibility: public
  @Object: extend instance func
  @Behavior: modify func return type to sub
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
// ASSERT: scan-1 [API/ABI] Changed return type of function visible outside the module. The new return type is not a subtype of the old return type.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI] 

package test_stable_abi

// test extend: instance function; B is not a subtype of A
open public class Father {
    public const init(){}
}
public class Son <: Father {
    public const init(){
        Father()
    }
}

interface Addable {
    func add(other: Int64): Int64
}
struct MyInt <: Addable {
    var value = 0
    public const init(){}
    public func add(other: Int64): Int64 {
        value + other
    }
}


public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    public func foo_public_sub():Father {
        Father()
    }
    public func foo_public_sub_notclass_or_interface():Addable {
        MyInt()
    }
    public func foo_public_notsub():Int64 {
        0
    }


    const func foo_const_sub():Father {
        Father()
    }
    const func foo_const_sub_notclass_or_interface():Addable {
        MyInt()
    }
    const func foo_const_notsub():String {
        "String"
    }


    func foo_frozen_sub():Father {
        Father()
    }
    func foo_frozen_sub_notclass_or_interface():Addable {
        MyInt()
    }
    func foo_frozen_notsub():String {
        "String"
    }


    func foo_nonpublic():String {
        "String"
    }

}
public const func foo_1(){
    let x = TestStruct().foo_const_sub()
    let x2 = TestStruct().foo_const_sub_notclass_or_interface()
    let x3 = TestStruct().foo_const_notsub()
}
@Frozen
public func foo_2(){
    let x = TestStruct().foo_frozen_sub()
    let x2 = TestStruct().foo_frozen_sub_notclass_or_interface()
    let x3 = TestStruct().foo_frozen_notsub()
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public func foo_unexport():String{
        "String"
    }
}