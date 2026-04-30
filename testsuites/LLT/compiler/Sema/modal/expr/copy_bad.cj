// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

@MakeCopy
struct S {
    let r = "hello"
}
main() {}

/* SCAN
error: cannot declare field 'r' of non-Copy type 'String' in Copy struct 'S'
  ==> copy_bad.cj:11:5:
   | 
11 |     let r = "hello"
   |     ^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
