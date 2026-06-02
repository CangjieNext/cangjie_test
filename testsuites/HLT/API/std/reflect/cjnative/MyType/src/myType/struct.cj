/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package MyType.myType

// 非公开 struct 类型。
struct non_public_struct {}

// struct 数据类型。
// 空 struct 类型。
@A0
@A1[12]
@A2[true, r'a']
@A3[false, r'b']
@A4[1.2, r'q', p2: "hello", p3: 14]
@A4[S4(), (), p2: true, p3: C10()]
public struct S0 {}
// 标准 struct 类型。
// struct 类型中不存在抽象成员，也无法继承和被继承，所以不存在 open 修饰符和 abstract 修饰符，由 interface 而来的所有抽象成员都必须被实现。
@A0
@A1[12]
@A2[true, r'a']
@A3[false, r'b']
@A4[1.2, r'q', p2: "hello", p3: 14]
@A4[S4(), (), p2: true, p3: C10()]
public struct S1 {
    // 1 成员变量。
    // 1.1 实例成员变量。
    // 1.1.1 只读实例成员变量。
    // 公开只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public let s1_public_readonly_instance_member_variable_0: Int8 = 12
    // 公开可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public var s1_public_mutable_instance_member_variable_0: Rune = 'a'
    // 只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s1_readonly_instance_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s1_readonly_instance_member_variable_1: Rune = 'a'
    // 可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s1_mutable_instance_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s1_mutable_instance_member_variable_1: Float16 = 1.2

    // 私有只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private var s1_private_readonly_instance_member_variable_0: Float16 = 1.2
    // 私有可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private let s1_private_mutable_instance_member_variable_0: Rune = 'b'

    // 静态成员变量。
    // 公开只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s1_public_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s1_public_readonly_static_member_variable_1: String = "kiki"
    // 公开可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static var s1_public_mutable_static_member_variable_0: Rune = 'a'
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static var s1_public_mutable_static_member_variable_1: String = "kiki"
    // 只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s1_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s1_readonly_static_member_variable_1: Rune = 'b'
    // 可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s1_mutable_static_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s1_mutable_static_member_variable_1: Float16 = 1.2
    // 私有只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static let s1_private_readonly_static_member_variable_0: Float16 = 1.2
    // 私有可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s1_private_mutable_static_member_variable_0: Rune = 'b'
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s1_private_mutable_static_member_variable_1: Rune = 'b'

    // 构造器
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init() {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Rune) {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Int8, p1: Rune) {}

    // 成员属性。
    // 实例成员属性。
    // 公开可变实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop s1_public_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop s1_public_readonly_instance_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 静态成员属性。
    // 公开可变静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var shadow: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop s1_public_mutable_static_member_property_0: Int8 {
        get() {
            shadow
        }
        set(v) {
            shadow = v
        }
    }
    // 公开只读静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop s1_public_readonly_static_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 成员函数。
    // 公开实例成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s1_public_instance_member_function_0(p0: S1, p1: Rune, p2: UInt32, p3: Float32): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s1_public_instance_member_function_1(): Int16 {
        12
    }

    // 公开静态成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16, p3: C1): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_0(p0: UInt16, p1: Rune): UInt32 {
        12
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_1(p0: String, p1: UInt32, p2: C1): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_1(p0: String, p1: UInt32): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s1_public_static_member_function_1(p0: String): Float64 {
        12.9
    }

    // 静态成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s1_static_member_function_0(p0: Unit, p1: C1): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s1_static_member_function_0(p0: Unit): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s1_static_member_function_1(): Unit {}

    // 私有静态成员函数

    // 操作符成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func +(p0: UInt32): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func *(p0: Rune): String {
        "hello"
    }
}

// 实现了 interface 类型的 struct 类型。
@A0
@A1[12]
@A2[true, r'a']
@A3[false, r'b']
@A4[1.2, r'q', p2: "hello", p3: 14]
@A4[S4(), (), p2: true, p3: C10()]
public struct S2 <: I1 {
    // 1 成员变量。
    // 1.1 实例成员变量。
    // 1.1.1 只读实例成员变量。
    // 公开只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public let s2_public_readonly_instance_member_variable_0: Int8 = 12
    // 公开可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public var s2_public_mutable_instance_member_variable_0: Rune = 'a'
    // 只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s2_readonly_instance_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s2_readonly_instance_member_variable_1: Rune = 'a'
    // 可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s2_mutable_instance_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s2_mutable_instance_member_variable_1: Float16 = 1.2

    // 私有只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private var s2_private_readonly_instance_member_variable_0: Float16 = 1.2
    // 私有可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private let s2_private_mutable_instance_member_variable_0: Rune = 'b'

    // 静态成员变量。
    // 公开只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s2_public_readonly_static_member_variable_0: Int8 = 12
    // 公开可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static var s2_public_mutable_static_member_variable_0: Rune = 'a'
    // 只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s2_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s2_readonly_static_member_variable_1: Rune = 'b'
    // 可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s2_mutable_static_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s2_mutable_static_member_variable_1: Float16 = 1.2
    // 私有只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static let s2_private_readonly_static_member_variable_0: Float16 = 1.2
    // 私有可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s2_private_mutable_static_member_variable_0: Rune = 'b'
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s2_private_mutable_static_member_variable_1: Rune = 'b'

    // 构造器
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init() {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Rune) {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Int8, p1: Rune) {}

    // 成员属性。
    // 实例成员属性。
    // 公开可变实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop s2_public_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop s2_public_readonly_instance_member_property_0: Int8 {
        get() {
            12
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i1_public_abstract_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i1_public_abstract_mutable_instance_member_property_1: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_0: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_1: String {
        get() {
            "world"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_2: String {
        get() {
            "kiki"
        }
    }

    // 静态成员属性。
    // 公开可变静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop s2_public_mutable_static_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop s2_public_readonly_static_member_property_0: Int8 {
        get() {
            12
        }
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop i1_public_abstract_mutable_static_member_property_0: Int64 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop i1_public_abstract_readonly_static_member_property_0: Int64 {
        get() {
            12
        }
    }

    // 成员函数。
    // 公开实例成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s2_public_instance_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s2_public_instance_member_function_1(): Int16 {
        12
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i1_public_abstract_instance_member_function_0(): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i1_public_abstract_instance_member_function_1(): Unit {}

    // 公开静态成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16, p3: S1): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_0(p0: UInt16, p1: Rune): UInt32 {
        12
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_1(p0: String, p1: UInt32, p2: C1): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_1(p0: String, p1: UInt32): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s2_public_static_member_function_1(p0: String): Float64 {
        12.9
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_1(p0: Int64, p1: Bool): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_2(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_3(p0: Rune, p1: Float64): Int16 {
        12
    }

    // 静态成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s2_static_member_function_0(p0: Unit, p1: C1): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s2_static_member_function_0(p0: Unit): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s2_static_member_function_1(): Unit {}

    // 私有静态成员函数

    // 操作符成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func +(p0: UInt32): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func *(p0: Rune): String {
        "hello"
    }
}

@A0
@A1[12]
@A2[true, r'a']
@A3[false, r'b']
@A4[1.2, r'q', p2: "hello", p3: 14]
@A4[S4(), (), p2: true, p3: C10()]
public struct S3 <: I1 & I2 & I3 {
    // 1 成员变量。
    // 1.1 实例成员变量。
    // 1.1.1 只读实例成员变量。
    // 公开只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public let s3_public_readonly_instance_member_variable_0: Int8 = 12
    // 公开可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public var s3_public_mutable_instance_member_variable_0: Rune = 'a'
    // 只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s3_readonly_instance_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s3_readonly_instance_member_variable_1: Rune = 'a'
    // 可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s3_mutable_instance_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    var s3_mutable_instance_member_variable_1: Float16 = 1.2

    // 私有只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private var s3_private_readonly_instance_member_variable_0: Float16 = 1.2
    // 私有可变实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private let s3_private_mutable_instance_member_variable_0: Rune = 'b'

    // 静态成员变量。
    // 公开只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s3_public_readonly_static_member_variable_0: Int8 = 12
    // 公开可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static var s3_public_mutable_static_member_variable_0: Rune = 'a'
    // 只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s3_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s3_readonly_static_member_variable_1: Rune = 'b'
    // 可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s3_mutable_static_member_variable_0: Int16 = 0
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static var s3_mutable_static_member_variable_1: Float16 = 1.2
    // 私有只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static let s3_private_readonly_static_member_variable_0: Float16 = 1.2
    // 私有可变静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s3_private_mutable_static_member_variable_0: Rune = 'b'
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static var s3_private_mutable_static_member_variable_1: Rune = 'b'

    // 构造器
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init() {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Rune) {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public init(p0: Int8, p1: Rune) {}

    // 成员属性。
    // 实例成员属性。
    // 公开可变实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop s3_public_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop s3_public_readonly_instance_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 静态成员属性。
    // 公开可变静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop s3_public_mutable_static_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop s3_public_readonly_static_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 成员函数。
    // 公开实例成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s3_public_instance_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s3_public_instance_member_function_1(): Int16 {
        12
    }

    // 公开静态成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16, p3: S1): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_0(p0: UInt16, p1: Rune): UInt32 {
        12
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_1(p0: String, p1: UInt32, p2: C1): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_1(p0: String, p1: UInt32): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s3_public_static_member_function_1(p0: String): Float64 {
        12.9
    }

    // 静态成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s3_static_member_function_0(p0: Unit, p1: C1): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s3_static_member_function_0(p0: Unit): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s3_static_member_function_1(): Unit {}

    // 私有静态成员函数

    // 操作符成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func +(p0: UInt32): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func *(p0: Rune): String {
        "hello"
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_1(p0: Int64, p1: Bool): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_2(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i1_public_abstract_static_member_function_3(p0: Rune, p1: Float64): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i1_public_abstract_instance_member_function_0(): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i1_public_abstract_instance_member_function_1(): Unit {}

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop i1_public_abstract_mutable_static_member_property_0: Int64 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop i1_public_abstract_readonly_static_member_property_0: Int64 {
        get() {
            12
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i1_public_abstract_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i1_public_abstract_mutable_instance_member_property_1: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_0: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_1: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i1_public_abstract_readonly_instance_member_property_2: String {
        get() {
            "hello"
        }
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i2_public_abstract_static_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i2_public_abstract_static_member_function_1(p0: Int64, p1: Bool): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i2_public_abstract_static_member_function_2(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i2_public_abstract_static_member_function_3(p0: Rune, p1: Float64): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i2_public_abstract_instance_member_function_0(): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i2_public_abstract_instance_member_function_1(): Unit {}

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop i2_public_abstract_mutable_static_member_property_0: Int64 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop i2_public_abstract_readonly_static_member_property_0: Int64 {
        get() {
            12
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i2_public_abstract_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i2_public_abstract_mutable_instance_member_property_1: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i2_public_abstract_readonly_instance_member_property_0: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i2_public_abstract_readonly_instance_member_property_1: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i2_public_abstract_readonly_instance_member_property_2: String {
        get() {
            "hello"
        }
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i3_public_abstract_static_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i3_public_abstract_static_member_function_1(p0: Int64, p1: Bool): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i3_public_abstract_static_member_function_2(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func i3_public_abstract_static_member_function_3(p0: Rune, p1: Float64): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i3_public_abstract_instance_member_function_0(): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func i3_public_abstract_instance_member_function_1(): Unit {}

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop i3_public_abstract_mutable_static_member_property_0: Int64 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop i3_public_abstract_readonly_static_member_property_0: Int64 {
        get() {
            12
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i3_public_abstract_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop i3_public_abstract_mutable_instance_member_property_1: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i3_public_abstract_readonly_instance_member_property_0: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i3_public_abstract_readonly_instance_member_property_1: String {
        get() {
            "hello"
        }
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop i3_public_abstract_readonly_instance_member_property_2: String {
        get() {
            "hello"
        }
    }
}

// 常量 struct 类型。
@A0
@A1[12]
@A2[true, r'a']
@A3[false, r'b']
@A4[1.2, r'q', p2: "hello", p3: 14]
@A4[S4(), (), p2: true, p3: C10()]
public struct S4 {
    // 1 成员变量。
    // 1.1 实例成员变量。
    // 1.1.1 只读实例成员变量。
    // 公开只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public let s4_public_readonly_instance_member_variable_0: Int8 = 12
    // 只读实例成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s4_readonly_instance_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    let s4_readonly_instance_member_variable_1: Rune = 'a'

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private let s4_private_mutable_instance_member_variable_0: Rune = 'b'

    // 静态成员变量。
    // 公开只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s4_public_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static let s4_public_readonly_static_member_variable_1: String = "kiki"
    // 只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s4_readonly_static_member_variable_0: Int8 = 12
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static let s4_readonly_static_member_variable_1: Rune = 'b'
    // 私有只读静态成员变量。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    private static let s4_private_readonly_static_member_variable_0: Float16 = 1.2

    // 构造器
    // @A1[12]
    public const init() {}
    // @A1[12]
    public const init(p0: Rune) {}
    // @A1[12]
    public const init(p0: Int8, p1: Rune) {}

    // 成员属性。
    // 实例成员属性。
    // 公开可变实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut prop s4_public_mutable_instance_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读实例成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public prop s4_public_readonly_instance_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 静态成员属性。
    // 公开可变静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public mut static prop s4_public_mutable_static_member_property_0: Int8 {
        get() {
            12
        }
        set(v) {}
    }
    // 公开只读静态成员属性。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static prop s4_public_readonly_static_member_property_0: Int8 {
        get() {
            12
        }
    }

    // 成员函数。
    // 公开实例成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s4_public_instance_member_function_0(): Int16 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public func s4_public_instance_member_function_1(): Int16 {
        12
    }

    // 公开静态成员函数
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16, p3: C1): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_0(p0: UInt16, p1: Rune, p2: Float16): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_0(p0: UInt16, p1: Rune): UInt32 {
        12
    }

    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_1(p0: String, p1: UInt32, p2: C1): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_1(p0: String, p1: UInt32): Float64 {
        12.9
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public static func s4_public_static_member_function_1(p0: String): Float64 {
        12.9
    }

    // 静态成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s4_static_member_function_0(p0: Unit, p1: C1): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s4_static_member_function_0(p0: Unit): Unit {}
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    static func s4_static_member_function_1(): Unit {}

    // 私有静态成员函数

    // 操作符成员函数。
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func +(p0: UInt32): UInt32 {
        12
    }
    @A0
    @A1[12]
    @A2[true, r'a']
    @A3[false, r'b']
    @A4[1.2, r'q', p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: C10()]
    public operator func *(p0: Rune): String {
        "hello"
    }
}
