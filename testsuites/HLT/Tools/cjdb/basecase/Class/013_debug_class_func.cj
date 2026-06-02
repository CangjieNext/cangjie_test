/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




open class C1 {
    public var length : Int32
    public var width : Int32
    public var perimeter: Int32

    public init() {
        this.length = 0
        this.width = 0
        this.perimeter = 0
    }

    public init(squareLength: Int32) {
        this()
        this.length = squareLength
        this.width = squareLength
        while (this.length > 100) {
            this.length = this.length / (1 + 4)    // OK: 对于成员变量，在构造函数中可以对其进行多次赋值，即使这个变量使用 `let` 修饰。
            this.width = this.width / (6 - 1)
        }
    }



    public func funcdemo1(): Unit { //非抽象成员函数
        return
    }

    public static func funcdemo2(a: Int32): Int32 {    //成员函数 static
        return a
    }

    private func funcdemo3(a: Int32, b: Int32): Int32 { //成员函数 private
        var num3: Int32  =  a + b
        return num3
    }

    protected func funcdemo4(a: Int32, b!: Int32 = 1): Int32 {  //成员函数 protected
        var num4: Int32  = a - b
        return num4
    }

    public open func foo5(): Int32 { //成员函数 open
        return 5
    }


}

open class C2<T> {
    public static let a: Int32 = 0
    public static func foo(b: T): Int32 { //成员函数 static
        return a
    }
}

class C3 <: C1 {
    public override func foo5():Int32 { //成员函数 override
        return 6
    }
}

class C4<T> <: C2<T> {
    public redef static func foo(b: T): Int32 { //成员函数 redef static
        return 2
    }
}

main() {
    var newc1 = C1()
    var main_num1 = newc1.funcdemo1()
    //var main_num2 = newc1.funcdemo2(2)

    var newc2 = C1(200)

    var main_num3 = C2<Int32>.foo(3)
    var main_num4 = newc2.foo5()
    var main_num5 = C3().foo5()

    return 1
}



