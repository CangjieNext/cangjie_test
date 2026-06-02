// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

var g = 0

class C {
    public var a: String = "A"
    public var b: Int64 = 1
    public func test() {
        this.a += "c"
        this.b += 2
    }
}

func f() {
    var c = C()
    g++
    return c
}

main() {
    f().a += f().a
    f().test()
    return g - 1
}
