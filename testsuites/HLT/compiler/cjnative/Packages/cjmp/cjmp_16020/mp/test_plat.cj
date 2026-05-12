/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public specific func foo<K>(a: K, b: K) { b }
public specific class C<K, T> {
    public specific func f1<K, T>() {}
}
public specific interface I<K, T> {}
public specific struct S<K, T> {}
public specific enum E<K, T> { | E1 }
specific extend <K, T> C<K, T> {
    public specific func f2<K, T>() {}
}
public func f2() {
    foo<Int64>(1, 2)
}
