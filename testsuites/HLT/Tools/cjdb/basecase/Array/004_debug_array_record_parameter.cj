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
    public var namenum: Int64 = 1

    //主构造函数
    public Rectangle(
        namenum: Int64, // regular parameter
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
    let rec1 = Rectangle(11, length:2)
    let rec2 = Rectangle(15, width:100, length:20)
    var arraymainrec01 : Array<Rectangle> = [rec1, rec2]


    return 1
}



