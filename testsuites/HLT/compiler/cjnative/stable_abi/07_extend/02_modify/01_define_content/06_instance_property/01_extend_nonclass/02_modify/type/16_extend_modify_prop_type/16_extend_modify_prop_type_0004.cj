/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.6.1.2.16
  @Scene: modify
  @Visibility: unexported
  @Object: extend instance prop
  @Behavior: modify prop type
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Compatible!
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test extend: instance property
open class U1 { }
class U2 <: U1 { }
public struct TestStruct {
    public var a: Int64 = 0
}

extend TestStruct{
    public prop prop_public: U1{
        get(){
            U1()
        }
    }
    prop prop_frozen: U1{
        get(){
            U1()
        }
    }
    prop prop_nonpublic:U1{
        get(){
            U1()
        }
    }

}

@Frozen
public func foo_1(){
    let x = TestStruct().prop_frozen
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public prop prop_:U2{
        get(){
            U2()
        }
    }
}