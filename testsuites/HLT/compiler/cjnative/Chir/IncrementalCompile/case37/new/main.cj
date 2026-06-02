/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.A
import p1.A2 as Aoo
import p1.A3

main(): Int64 {
    var a: A<Int32> = A<Int32>(1)
    if (a.a != 1) {
        return 1
    }
    var b: Aoo<Int32> = Aoo<Int32>(1)
    if (b.b != 1) {
        return 1
    }
    var c: A3<Int32> = A3<Int32>(1)
    if (c.c != 1) {
        return 1
    }
    return 0
}
