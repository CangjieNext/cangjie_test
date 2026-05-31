// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@Java
sealed abstract foreign class M {
    init()
}

@Java
sealed abstract class Impl {
    init() {}
}

/* SCAN-IN
error: @Java foreign type cannot be sealed
 ==> sealed_modifier.cj:5:25:
  | 
5 | sealed abstract foreign class M {
  |                         ^ 
  | 

error: @Java class cannot be abstract
  ==> sealed_modifier.cj:10:17:
   | 
10 | sealed abstract class Impl {
   |                 ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

