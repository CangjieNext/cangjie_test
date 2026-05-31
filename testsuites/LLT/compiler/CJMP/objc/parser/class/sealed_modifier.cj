// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjC
sealed abstract foreign class M {
    init()
}

@ObjC
sealed abstract class Impl {
    init() {}
}

/* SCAN-IN
error: @ObjC foreign type cannot be sealed
  ==> sealed_modifier.cj:10:25:
   | 
10 | sealed abstract foreign class M {
   |                         ^ 
   | 

error: @ObjC class cannot be abstract
  ==> sealed_modifier.cj:15:17:
   | 
15 | sealed abstract class Impl {
   |                 ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

