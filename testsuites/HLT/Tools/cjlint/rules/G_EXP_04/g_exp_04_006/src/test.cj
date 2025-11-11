/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A{
    var count = 0
}
extend A {
    func test() {
        0
    }
}
class C {
    var count = 0
    var aa = A()
}
var c = C()

func getC(): C {
    c.count += 1
    return c
}

main(): Int64 {
    var num = 5
    getC().aa.count += num
    return 1
}

