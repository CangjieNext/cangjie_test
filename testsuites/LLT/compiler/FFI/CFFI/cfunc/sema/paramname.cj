main() {
    let a = CPointer<Int8>()

    let b = CFunc<(Int64)->Unit>(vvv: a)
    let c = CPointer<Int8>(这个参数叫啥名都行:a)
}

// EXEC-PIPE-1: %compiler %f %cmp_opt 2>&1 | compare %f
/* SCAN
error: unknown named argument prefix 'vvv:'
 ==> paramname.cj:4:34:
  | 
4 |     let b = CFunc<(Int64)->Unit>(vvv: a)
  |                                  ^^^ 
  | 

error: unknown named argument prefix '这个参数叫啥名都行:'
 ==> paramname.cj:5:28:
  | 
5 |     let c = CPointer<Int8>(这个参数叫啥名都行:a)
  |                            ^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
