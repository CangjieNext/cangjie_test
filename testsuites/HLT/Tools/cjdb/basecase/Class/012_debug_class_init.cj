/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





open class C1 {
    private var length : Int32
    private var width : Int32
    public var perimeter: Int32

    private init() {
        this.length = 0
        this.width = 0
        this.perimeter = 0
    }
    public init(squareLength: Int32) {
        this()  // 正确：private修饰的init构造函数可在class内访问
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

    protected init(length: Int32, width: Int32, perimeter: Int32) {
        this.length = length
        this.width = width
        this.perimeter = perimeter
    }

    public func getPerimeter(): Int32 {
        return this.perimeter // Ok: 函数可通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
}

class C2 <: C1 {
    public var size : Int32
    public init(){
        super(10,10,10)
        size = super.perimeter
    }

}

main() {
    var num1 = C1(500)    // OK: public修饰的init构造函数可在class外访问
    var num2 = C1(3, 4) // OK: 缺省时为public，无`public` 或 `private` 修饰的init构造函数可在class外访问
    var num3 = C2()

    var mainnum: Int64 = 1
    var main_get1: Int32 = num2.getPerimeter()
    var main_get2: Int32 = num3.getPerimeter()
    return mainnum
}



