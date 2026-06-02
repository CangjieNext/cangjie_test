main() {
    let a = CPointer<Int8>()
    let b = CFunc<Int8>(a)
}

// EXEC-PIPE-1: %compiler %f %cmp_opt 2>&1 | compare %f
/* SCAN
error: cfunc type must be a function type
 ==> nonfunc.cj:3:19:
  | 
3 |     let b = CFunc<Int8>(a)
  |                   ^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
