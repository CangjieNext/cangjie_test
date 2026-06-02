/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package a

private func foo(p: Int64): Unit {
    println("b.p, ${p}")
}

func wrapperB(p: Int64): Unit {
    foo(p)
}
