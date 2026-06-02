/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public func call(): Int64 {
    var c1: faterInterface<String> = r'f'
    var c2: MyInterface = r's'
    var c3: Rune = 'c'

    if (c1.foo1() == "char" && c1.foo2(a: "父接口") == "父接口" && c1.foo3() == "char") {
        if (c2.foo1() == "char" && c2.foo2(a: "子接口") == "子接口" && c2.foo3() == "char") {
            if (c3.foo1() == "char" && c3.foo2(a: "Rune") == "Rune" && c3.foo3() == "char") {
                return 0
            }
        }
    }
    return 1
}
