// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct Rectangle {
    let width: Float32
    let height: Float32

    public init(width: Float32, height: Float32) {
        this.width = width
        this.height = height
    }

    public func area(): Float32 {
        return width * height
    }
}

func test() {
    var r = Rectangle(10.0, 20.0)
    if (r.width != Float32.NaN) {
        println(x)
    }

    if (Float32.NaN != r.height) {
        println(x)
    }

    if (Float32.NaN != r.area()) {
        println(x)
    }
}