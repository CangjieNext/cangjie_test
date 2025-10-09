// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Car {
    var colour = ""

    init(colour: String) {
        this.colour = colour
    }
    init() {
        this.colour = "red"
    }
    static func check(): Int64 {
        println("Car: check")
        return 0
    }
}
class Suv <: Car {
    static redef func check(): Int64 {
        println("Suv: check")
        return 0
    }
}