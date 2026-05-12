/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

type i64 = Int64
public specific class C<T> {
    public specific init() {}
    public specific func foo1(): i64 { 2 }
    public specific static func foo2(): i64 { 2 }
    public specific prop p1: i64 { get() {2} }
    public specific static prop p2: i64 { get() {2} }
    public specific var v1: i64 = 2
    public specific static var v2: i64 = 2
}
public func f2() {
    var c = C<i64>()
    c.foo1() + c.p1 + c.v1 + C<Int32>.foo2() + C<Int32>.p2 + C<Int32>.v2
}
