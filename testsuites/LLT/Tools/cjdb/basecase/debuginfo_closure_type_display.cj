// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E {
    Default | Ctor(String)
}

class A {
    var member = "HHH"
}

main() {
    let b = Default
    let c = [1, 2]
    let d = A()
    var foo = {
        para: Int64 => return b
    }
    var goo = {
        => return c
    }
    var zoo = {
        para1: VArray<Int64, $3>, para2: Rune => return d
    }
    0
}
