// DEPENDENCE: defineA.cj  defineB.cj
// EXEC: %compiler %cmp_opt defineA.cj %cmp_macro
// EXEC: %compiler %cmp_opt defineB.cj %cmp_macro
// ERRCHECK: %compiler %cmp_opt %f -o %output

package use

import a.*
import b.*

main() {
    @A(0)
    @A[0](0) - 1
}

/* SCAN
error: ambiguous match for macro call A
  ==> test_macro18.cj:12:5:
   | 
12 |     @A(0)
   |     ^ 
   | 

error: ambiguous match for macro call A
  ==> test_macro18.cj:13:5:
   | 
13 |     @A[0](0) - 1
   |     ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

