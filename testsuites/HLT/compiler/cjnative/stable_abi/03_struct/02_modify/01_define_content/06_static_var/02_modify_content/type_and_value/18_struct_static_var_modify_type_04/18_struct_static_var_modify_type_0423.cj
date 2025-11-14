/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.2.18
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: struct static var
  @Behavior: modify static var type
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed return type of function visible outside the module. The new return type is not a subtype of the old return type.
// ASSERT: scan-1 [API/ABI] Modified static variables' type for struct visible outside the module. The new type is not a subtype of the old type.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

// test struct: modify type
// B不是A的子类型
package test_stable_abi


public interface I {
    func f(): Int64
}

public interface Addable <: I {
    func add(other: Int64): Int64
}

public open class Subtractable <: Addable {

    public open func add(other: Int64): Int64 {
        return 0
    }

    public open func sub(other: Int64): Int64 {
        return 0
    }

    public open func f(): Int64 {
        return 0
    }

    const init() {}
}

public struct Multiplicable <: Addable {

    public func add(other: Int64): Int64 {
        return 0
    }

    public func sub(other: Int64): Int64 {
        return 0
    }

    public func mul(other: Int64): Int64 {
        return 0
    }

    public func f(): Int64 {
        return 0
    }
    
    const init() {}
}

struct S1 {
    const init() {}
    public static let a1 : Addable = Subtractable()

    static const a2 : Addable = Subtractable()
    public static const func f2(){
        a2
    }
    
    static let a3 : I = Subtractable()
    @Frozen
    public static func f3(){
        a3
    }
    
    static let a4 : Addable = Subtractable()

    public static let a5 : Addable = Multiplicable()

    static const a6 : Addable = Multiplicable()
    public static const func f6(){
        a6
    }
    
    static let a7 : Addable = Multiplicable()
    @Frozen
    public static func f7(){
        a7
    }
    
    static let a8 : Addable = Multiplicable()

    static let width = 10
    public func getWidth(): Int64{
        return width
    }
}

public struct S {
    public const init() {}
    public const func f1(){
        let s1 = S1()
    }
    static let heigh = 20
    public func getHeigh(): Int64{
        return heigh
    }
}