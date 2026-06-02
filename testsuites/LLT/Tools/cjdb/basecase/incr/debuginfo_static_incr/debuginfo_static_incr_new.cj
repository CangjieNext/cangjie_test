// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct Rect {
    static let degree: Int64
    static let age: Int64 = 100
    // var boo:Bool=true
    let aa = 1
    static init() {
        degree = 180
        println(Rect.age)
        println(Rect.degree)
    }
}

public func testvariables() {
    var r1 = Rect()
    var i8 = 8i8
}

main(): Int64 {
    testvariables()
    return 0
}
