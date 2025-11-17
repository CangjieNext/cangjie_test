/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.3.2.43
  @Scene: modify
  @Visibility: public; used in public const declare
  @Object: extend static func
  @Behavior: modify return type A to B; B is the subtype of A, both A and B are class or interface types; the parameter of const function is modifyed to cause func body changed
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan [ABI] The body of a const function or function marked with @Frozen changed.

package test_stable_abi

// test extend: instance function
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
    public static func f1() {
        0
    }

    public static func foo_public_sub():Father {
        Father()
    }
    public static func foo_public_sub_notclass_or_interface():Addable {
        MyInt()
    }
    public static func foo_public_notsub():String {
        "String"
    }


    static const func foo_const_sub():Son {
        Son()
    }
    static const func foo_const_sub_notclass_or_interface():Addable {
        MyInt()
    }
    static const func foo_const_notsub():String {
        "String"
    }


    static func foo_frozen_sub():Father {
        Father()
    }
    static func foo_frozen_sub_notclass_or_interface():Addable {
        MyInt()
    }
    static func foo_frozen_notsub():String {
        "String"
    }


    static func foo_nonpublic():String {
        "String"
    }

}
public const func foo_1(){
    let x = TestStruct.foo_const_sub()
    let x2 = TestStruct.foo_const_sub_notclass_or_interface()
    let x3 = TestStruct.foo_const_notsub()
}
@Frozen
public func foo_2(){
    let x = TestStruct.foo_frozen_sub()
    let x2 = TestStruct.foo_frozen_sub_notclass_or_interface()
    let x3 = TestStruct.foo_frozen_notsub()
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public static func foo_unexport():String{
        "String"
    }
}
public func global_func_01(){
    TestStruct.foo_const_sub() is Father
    && TestStruct.foo_frozen_sub() is Father
}