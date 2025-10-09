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


main() {
    let m_c = C1(3)
    let m_length: Int32 = m_c.length
    var m_varBool: Bool = m_c.varBool
    var m_varchar: Rune = m_c.varchar
    var m_str: String = m_c.str
    var m_arrayInt8: Array<Int8> = m_c.arrayInt8
    var m_name : String = C1.name   // OK: 静态变量通过 class 名字访问


    let newc = C2(100, 200)
    let main_area: Int32 = newc.area()


    return 0
}






