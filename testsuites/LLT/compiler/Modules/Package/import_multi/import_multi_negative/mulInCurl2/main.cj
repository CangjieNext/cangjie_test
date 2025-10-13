// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt p.cj -o p.%middle
// ERRCHECK: %compiler %cmp_opt p.%middle %n.cj -o %n.%suffix

import pkg.{*}

main(): Int64 {
  return 0
}

/* SCAN
error: expected a name after this, found '*'
  ==> main.cj:11:13:
   | 
11 | import pkg.{*}
   |            ~^ expected a name here
   |            |
   |            after this
   | 

1 error generated, 1 error printed.
*/
