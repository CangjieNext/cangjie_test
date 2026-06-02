/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_class

public open class test_C1 {

    public var width: Int64 = 0
    protected static let length: String = "你好，cangjie。"
    let area:Int64 = 1
    private var hero = 2

}

public open class test_C2<T> {

    public var width: T
    public var length: T

    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }
}

public open class test_C3{

    public var width: String = "你好，cangjie。"
    private var length: test_C2<Unit>

    public init (width: String, length: test_C2<Unit>) {
        this.width = width
        this.length = length
    }
}


public class test_C4<X,Y> {

    public test_C4(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in main init method.\n")
    }
}

public class test_C5<T1,T2,T3,T4,T5,T6,T7,T8,T9,T10> {

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
    public init (num1: T1, num2: T2, num3: T3, num4: T4, num5: T5, num6: T6, num7: T7, num8: T8, num9: T9, num10: T10) {
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
