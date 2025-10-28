/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

type int_type = Int64
public platform class C<T> {
    public platform init() {}
    public platform func foo1(): int_type { 2 }
    public platform static func foo2(): int_type { 2 }
    public platform prop p1: int_type { get() {2} }
    public platform static prop p2: int_type { get() {2} }
    public platform var v1: int_type = 2
    public platform static var v2: int_type = 2
}
public func f2() {
    var c = C<int_type>()
    c.foo1() + c.p1 + c.v1 + C<Int32>.foo2() + C<Int32>.p2 + C<Int32>.v2
}
