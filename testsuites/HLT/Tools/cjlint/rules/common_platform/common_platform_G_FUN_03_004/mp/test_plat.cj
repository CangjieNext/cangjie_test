/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific class A {
    specific A() {}
    specific init(a: String) {
        println(a)
    }
    init(a: Int64) {}
}

specific struct S {
    specific S() {}
    specific init(a: String) {
        println(a)
    }
    init(a: Int64) {}
}