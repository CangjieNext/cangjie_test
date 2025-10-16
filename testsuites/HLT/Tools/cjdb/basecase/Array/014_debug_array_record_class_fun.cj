/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





var top_array: Array<Int32> = [100,200,300]

struct Rectangle {
    // 成员变量
    public var width: Int32 = 10
    public var length: Int32 = 20
    public var rec_array: Array<Int32> = [10,20,30]

    // 构造函数
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
        if (this.length > 100) {
            rec_array[0] = this.length
        }
    }

    // 成员函数
    public func area(arr1!:Array<Int32> = rec_array): Int32 {
        var a = arr1[0]
        var b = arr1[1]
        return a * b
    }
}

open class C1 {
    // 成员变量
    public var num: Int32
    public var c_array: Array<Int32> = [10,20,30]
    public var c_str:String = "c_abc"

    // 构造函数
    public init (num: Int32) {
        this.num = num
        if (this.num > 100) {
            c_array[0] = this.num
        }
    }

    // 成员函数
    public func area(arr1!:Array<Int32> = c_array): Int32 {
        var a = arr1[0]
        var b = arr1[1]
        return a * b
    }

}

class C2 <: C1 {
    public init(){
        super(200)
    }
}


main() {

    var mr1 = Rectangle(10, 20)
    var mr2 = Rectangle(10, 200)
    var arraymain01 : Array<Rectangle> = [mr1, mr2]

    var mc1 = C1(20)
    var mc2 = C1(200)
    var arraymain02 : Array<C1> = [mc1, mc2]

    var mc3 = C2()
    var arraymain03 : Array<C2> = [mc3]

    var main_area1: Int32 = mr2.area()
    var main_area2: Int32 = mc2.area()
    var main_area3: Int32 = area()

    return 1
}


func area(arr1!:Array<Int32> = top_array): Int32 {
    var a = arr1[0]
    var b = arr1[1]
    return a * b
}



