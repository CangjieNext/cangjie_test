// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(args: List<String>): Int64 {
    for (item in args) {
        print(item)
    }
    return 0
}

/* SCAN
error: undeclared type name 'List'
 ==> main_04.cj:9:12:
  | 
9 | main(args: List<String>): Int64 {
  |            ^ 
  | 

error: 'main' cannot be defined with parameter whose type is not 'Array<String>'
 ==> main_04.cj:9:1:
  | 
9 | main(args: List<String>): Int64 {
  | ^ 
  | 

2 errors generated, 2 errors printed.
*/
