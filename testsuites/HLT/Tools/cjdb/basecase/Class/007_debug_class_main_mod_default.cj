/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





class C1 {
    // 成员变量
    public static let counter: Int64 = 3
    public let name: String = "afdoaidfad"

    //主构造函数
    public C1(
        name: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        public var length!: Int64, // member variable parameter
        private var height!: Int64 = width // member variable parameter
    ){
    }

    // 构造函数
    public init (width!: Int64 = 1, length!: Int64, height!: Int64 = width) {
        this.width = width
        this.length = length
        this.height = height
    }

}

class Rectangle {
    //主构造函数
    public Rectangle(var name: String , public var age!: Int32 = 18){} // name、age 是成员变量形参，age 默认18岁


}

main() {
    let newc = C1(length:2)
    let newRectangle = Rectangle("zhangsan")


    return 1
}



