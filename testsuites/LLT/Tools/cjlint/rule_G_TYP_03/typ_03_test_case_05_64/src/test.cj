// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Rectangle {
    let width: Float64
    let height: Float64

    public init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }

    public func area(): Float64 {
        return width * height
    }
}

func test() {
    var r = Rectangle(10.0, 20.0)
    if (r.width != Float64.NaN) {
        println(x)
    }

    if (Float64.NaN != r.height) {
        println(x)
    }

    if (Float64.NaN != r.area()) {
        println(x)
    }
}