/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




class C1 {
    public let length : Int32           // 未初始化的非静态成员变量定义
    private var width : Int32 = 0       // 初始化的非静态成员变量定义
    protected let diagonalLength: Int32 = 0
    public var varBool: Bool = true
    public var varchar: Rune = '5'
    public var str:String = "strmao"
    public var arrayInt8: Array<Int8> = [10,20,30]
    public static var name : String = "Rec"    // 静态成员变量
    public static var sta_num : Int32 = 0    // 静态成员变量


    public init(length: Int32) {           // OK: 成员变量 `length` 完成初始化
        this.length = length
    }
}


 class C2 {
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


let top_c1 = C2(100, 100)
var top_c2 = C2(200, 200)
var arraytop_c01 : Array<C2> = [top_c1, top_c2]


main() {
    let m_c1 = C1(3)
    var m_c2 = C1(4)
    var arraymainrec01 : Array<C1> = [m_c1, m_c2]



    var newc1 = C2(100, 200)
    var newc2 = C2(200, 400)
    var newc3 = top_c1
    var arraymainrec02 : Array<C2> = [top_c1, newc1, newc2, newc3]

    var slicing1 = arraymainrec02[2..]
    var Functioncall001: Int8 = demofun001()

    return 0
}


func demofun001(): Int8 {
    var arrayfun  = arraytop_c01.clone()

    var cfun1 = C2(50, 200)
    var cfun2 = C2(60, 400)
    var arrayfunrec01 : Array<C2> = [cfun1, cfun2]

    var a_rec = arrayfunrec01[0]
    arrayfunrec01[0] = cfun2
    var b_rec = arrayfunrec01[0]

    return 2
}





