/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




package pkgs



public enum TimeUnit {
    | Year(Int8)
    | Month(Int32, Int64)
}



public struct Rectangle_ex {
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

public var arrayTopInt8 : Array<Int8> = [1, 2, 3]
public var top_str:String = "top_abc"

public class C1 {
    // 成员变量
    public var width: Int32 = 10
    public var length: Int32 = 20
    public var time: TimeUnit = TimeUnit.Year(19)
    public var newRectangle1: Rectangle_ex = Rectangle_ex(100, 200)
    public var array01 : Array<Rectangle_ex> = [newRectangle1]
    public var c_area: Int32 = newRectangle1.area()
    public var c_str:String = "c_abc"

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





