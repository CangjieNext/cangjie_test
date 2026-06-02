/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package a

private func foo(p: Int64): Unit {
    println("c.p, ${p}")
}

private func foo(p: Bool): Unit {
    println("a.p, ${p}")
}

protected func foo(p: String, p1: String, p2: String): Unit {
    println("a.p, ${p}, ${p1}, ${p2}")
}

func wrapperC(p: Int64): Unit {
    foo(p)
}
