/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific struct C<T> {
    public specific var v1: T
    public specific static var v2: Int64 = 2
    public specific init(a: T, b: T) { v1 = b }
    public specific func foo1(a: T, b: T) { b }
    public specific static func foo2(a: T, b: T) { b }
    public specific prop p1: T { get() {v1} }
    public specific static prop p2: Int64 { get() {2} }
}
public func f2() {
    var c = C<Int64>(1, 2)
    c.foo1(1, 2) + c.p1 + c.v1 + C<Int64>.foo2(1, 2) + C<Int64>.p2 + C<Int64>.v2
}
