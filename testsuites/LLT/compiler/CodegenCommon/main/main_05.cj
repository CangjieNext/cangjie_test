// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(args: Array<String>, b: Array<String>): Int64 {
    for (item in args) {
        print(item)
    }
    return 0
}

/* SCAN
error: 'main' cannot be defined with parameter whose type is not 'Array<String>'
 ==> main_05.cj:9:1:
  | 
9 | main(args: Array<String>, b: Array<String>): Int64 {
  | ^ 
  | 

1 error generated, 1 error printed.
*/
