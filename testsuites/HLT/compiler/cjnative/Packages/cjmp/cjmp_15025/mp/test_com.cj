/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
common extend <T> A<T> {
    public common func foo1<K>(a: T, b: T) { a }
    public common static func foo2<K>(a: T, b: T) { a }
}
public func f1() {
    return A<Int64>().foo1<Bool>(1, 2) + A<Int64>.foo2<Bool>(1, 2)
}
