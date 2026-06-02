// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public open class Rectangle {
    protected var aaa = 1
    private var bbb = 2
    let width: Int64
    let height: Int64

    public init(width: Int64, height: Int64) {
        var b: VArray<Int64, $3> = [1, 2, 3]
        var width2: Int64 = 2
        this.width = width2
        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    var r = Rectangle(3, 4)
    r.area()
}
