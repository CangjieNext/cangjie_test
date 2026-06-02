// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var i = 0
    var area = 0
    while (i < 3) {
        let f = createFig(i, 2 * i, 3 * i)
        area = area + f.area()
        i = i + 1
    }
    return area - 54
}

func createFig(key: Int64, x: Int64, y: Int64): Figure {
    if (key % 3 == 0) {
        return Square(x)
    } else if (key % 3 == 1) {
        return Rect(x, y)
    } else {
        return Circle(x)
    }
}

abstract class Figure {
    public open func area(): Int64 {
        return 0
    }
}

class Square <: Figure {
    public let a: Int64

    public init(a_: Int64) {
        a = a_
    }

    public override func area() {
        return a * a
    }
}

class Rect <: Figure {
    public let a: Int64
    public let b: Int64

    public init(a_: Int64, b_: Int64) {
        a = a_
        b = b_
    }

    public override func area() {
        return a * b
    }
}

class Circle <: Figure {
    public let r: Int64

    public init(r_: Int64) {
        r = r_
    }

    public override func area() {
        return 3 * r * r
    }
}
