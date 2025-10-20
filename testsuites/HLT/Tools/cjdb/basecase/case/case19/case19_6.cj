/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1 {
    ABC
    static func f1(a: Int64) {
        func f2(a: Int64) {
            a
        }
        return f2(1) // expr f2(1)
    }

    static func f3<T>(a: T) {
        func f4<T>(a: Int64, b: T) {
            a
        }
        return f4<Bool>(1, true) // expr f4<Bool>(1,true)
    }
}


main() {
    var a = E1.f1(6)
    var b = E1.f3<Bool>(true)
}
