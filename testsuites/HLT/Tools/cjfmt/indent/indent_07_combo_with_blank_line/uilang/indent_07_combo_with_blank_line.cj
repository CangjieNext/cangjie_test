/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Shape {
    let name: String = "shape"
    public func area(): Int64 {
        return 1
    }
    public func perimeter(): Int64 {
        return 2
    }
}

func top1(): Int64 {
    return 1
}

func top2(): Int64 {
    return 2
}

func top3(): Int64 {
    return 3
}

main() {
    let s = Shape()
    println(s.area())
    println(s.perimeter())
    println(top1())
    println(top2())
    println(top3())
}
