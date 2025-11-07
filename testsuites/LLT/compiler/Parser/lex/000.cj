// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt %f -o %output %diag_json 2>&1 | compare %f

main() {
    let _ = 000.a
}
func foo() {
    let _ = 000
    let _ = 0x000
}

/* SCAN
error: cannot start a(n) float literal with a '0' digit
 ==> 000.cj:9:13:
  | 
9 |     let _ = 000.a
  |             ^ unexpected digit
  | 

error: cannot start a(n) integer literal with a '0' digit
  ==> 000.cj:12:13:
   | 
12 |     let _ = 000
   |             ^ unexpected digit
   | 

2 errors generated, 2 errors printed.
*/
