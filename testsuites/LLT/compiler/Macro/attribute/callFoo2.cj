// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj %n.expect.out
// EXEC: %compiler %cmp_macro macroFoo.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f 2> %n.%realOut
// EXEC: %diff %n.expect.out %n.%realOut

internal import pkg1.*

main() : Int64 {
  var a: Int64 = @Foo[[1+))))](2+3)
}
