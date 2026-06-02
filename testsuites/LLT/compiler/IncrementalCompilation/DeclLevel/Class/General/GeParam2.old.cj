main(): Unit {}

struct A
{}
struct B<A,B>
{}
struct C<A,B,C,D>
{}
class D<A,B,C>
{}
interface E<A,B>
{}
extend<A,B,C> D<A,B,C> <: E<A,B>
{}
type F<A,C> = B<A,C>

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
