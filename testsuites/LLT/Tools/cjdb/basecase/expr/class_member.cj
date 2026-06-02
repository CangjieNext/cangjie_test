// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Rectangle {
    let aaa = "123"
    let width: Int64
    let height: Int64

    public init(width: Int64, height: Int64) {
        var a = width + 1
        var varry: VArray<Int64, $3> = [1, 2, 3]
        var tup = (1, 1.1, true)
        var cha = 'a'
        var bool = false
        var str = "123"
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

var RG = Rectangle(4, 5)

main() 
{
    var R = Rectangle(4, 5)
    var S = R.area()
    0
}
