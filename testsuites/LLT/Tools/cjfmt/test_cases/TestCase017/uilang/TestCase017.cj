// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import test401.*

class Z<a,b,c> where
a <: test401.A<Int64,Int64> ,
b <: test401.B<Int64,Int64> ,
c <: test401.C<Int64,Int64> {}

main(): Int64 {
return 0
}