/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */








open class C1 {
    // 成员变量
    public static let sta: Int64 = 3
    protected let pro: Int64 = 5
    static protected let sta_pro: Int64 = 10
    public let namenum: Int64 = 110

    //主构造函数
    public C1(
        namenum: String, // regular parameter
        var num: Int64,
        let varBool!: Bool = true,
        protected var varchar!: Rune = r'5',
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

class C2 <: C1 {
    public init(){
        super(10, length:10)
        let proc2: Rune = super.varchar
    }
    public let stac2: Int64 = sta
    public let sta_proc2: Int64 = sta_pro
}


main() {
    var newc1 = C1(11, length:2)
    var newc2 = C1(15, width:100, length:20)
    var arraymainrec01 : Array<C1> = [newc1, newc2]

    var newc3 = C2()
    var arraymainrec02 : Array<C2> = [newc3]

    var arraymainrec03 : Array<C1> = [newc3]

    return 1
}






