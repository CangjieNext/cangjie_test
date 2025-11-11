/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform class C<T> {
}
public func f2() {
    var c = C<Int64>()
    c.foo1() + c.p1 + c.v1 + C<Int32>.foo2() + C<Int32>.p2 + C<Int32>.v2
}
