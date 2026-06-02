// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgC

import pkgA.*

public func goo() {
    var e3 = EXHAUSTIVE_OTHER<Int32>.C(CCCC())
    match (e3) {
        case A => println("AAAA")
        case B => println("BBBB")
        case C(c) =>
            print("CCCC");
            print(c.y);
            println(c.x)
        case D(t) =>
            print("DDDD");
            print(t);
    }
}
