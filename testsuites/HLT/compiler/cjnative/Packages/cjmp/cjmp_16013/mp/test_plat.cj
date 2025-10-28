/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform class C<T1, T2, T3> {
    public platform func foo(a: T1, b: T1) { b }
    public platform func foo(a: T2, b: T2) { b }
    public platform func foo(a: T3, b: T3) { b }
}
public func f2() {
    var c = C<Int32, Float64, Int64>()
    c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2)))
}
