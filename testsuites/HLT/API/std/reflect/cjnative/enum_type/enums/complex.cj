/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

@MyAnnotation["hello"]
public enum ComplexEnum0 <: Equatable<ComplexEnum0> & ToString {
    | @MyAnnotation
    A(SSSS)
    | @MyAnnotation
    // 存在同名但不同关联值的构造器
    A(Int64, Bool)
    | @MyAnnotation
    B((Unit, Unit))

    // 运算符重载函数
    public operator func ==(another: ComplexEnum0): Bool {
        match ((this, another)) {
            case (A(s0), A(s1)) => s0 == s1
            case (A(v00, v01), A(v10, v11)) => v00 == v10 && v01 == v11
            case (B(v0), B(v1)) => v0[0] == v1[0] && v0[1] == v1[1]
            case _ => false
        }
    }
    public operator func !=(another: ComplexEnum0): Bool {
        !(this == another)
    }
    // 实例成员函数
    public func toString(): String {
        match (this) {
            case A(s) => "ComplexEnum0.A(${s})"
            case A(v0, v1) => "ComplexEnum0.A(${v0}, ${v1})"
            case B(v) => "ComplexEnum0.B((${v[0]}, ${v[1]}))"
            case _ => "?"
        }
    }
    public func toString(i: Int64): Int64 {
        i + 1
    }
    // 静态成员函数
    public static func staticFunction0(p: (CCCC) -> (Bool, SSSS), p1: CCCC): (Bool, SSSS) {
        p(p1)
    }
    public static func staticFunction0(i: Int64): Int64 {
        i + 1
    }
    // 成员属性
    // 注意，enum的成员属性禁止定义mut，因此只需要测试非mut成员属性
    // 实例成员属性
    public prop instanceProperty0: (SSSS, ComplexEnum0) {
        get() {
            (SSSS((123, Int32(321))), ComplexEnum0.B(((), ())))
        }
    }
    // 静态成员属性
    public static prop staticProperty0: (SSSS, ComplexEnum0) {
        get() {
            (SSSS((123, Int32(321))), ComplexEnum0.B(((), ())))
        }
    }
}
