/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
specific extend <T> A<B<Int64>, T> {
    public specific func foo1(a: B<Int64>) { a.a + 1 }
    public specific static func foo2(a: B<Int64>) { a.a + 1 }
}
public func f2() {
    return A<B<Int64>, Int64>().foo1(B<Int64>(1)) + A<B<Int64>, Int64>.foo2(B<Int64>(1))
}
