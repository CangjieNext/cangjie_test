// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
sealed abstract class M {
    init()
}

@JavaImpl
sealed abstract class Impl {
    init() {}
}

/* SCAN-IN
error: @JavaMirror declaration cannot be sealed
 ==> sealed_modifier.cj:5:17:
  | 
5 | sealed abstract class M {
  |                 ^ 
  | 

error: @JavaImpl declaration cannot be abstract
  ==> sealed_modifier.cj:10:17:
   | 
10 | sealed abstract class Impl {
   |                 ^ 
   | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

