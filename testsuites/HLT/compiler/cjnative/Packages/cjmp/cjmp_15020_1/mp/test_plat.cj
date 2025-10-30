/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
platform extend <T> A<T> where T <: B<Int64> {
    public platform func foo1() { 2 }
    public platform static func foo2() { 2 }
}
public func f2() {
    return A<B<Int64>>().foo1() + A<B<Int32>>.foo2()
}
