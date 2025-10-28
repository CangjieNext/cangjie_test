/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
public class B<T> {}
interface I<T> where T <: B<Int64> {
    func foo1(a: T) { a }
}
common extend <T> A<T> <: I<B<Int64>> {
}
