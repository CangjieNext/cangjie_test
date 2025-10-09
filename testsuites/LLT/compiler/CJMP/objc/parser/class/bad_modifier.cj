// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror
sealed abstract class M {
}

@ObjCImpl
sealed abstract class Impl {
}

/* SCAN-IN
error: @ObjCMirror declaration cannot be sealed
 ==> bad_modifier.cj:4:17:
  | 
4 | sealed abstract class M {
  |                 ^ 
  | 

error: @ObjCImpl declaration cannot be abstract
 ==> bad_modifier.cj:8:17:
  | 
8 | sealed abstract class Impl {
  |                 ^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

