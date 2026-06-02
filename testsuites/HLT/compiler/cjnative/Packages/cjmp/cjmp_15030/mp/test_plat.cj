/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
specific extend <K> A<K> {
    public specific func foo1(a: K, b: K) { b }
    public specific static func foo2(a: K, b: K) { b }
}
public func f2() {
    return A<Int64>().foo1(1, 2) + A<Int64>.foo2(1, 2)
}
