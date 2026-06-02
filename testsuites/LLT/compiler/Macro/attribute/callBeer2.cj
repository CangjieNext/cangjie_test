// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroBeer.cj
// EXEC: %compiler %cmp_macro macroBeer.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan expected no modifier before macro call, found 'public'
// ASSERT: scan unexpected struct declaration in class body

internal import pkg4.*

class Foo {
  public @Beer[var a = 1]
  struct A{} 
}

main() : Int64 {
  0
}
