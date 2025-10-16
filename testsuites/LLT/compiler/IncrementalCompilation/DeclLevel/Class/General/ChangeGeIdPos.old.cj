main(): Unit {}
class A <T> {}
struct B <A,B> {}
enum C <A> {V|K(Int32) }
interface D <A> {}
extend<A> C<A> <:D<A> {}
extend<A,C> B<A,C> {}
type E<A> = B<A,A>


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
