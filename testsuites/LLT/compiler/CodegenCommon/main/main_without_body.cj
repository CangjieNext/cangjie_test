// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main(): Int64

/* SCAN
error: body of main function is missing
  ==> main_without_body.cj:10:14:
   | 
10 | main(): Int64
   |              ^ missing main function body here
   | 

1 error generated, 1 error printed.
*/
