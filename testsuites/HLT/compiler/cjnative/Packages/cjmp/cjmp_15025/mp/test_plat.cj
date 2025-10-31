/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
platform extend <T> A<T> {
    public platform func foo1<K>(a: T, b: T) { b }
    public platform static func foo2<K>(a: T, b: T) { b }
}
public func f2() {
    return A<Int64>().foo1<Bool>(1, 2) + A<Int64>.foo2<Bool>(1, 2)
}
