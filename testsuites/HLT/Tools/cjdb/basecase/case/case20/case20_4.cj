/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A1 {}

extend A1 {
    func foo<T, U>(a: T, b: U) {
        a;b
    }
}

main() {
    var aa = A1()
    var bb = aa.foo<Int64, Bool>(1, true)
    0
}
