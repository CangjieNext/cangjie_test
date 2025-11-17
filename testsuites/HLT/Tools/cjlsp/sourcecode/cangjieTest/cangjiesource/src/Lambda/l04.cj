package default.Lambda

open class A {
    init(a: Int64, fn: (Int64) -> Int64) {
        fn(a)
    }
    init(a: Int32) {}
    init() {}
}
open class B <: A {
    init(a: Int64, fn: (Int64) -> Int64) {
        fn(a)
    }
    init() {
        super(1, {i => i * i})
    }
    init(a: Int32) {
        this(1, {i => i * i})
    }
}
let c:A = A(1) {i => i * i}
let d:B = B(1) {iabc => iabc * iabc}
let a = 1

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
