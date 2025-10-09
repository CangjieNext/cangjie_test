/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




struct Rectangle {
    private var perimeter: Int32

    public init() {
        this.perimeter = 0
    }

    public func funcdemo1(): Int32 {
        return this.perimeter
    }

    public func funcdemo2(a: Int32): Int32 {
        var num2: Int32  = this.perimeter + a
        return num2
    }

    public func funcdemo3(a: Int32, b: Int32): Int32 {
        var num3: Int32  = this.perimeter + a + b
        return num3
    }

    public func funcdemo4(a: Int32, b!: Int32 = 1): Int32 {
        var num4: Int32  = this.perimeter + a - b
        return num4
    }

}


main() {
    var rect = Rectangle()

    var main_get1: Int32 = rect.funcdemo1()
    var main_get2: Int32 = rect.funcdemo2(5)
    var main_get3: Int32 = rect.funcdemo3(5, 5)
    var main_get4: Int32 = rect.funcdemo4(5)
    var main_get5: Int32 = rect.funcdemo4(5, b: 3)


    return 1
}



