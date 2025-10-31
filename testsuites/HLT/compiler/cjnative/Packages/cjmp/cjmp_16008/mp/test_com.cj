/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

type i64 = Int64
public common class C<T> {
    public common init() {}
    public common func foo1(): i64 { 1 }
    public common static func foo2(): i64 { 1 }
    public common prop p1: i64 { get() {1} }
    public common static prop p2: i64 { get() {1} }
    public common var v1: i64 = 1
    public common static var v2: i64 = 1
}
public func f1() {
    var c = C<i64>()
    c.foo1() + c.p1 + c.v1 + C<Int32>.foo2() + C<Int32>.p2 + C<Int32>.v2
}
