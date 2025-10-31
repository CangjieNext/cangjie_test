/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class C<T1, T2, T3> {
    public init() {}
    public common func foo(a: T1, b: T1) { a }
    public common func foo(a: T2, b: T2) { a }
    public common func foo(a: T3, b: T3) { a }
}
public func f1() {
    var c = C<Int64, Int32, Float64>()
    c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2)))
}
