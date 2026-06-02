/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var top_length: Int8 = 1

enum TimeUnit {
    Year
}

func func001(): Int64 {
    var a: Int64 = 10
    var b: Int64 = 20
    return a + b
}

struct Rectangle {
    public var width : Int32 = 0
    public var length: Int8 = top_length
    public var heigth: UInt8 = 1 + 9
    public var re_func: Int64 = func001()
    public var time1: TimeUnit = TimeUnit.Year
    public var newRectangle: Rectangle2 = Rectangle2(100, 200)
    public var Re_area: Int32 = newRectangle.area()
    public var array01 : Array<Rectangle2> = [newRectangle]

}

struct Rectangle2 {
    // 成员变量
    public var width: Int32 = 10
    public var length: Int32 = 20

    // 构造函数
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }

    // 成员函数
    public func area(): Int32 {
        return width * length
    }
}



main() {
    let rect = Rectangle()
    var arraymainrec01 : Array<Rectangle> = [rect]
    return 0
}






