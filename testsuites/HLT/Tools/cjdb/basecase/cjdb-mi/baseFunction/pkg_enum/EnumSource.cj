/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_enum

public enum TimeUnit1 {
    | Year
    | Year(Int32)

}

extend TimeUnit1{
    public static func fun_s1():Unit{}
    public static func fun_s1(pa:Int32):Int32{
        return pa
    }

    public func fun_E1(v: TimeUnit1): Int32 {
        return match (v) {
            case Year => 0
            case Year(a) => a
        }
    }

    public func fun_E1(para1: Int32): TimeUnit1 {
        var res: TimeUnit1 =TimeUnit1.Year(para1)
        return res
    }

}

public enum TimeUnit2<T1,T2> {
    | Year(T1)
    | Year(T1,T2)

    public func fun_E2(v: TimeUnit2<T1,T2>): Int32 {
            var res :Int32 =  match (v) {
                case Year(p1) => 0
                case Year(p2,p3) => 2
            }
            return res
        }
}

extend<T1,T2> TimeUnit2<T1,T2> {
    public func fun_E2(para1: T1,para2: T2): TimeUnit2<T1,T2> {
        var res =TimeUnit2<T1,T2>.Year(para1,para2)
        return res
    }

    public static func fun_sE1(p1:T1):TimeUnit2<T1,T2>{
        var res =TimeUnit2<T1,T2>.Year(p1)
        return res
    }

    public static func fun_sE1():TimeUnit2<Int32,Int32>{
        var res =TimeUnit2<Int32,Int32>.Year(TimeUnit1.fun_s1(32))
        return res
    }

}

public enum test_RGBColor {
    | Red | Blue | Yellow
    | Red(UInt8) | Green(UInt8) | Yellow(Int8,Int16,Int64,UInt8,Float16,Float32,Float64,Bool,Rune,String)
}

public enum test_TimeUnit1<T> {
    Year(T) | Month(T)
}

public enum test_TimeUnit2<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    ten_enum(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)
}

