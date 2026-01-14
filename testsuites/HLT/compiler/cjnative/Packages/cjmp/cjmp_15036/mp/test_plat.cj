/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
specific extend <T> A<T> {
    public specific func foo1(a: T, b: T) { b }
    public specific static func foo2(a: T, b: T) { b }
}
public func f2() {
    return A<Int64>().foo1(1, 2) + A<Int64>.foo2(1, 2)
}
