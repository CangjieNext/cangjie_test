/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.12.2.14
  @Scene: modify
  @Visibility: used in the definition of member variable types in public struct/class types
  @Object: struct init
  @Behavior: add parameters
  @Expect: api incompatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed number of parameters of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

//the init is public, 该新增的函数参数在所有函数参数的末尾，没有默认值
package test_stable_abi

public struct S1{
    public var a = 1
    public init(a1:String){}
    init(a1:Int64, a2!:String = "1.0"){a = 1}
    init(a3:Float64, a4!:Float64 = 1.0){a = 3}
    const init(a5:Int64, a6!:Float64 = 1.0){a = 5}
    public init(a7:Int64, a8!:UInt64 = 1, a9!: Float64 = 0.5){a = 7} 

    public const func foo_S1_1(){
        const x1 = S1(1, a6:1.0)
    } 

    @Frozen
    public func foo_S1_2(){
        let x1 = S1(0.5, a4:0.5)
    }
}

struct S2{
    public var a = 1
    public init(){}
    init(a0:Int64, a1:Int64, a2!:String = "1.0"){a = 1}
    init(a0:Int64, a3:Float64, a4!:Float64 = 1.0){a = 3}
    const  init(a0:Int64, a5:Int64, a6!:Float64 = 1.0){a = 5}
    public init(a0:Int64, a7:Int64, a8!:UInt64 = 1, a9!: Float64 = 0.5, a_add!:String){a = 7}  
}
public struct S2_1{
    let x1:S2 = S2()   
}

public class C2_1{
    let x1:S2 = S2()
}

public const func foo1(){
    const x2 = S2(1, 1, a6:1.0)
}

@Frozen
public func foo2(){
    let x3 = S2(1, 0.5, a4:0.5)
}

struct S3{
    public var a = 1
    public const init(){}
    init(a0:Int64, a1:Int64, a2!:String = "1.0"){a = 1}
    init(a0:Int64, a3:Float64, a4!:Float64 = 1.0){a = 3}
    const  init(a0:Int64, a5:Int64, a6!:Float64 = 1.0){a = 5}
    public init(a0:Int64, a7:Int64, a8!:UInt64 = 1){a = 7}  
}
public const func foo_S3_1(){
    const x1 = S3()
    const x2 = S3(1, 1, a6:1.0)
}
@Frozen
public func foo_S3_2(){
    let x1 = S3(1, 0.5, a4:0.5)
}  

struct S4{
    public var a = 1
    public init(){}
    init(a0:Int64, a1:Int64, a2!:String = "1.0"){a = 1}
    init(a0:Int64, a3:Float64, a4!:Float64 = 1.0){a = 3}
    const  init(a0:Int64, a5:Int64, a6!:Float64 = 1.0){a = 5}
    public init(a0:Int64, a7:Int64, a8!:UInt64 = 1){a = 7}  
}
public const func foo_S4_1(){
    const x1 = S4(1,1, a6:1.0)
}
@Frozen
public func foo_S4_2(){
    let x1 = S4()
    let x2 = S4(1, 0.5, a4:0.5)
}  

struct S5{
    public var a = 1
    public init(a0:Int64, a1:Int64, a2!:UInt64 = 1){a = 1}  
}
