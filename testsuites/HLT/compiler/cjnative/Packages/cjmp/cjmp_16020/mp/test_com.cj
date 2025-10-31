/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public common func foo<T>(a: T, b: T) { a }
public common class C<T, K> {
    public common func f1<T, K>() {}
}
public common interface I<T, K> {}
public common struct S<T, K> {}
public common enum E<T, K> { | E1 }
common extend <T, K> C<T, K> {
    public common func f2<T, K>() {}
}
public func f1() {
    foo<Int64>(1, 2)
}
