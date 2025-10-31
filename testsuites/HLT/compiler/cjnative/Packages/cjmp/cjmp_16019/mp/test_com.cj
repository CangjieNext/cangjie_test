/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public common func foo<T>() {}
public common class C<T> {
    public common func f1<T>() {}
}
public common interface I<T> {}
public common struct S<T> {}
public common enum E<T> { | E1 }
common extend <T> C<T> {
    public common func f2<T>() {}
}
