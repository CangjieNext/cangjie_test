/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




struct Rectangle1 {
    public var length : Int32           // 未初始化的非静态成员变量定义
    private var width : Int32 = 0       // 初始化的非静态成员变量定义
    public let diagonalLength: Int32 = 0
    public var varBool: Bool = true
    public var varchar: Rune = '5'
    public static var name: String = "Rec"    // 静态成员变量

    public init(length: Int32) {           // OK: 成员变量 `length` 完成初始化
        this.length = length
    }
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

let toprec1 = Rectangle2(100, 100)
var toprec2 = Rectangle2(200, 200)
var arraytoprec01 : Array<Rectangle2> = [toprec1, toprec2]


main() {
    let rec1 = Rectangle1(3)
    var rec2 = Rectangle1(4)
    var arraymainrec01 : Array<Rectangle1> = [rec1, rec2]

    var rec3 = Rectangle2(100, 200)
    var rec4 = Rectangle2(200, 400)
    var rec5 = toprec1
    var arraymainrec02 : Array<Rectangle2> = [toprec1, rec3, rec4, rec5]

    var slicing1 = arraymainrec02[2..]
    var Functioncall001: Int8 = demofun001()


    return 0
}

func demofun001(): Int8 {
    var arrayfun  = arraytoprec01.clone()

    var recfun1 = Rectangle2(50, 200)
    var recfun2 = Rectangle2(60, 400)
    var arrayfunrec01 : Array<Rectangle2> = [recfun1, recfun2]

    var a_rec = arrayfunrec01[0]
    arrayfunrec01[0] = recfun2
    var b_rec = arrayfunrec01[0]

    return 2
}





