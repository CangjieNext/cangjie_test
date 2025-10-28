/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
common extend <T1> A<T1> {
    public common func foo1(a: T1, b: T1) { a }
}
common extend <T2> A<T2> {
    public common static func foo2(a: T2, b: T2) { a }
}
public func f1() {
    return A<Int64>().foo1(1, 2) + A<Int64>.foo2(1, 2)
}
