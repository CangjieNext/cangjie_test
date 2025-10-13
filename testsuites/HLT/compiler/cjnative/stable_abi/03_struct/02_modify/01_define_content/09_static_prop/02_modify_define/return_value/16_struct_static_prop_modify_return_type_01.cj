/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.9.2.16
  @Scene: modify
  @Visibility: public
  @Object: struct static prop
  @Behavior: modify properties return type
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
// ASSERT: scan-3 [API/ABI] Changed member property's return type of struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-3 [API/ABI]

// test struct: modify type
// 对属性返回值的修改，B是A的子类型，且A和B均为class或interface类型
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
    static var a1: I = Subtractable()
    static var a2: Addable = Subtractable()
    static var a3: Addable = Subtractable()
    static var a4 = MyInt()
    static var a5 = MyInt()

    public func getWidth(): Int64 {
        return width
    }

    public mut static prop geta: I {
        get() {
            println("get")
            a1
        }
        set(value) {
            println("set")
            a1 = value
        }
    }

    public mut static prop getb: Addable {
        get() {
            println("get")
            a2
        }
        set(value) {
            println("set")
            a2 = value
        }
    }

    public mut static prop getc: Addable {
        get() {
            println("get")
            a3
        }
        set(value) {
            println("set")
            a3 = value
        }
    }

    public mut static prop getd: MyInt {
        get() {
            println("get")
            a4
        }
        set(value) {
            println("set")
            a4 = value
        }
    }

    public mut static prop gete: MyInt {
        get() {
            println("get")
            a5
        }
        set(value) {
            println("set")
            a5 = value
        }
    }
}
