/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform class C<T> {
    public platform var v1: T
    public platform static var v2: Int64 = 2
    public platform init(a: T, b: T) { v1 = b }
    public platform func foo1(a: T, b: T) { b }
    public platform static func foo2(a: T, b: T) { b }
    public platform prop p1: T { get() {v1} }
    public platform static prop p2: Int64 { get() {2} }
}
public func f2() {
    var c = C<Int64>(1, 2)
    c.foo1(1, 2) + c.p1 + c.v1 + C<Int64>.foo2(1, 2) + C<Int64>.p2 + C<Int64>.v2
}
