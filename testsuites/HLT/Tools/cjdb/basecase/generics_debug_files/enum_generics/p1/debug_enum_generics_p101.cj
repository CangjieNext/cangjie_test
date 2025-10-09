/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public enum TimeUnit1<T> {
    Year(T) | Month(T)

    // 实例方法
    public func funcdemo1(): TimeUnit1<T> {
        print("I am in instance func.\n")
        return this
    }

    // 静态函数
    public static func foo(b: T):T{
        print("I am in static func.\n")
        return b
    }

    // 操作符函数
    public operator func -():TimeUnit1<T>{
        print("I am in operator func.\n")
        return this
    }
}


public enum TimeUnit2<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)

    // 静态函数
    public static func foo(b: T1):T1{
        print("I am in static func.\n")
        return b
    }
}

public enum TimeUnit3<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    ten_enum(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)

    // 操作符函数
    public operator func -():TimeUnit3<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>{
        print("I am in operator func.\n")
        return this
    }
}










