// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: CPointer<$3>
    0
}

/* SCAN
error: expected type name after '<', found '$'
 ==> cpointer_arg_type.cj:4:21:
  | 
4 |     var a: CPointer<$3>
  |                    ~^ expected type name here
  |                    |
  |                    after '<'
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
