/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I {
    func test<K, V>() {
        var a = 1
        a
    }
}

class A <: I {
    func test<K1, // 泛型参数列表的名字发生变化是正确的
        V1>() {
        var a = 1
        a
    }
}

main() {
}
