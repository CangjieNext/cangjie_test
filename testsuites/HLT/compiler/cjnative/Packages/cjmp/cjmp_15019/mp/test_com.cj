/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
public class B {}
common extend <T> A<T> where T <: B {
    public common func foo1() { 1 }
    public common static func foo2() { 1 }
}
public func f1() {
    return A<B>().foo1() + A<B>.foo2()
}
