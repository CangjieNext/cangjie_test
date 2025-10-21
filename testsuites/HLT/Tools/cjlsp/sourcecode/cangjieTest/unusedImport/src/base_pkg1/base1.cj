/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unusedImport.base_pkg1

import std.collection.*

public var arrayTopInt64: Array<Int64> = [12, 23, 34]
public var tuple_top1: (Float32, Range<Int64>, String) = (32642.32, -10..=10 : 2, "cangjie go")
let list = ArrayList<Int64>([0, 1, 2])

public enum TimeUnit1 {
    | Year
    | Year(Int32)
}

extend TimeUnit1 {
    public static func fun_s1() : Unit {}
    public static func fun_s1(pa: Int32) : Int32 {
        return pa
    }

    public func fun_E1(v: TimeUnit1): Int32 {
        return match (v) {
            case Year => 0
            case Year(a) => a
        }
    }

    public func fun_E1(para1: Int32): TimeUnit1 {
        var res: TimeUnit1 = TimeUnit1.Year(para1)
        return res
    }
}

public func def_parameter_string(string_para: String, default_para!: String = "您好，cangjie") : String {
    // string类型作为方法入参及形参默认值
    return string_para + default_para
}

public struct test_R4<T1, T2> {
    // 成员变量
    public var width: T1
    public var length: T2

    public init(width: T1, length: T2) {
        this.width = width
        this.length = length
    }

    // 实例方法
    public func funcdemo1(): T2 {
        var funnum = width
        print("I am in instance func.\n")
        return length
    }

    // 静态函数
    public static func foo(b: T1) : T1 {
        print("I am in static func.\n")
        return b
    }

    // 操作符函数
    public operator func +(index: test_R4<T1, T2>): test_R4<T1, T2> {
        print("I am in operator func.\n")
        return index
    }
}

public open class ClassViaOverLoad {
    public var width: Int32 = 10
    public var length: Int32 = 20

    public init() {}
    public init(par_1: Int32, par_2: Int32) {
        this.width = par_1
        this.length = par_2
    }
    public func f_withoutBody() : Unit {}
    public func f_withoutBody(para_1!: Int32) : Unit { para_1 }

    public func fun_1(para_1: Int32, para_2!: Int32 = 1) : Int32 {
        var a1: Int32 = para_1
        var b1: Int32 = para_2
        b1 = para_2 + 3
        return a1 + b1
    }

    public func fun_1(para_1: Int32, para_2: Int32, para_3!: Int32 = -10) : Int32 {
        var pri_v1: Int32 = para_1
        var pri_v2: Int32 = para_2
        var pri_v3: Int32 = para_3
        return pri_v1 + pri_v2 + para_3
    }

    public static func fun_s1(pa_1: Int64) : Int64 {
        var p_arr = arrayTopInt64.clone()
        var va1 = arrayTopInt64[1]
        return va1 + pa_1
    }

    public static func fun_s1(pa_1: Int32, pa_2!: Int32, pa_3!: Int32 = 19) : Int32 {
        var va1 = pa_1
        return va1 + pa_2 + pa_3
    }
}
