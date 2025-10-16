/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Coo {
    static func foo<V>(y: V) {
        return y
    }
    static func foo<T>(x1: (Bool) -> T, y1: Int64) {
        var a = y1
        var b: Int64 = 20
        x1(true)
        return b + a
    }
}

main(): Int64 {
    var a = Coo.foo<Int32>(2)
    var d = Coo.foo<Bool>({aa => true}, 2)
    return 0
}
