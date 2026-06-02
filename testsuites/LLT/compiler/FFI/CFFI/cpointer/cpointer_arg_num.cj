// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

foreign func foo(a: CPointer<Int32, Int32>): Unit

main(): Int64 {
    0
}

/* SCAN
error: type argument's number does not match type parameter's number
 ==> cpointer_arg_num.cj:3:21:
  | 
3 | foreign func foo(a: CPointer<Int32, Int32>): Unit
  |                     ^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
