// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Rectangle {
    let width: Float16
    let height: Float16

    public init(width: Float16, height: Float16) {
        this.width = width
        this.height = height
    }

    public func area(): Float16 {
        return width * height
    }
}

func test() {
    var r = Rectangle(10.0, 20.0)
    if (r.width != Float16.NaN) {
        println(x)
    }

    if (Float16.NaN != r.height) {
        println(x)
    }

    if (Float16.NaN != r.area()) {
        println(x)
    }
}