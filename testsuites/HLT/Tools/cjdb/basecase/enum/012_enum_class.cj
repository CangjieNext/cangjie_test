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

struct Rectangle<T> {
    public var rec_width: Int32 = 10
    public var rec_time: TimeUnit1<Int8> = TimeUnit1<Int8>.Year(10)
}

class C<T> {
    public var c_width: Int32
    init(a:T){
        this.c_width = 2
    }
    init(a:Int64,b:Int64){
        this.c_width = 2
    }
}

let top_time = TimeUnit1<Int8>.Year(8)

main() {
    var m_newc1 = C<C<Int64>>(1,2)
    let m_time2 = TimeUnit1<C<C<Int64>>>.Year(m_newc1)

    let m_time1 = TimeUnit1<UInt8>.Year(2)
    var arrayEnum01: Array<TimeUnit1<UInt8>> = [m_time1]
    var m_time5 = TimeUnit1<Array<TimeUnit1<UInt8>>>.Year(arrayEnum01)

    var m_rec = Rectangle<Int64>()
    var m_time7 = TimeUnit1<Rectangle<Int64>>.Year(m_rec)

    var m_newc = C<Int64>(1)
    var m_time8 = TimeUnit1<C<Int64>>.Year(m_newc)

    let r1 = C<TimeUnit1<UInt8>>(m_time1)
    let r2 = Rectangle<TimeUnit1<UInt8>>()
    return 0
}
