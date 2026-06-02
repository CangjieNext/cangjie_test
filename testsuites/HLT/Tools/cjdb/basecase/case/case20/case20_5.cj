/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1{
    static func foo<T, U>(a: T, b: U) {
        a;b
    }
}

class A1 <:I1{}

main() {
    var aa = A1()
    var bb = A1.foo<Int64, Bool>(1, true)
    0
}
