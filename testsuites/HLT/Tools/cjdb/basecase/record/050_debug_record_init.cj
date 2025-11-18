/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




struct Rectangle {
    private var length : Int32
    private var width : Int32
    private var perimeter: Int32

    public init() {
        this.length = 0
        this.width = 0
        this.perimeter = 0
    }

    public init(squareLength: Int32) {
        this()  // 正确：private修饰的init构造函数可在struct内访问
        this.length = squareLength
        this.width = squareLength
        while (this.length > 100) {
            this.length = this.length / 10    // OK: 对于成员变量，在构造函数中可以对其进行多次赋值，即使这个变量使用 `let` 修饰。
        }
    }

    public init(length: Int32, width: Int32) {
        this.length = length
        this.width = width
        this.perimeter = 2 * (this.length + this.width) // OK: 构造函数中可以通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }

    private init(a: Int32,b: Int32,c: Int32) {
        this.length = a
        this.width = b
        this.perimeter = c
    }
    public func getPerimeter() : Int32{
        return this.perimeter // Ok: 函数可通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
}


main() {
    var rectangle0 = Rectangle()
    var rectangle1 = Rectangle(500)    // OK: public修饰的init构造函数可在struct外访问
    var rectangle2 = Rectangle(3, 4) // OK: 缺省时为public，无`public` 或 `private` 修饰的init构造函数可在struct外访问

    var mainnum: Int64 = 1
    var main_get1: Int32 = rectangle1.getPerimeter()
    var main_get2: Int32 = rectangle2.getPerimeter()
    return mainnum
}



