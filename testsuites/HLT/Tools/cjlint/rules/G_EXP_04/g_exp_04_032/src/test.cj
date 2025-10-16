/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C {
    var count = 0
    var num = 0
}

var c = C()
func getC(): C {
    c.count += 1
    return c
}
func foo(a!: Int64, b!: ()->C, c!: Int64) {
    return a + b().count
}
main() {
    var i = 0
    while (i < 10) {
        i = foo(a: 10, b: getC, c: break)
    }
}

