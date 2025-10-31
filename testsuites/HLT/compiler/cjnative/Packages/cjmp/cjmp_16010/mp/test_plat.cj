/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform enum C<T> {
    | E1(T)
    public platform func foo1(a: T, b: T) { b }
    public platform static func foo2(a: T, b: T) { b }
    public platform prop p1: Int64 { get() {2} }
    public platform static prop p2: Int64 { get() {2} }
}
public func f2() {
    E1(1).foo1(1, 2) + E1(1).p1 + C<Int64>.foo2(1, 2) + C<Int64>.p2
}
