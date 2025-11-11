/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct B {
}
extend B {
    func test(){
        var count = 0
        count
    }
}
class C {
    var count = 0
    var num = 0
}
var c = C()
var b = B()

func getC(a: Int64): C {
    c.count += 1 
    return c
}

main(): Int64 {
    var num = 5
    getC(b.test()).count += num
    return 1
}

