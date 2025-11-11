/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class B {
    var count = 0
}
struct C {
    var num = 0
    var aa = B()
}
var c = C()

func getC(): C {
    c.aa.count += 1
    return c
}

main(): Int64 {
    var num = 5
    getC().aa.count += num
    return 1
}

