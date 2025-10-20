/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public open class Rectangle { 
    protected var aaa = 11
    private var boolvar01= true
    static private var ccc = 'A'
    var name = "rectangle"
    let width: Int64
    let height: Int64
    let var01=10

    public init(height22: Int64) {
        var b:VArray<Int64, $3> = [1, 2, 3]
        var width2: Int64 = 20
        this.width = width2     // expr this.width
        this.height = height22
    }

    public func area() {
        width * height
    }
}

main(): Int64 {
    let classvar01=Rectangle(2).area()
    return 0
}
