/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class C<T> {
    public common init() {}
    public common func foo1() { 1 }
    public common static func foo2() { 1 }
    public common prop p1: Int64 { get() {1} }
    public common static prop p2: Int64 { get() {1} }
    public common var v1: Int64 = 1
    public common static var v2: Int64 = 1
}
public func f1() {
    var c = C<Int64>()
    c.foo1() + c.p1 + c.v1 + C<Int32>.foo2() + C<Int32>.p2 + C<Int32>.v2
}
