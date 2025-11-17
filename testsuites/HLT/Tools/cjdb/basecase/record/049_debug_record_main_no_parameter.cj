/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




struct Rectangle {
    // 成员变量
    public static let counter: Int64 = 3
    public let name: String = "afdoaidfad"

    //主构造函数
    public Rectangle(
        name: String, // regular parameter
        var num: Int64,
        let varBool!: Bool = true,
        var varchar!: Rune = r'5',
        var width!: Int64 = 1, // member variable parameter with initial value
        public var length!: Int64, // member variable parameter
        private var height!: Int64 = width // member variable parameter
    ){
    }

    // 构造函数
    public init (num: Int64, varBool!: Bool = true, varchar!: Rune = r'5', width!: Int64 = 1, length!: Int64, height!: Int64 = width) {
        this.num = num
        this.varBool = varBool
        this.varchar = varchar
        this.width = width
        this.length = length
        this.height = height
    }

}

main() {
    let newRectangle = Rectangle(11, length:2)
    var mainnum: Int64 = 1
    return mainnum
}



