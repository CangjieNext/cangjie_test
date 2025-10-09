/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit1<T> {
    Year(T) | Month(T)
}

enum TimeUnit2<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
}

enum TimeUnit3<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    ten_enum(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)
}

enum E<T> {
    | A(T)
    | B(T, T)
}

func f(): Int64 {
    let a = A(1)
    let b = E<Int32>.B(2, 2)
    return 10
}

struct Rectangle {
    public var rec_width: Int32 = 10
    public var rec_time: TimeUnit1<Int8> = TimeUnit1<Int8>.Year(10)
}

class C {
    public var c_width: Int32 = 20
    public var c_time: TimeUnit2<Int64, Float64> = TimeUnit2<Int64, Float64>.Day(1, 2.0, 3.0)
}

let top_time = TimeUnit1<Int8>.Year(8)

main() {
    let m_time1 = TimeUnit1<UInt8>.Year(2)
    var m_time2 = TimeUnit2<Int64, Float64>.Day(1, 2.0, 3.0)
    var m_time3 = Month<Rune, Bool>(r'5', true)

    var m_time4 = TimeUnit1<String>.Year("abc")

    var arrayEnum01: Array<TimeUnit1<UInt8>> = [m_time1]
    var m_time5 = TimeUnit1<Array<TimeUnit1<UInt8>>>.Year(arrayEnum01)

    var m_time6 = TimeUnit1<TimeUnit2<Int64, Float64>>.Year(m_time2)

    var m_rec = Rectangle()
    var m_time7 = TimeUnit1<Rectangle>.Year(m_rec)

    var m_newc = C()
    var m_time8 = TimeUnit1<C>.Year(m_newc)

    var m_time9 = ten_enum<Int8, Int8, Int8, Int16, Int16, Int32, Int32, Int64, Int64, Unit>(1, 2, 3, 4, 5, 6, 7, 8, 9,
        ())

    var m_time10 = f()
    return 0
}
