main(): Unit {}

struct A
{}
struct BA<B>
{}
struct C<AB,CD>
{}
class D<A,BC>
{}
interface E<AB>
{}
extend<AB,C> D<AB,C> <: E<AB>
{}
type F<A> = BA<A>

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
