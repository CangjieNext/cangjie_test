/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




struct Rectangle {
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

    public func foo(x: Int32): Int32 {
        var temp = this.width
        return temp + x 
    }

    mut func goo(x: Int32): Int32 {
        var temp: Int32 = 50
        this.width = x + temp
        return this.width
    }
}


main() {
    let rect = Rectangle(3)
    var main_length: Int32 = rect.length    // OK: 访问控制符为 public，可以在struct外访问
    var main_diagonalLength: Int32 = rect.diagonalLength    // OK: 访问控制符缺省时为 public，可以在struct外访问
    var main_name: String = Rectangle.name   // OK: 静态变量通过 struct 名字访问

    let newRectangle = Rectangle2(100, 200)
    let main_area: Int32 = newRectangle.area()

    var main_bool: Bool = rect.varBool
    var main_char: Rune = rect.varchar

    let stu_foo = newRectangle.foo(20)
    var stu = Rectangle2(200,200)
    let stu_goo = stu.goo(20)
    return 0
}






