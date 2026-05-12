/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific interface I<T> {
    public specific func foo1(a: T, b: T) { b }
    public specific static func foo2(a: T, b: T) { b }
    public specific prop p1: Int64 { get() {2} }
    public specific static prop p2: Int64 { get() {2} }
}
public func f2() {
    var c = C<Int64>()
    c.foo1(1, 2) + c.p1 + I<Int64>.foo2(1, 2) + I<Int64>.p2
}
