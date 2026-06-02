// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main(): Int64 {
    return 0
}

/* SCAN
error: 'main' declaration doesn't need 'func' keyword
  ==> main_with_func.cj:10:6:
   | 
10 | func main(): Int64 {
   | ~~~~ ^^^^ 
   | |
   | help: try to remove 'func' keyword
   | 

1 error generated, 1 error printed.
*/
