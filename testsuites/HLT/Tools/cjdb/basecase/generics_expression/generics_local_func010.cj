/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class C1<T> {
    public var width: T
    public var length: T
    public init(side: T) {
        this(side, side)
    }
    public init(width: T, length: T) {
        this.width = width
        this.length = length
    }
}

open class C2<X, Y> {
    public var width: X
    public var length: Y

    public init(width: X, length: Y) {
        this.width = width
        this.length = length
    }
    public func funcdemo1(): C1<X> {
        var f_c1 = C1<X>(width)
        return f_c1
    }
}

class C4<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    public var num1: T1
    private var num2: T2
    protected var num3: T3
    public let num4: T4
    public var num5: T5
    public var num6: T6
    public var num7: T7
    public var num8: T8
    public var num9: T9
    public var num10: T10
    public static var num11: Int8 = 10
    public init(num1: T1, num2: T2, num3: T3, num4: T4, num5: T5, num6: T6, num7: T7, num8: T8, num9: T9, num10: T10) {
        this.num1 = num1
        this.num2 = num2
        this.num3 = num3
        this.num4 = num4
        this.num5 = num5
        this.num6 = num6
        this.num7 = num7
        this.num8 = num8
        this.num9 = num9
        this.num10 = num10
    }
}

class CHC1 <: C1<Int32> {
    public let size: Int32
    public init(a: Int32) {
        super(a, a)
        size = super.width * super.length
    }
}

class CHC2<X, Y> <: C2<X, Y> {
    public let chwidth: X
    public let chlength: Y
    public init(a: X, b: Y) {
        super(a, b)
        chwidth = super.width
        chlength = super.length
    }
}

var top_c1 = C1<Int32>(10)
let top_c2 = CHC1(10)

main() {
    let mc_1 = C1<UInt32>(100)
    let mc_2 = C1<Float64>(100.0)
    let mc_3 = C1<Rune>(r'5', r'5')

    var arrayrec01: Array<C1<UInt32>> = [mc_1]
    var mc_4 = C1<Array<C1<UInt32>>>(arrayrec01)
    var mc_7 = C1<C1<UInt32>>(mc_1)

    var mc2_1 = C2<Int32, Int64>(10, 20)
    var mc2_2 = C2<Bool, Bool>(true, false)
    var mc2_3 = C2<String, String>("100", "200")
    var mc2_num1 = mc2_1.funcdemo1()

    var chr1_1 = CHC1(10)
    var chr2_1 = CHC2<Int32, Int64>(10, 20)

    var mc4_1 = C4<Int8, Int8, Int8, Int16, Int16, Int32, Int32, Int64, Int64, Unit>(1, 2, 3, 4, 5, 6, 7, 8, 9, ())

    var m_num2 = f()
    return 0
}

func f(): C1<Bool> {
    var f_c1 = C1<Bool>(true)
    return f_c1
}
