/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public specific func foo<T, K>() {}
public specific class C<T, K> {
    public specific func f1<T, K>() {}
}
public specific interface I<T, K> {}
public specific struct S<T, K> {}
public specific enum E<T, K> { | E1 }
specific extend <T, K> C<T, K> {
    public specific func f2<T, K>() {}
}
