/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

import a.sub.foo

// import而来的函数foo由于与以下函数foo函数签名相同而被shadow，预期调用以下foo
private func foo(p: Int64): Unit {
    println("a.p, ${p}")
}

func wrapperA(p: Int64): Unit {
    foo(p)
}
