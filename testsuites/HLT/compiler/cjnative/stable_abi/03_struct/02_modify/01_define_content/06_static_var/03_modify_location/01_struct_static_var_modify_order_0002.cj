/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.6.3.1
  @Scene: modify
  @Visibility: non public
  @Object: struct static var
  @Behavior: modify order
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify type
// 修改静态成员变量顺序
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
}

public class MyInt <: Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }

    public func f(): Int64 {
        return 0
    }
}

public struct Rectangle {
    static let width = 10
    public static let a1: I = Subtractable()
    public static let a2: I = Subtractable()
    public static let a3 = Subtractable()
    public static let a4 = Subtractable()
    static let a5 = Subtractable()
    public static let a6 = 20
    public static var a7 = 20
    public static const a8 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle1 {
    static let width = 10
    public static var a1 = 20
    public static let a2 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle2 {
    static let width = 10
    static const a1 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64{
        return a1
    }
}

public struct Rectangle3 {
    static let width = 10
    public static let a1: I = Subtractable()
    public static let a2: Addable = Multiplicable()
    public static let a3 = Subtractable()
    public static let a4 = MyInt()
    static let a5 = MyInt()
    public static let a6 = 20
    public static var a7 = 20
    public static const a8 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle4 {
    static let width = 10
    static let a1: Addable = Multiplicable()

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Addable{
        return a1
    }
}

public struct Rectangle5 {
    static let width = 10
    public static let a1: I = Subtractable()
    public static let a2: Addable = Subtractable()
    public static let a3 = Subtractable()
    public static let a4 = MyInt()
    public static let a6 = 20
    public static var a7 = 20
    public static const a8 = 20
    static let a5 = MyInt()

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle6 {
    static let width = 10
    static let a3 = Subtractable()

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Addable{
        return a3
    }
}

public struct Rectangle7 {
    static let width = 10
    public static let a1: I = Subtractable()
    public static let a2: Addable = Subtractable()
    public static let a3 = Subtractable()
    public static let a4 = MyInt()
    static let a5 = MyInt()
    public static let a6 = 20
    public static var a7 = 20
    public static const a8 = 20

    public func getWidth(): Int64{
        return width
    }
}

public struct Rectangle8 {
    static let width = 10
    static const a13 = 10

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64{
        return a13
    }
}