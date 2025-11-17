/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.7.2.11
  @Scene: modify
  @Visibility: public
  @Object: struct instance var
  @Behavior: modify type
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Modified member variables' type for struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: modify name
// 修改带public修饰符的实例成员变量的类型
package test_stable_abi

public struct Rectangle1 {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
    
    public let a1 = 20
}

public struct Rectangle2 {
    const init() {}    
    public let a2 = 20
}

public struct Rectangle3 {
    @Frozen
    init() {}
    
    public let a3 = 20
}


public open class A {const init() {}}
public class B <: A {const init() {}}
public class C {const init() {}}
public struct S1{
    public let a:A = B()
    public let b = 1
}

struct S2{
    public let a:C = C()
    public let b = 1
}

public struct S22 {
    var s2 = S2()
}

struct S3{
    public let a:A = B()
    public let b = 1
}

public struct S33 {
    @Frozen
    public func f3(){
        let s3 = S3()
    }
}

struct S4{
    const init() {}
    public let a:A = B()
    public let b = 1
}

public struct S44 {
    public const init() {}
    public const func f4(){
        let s4 = S4()
    }
}

struct S5{
    public let a:A = B()
    public let b = 1
}