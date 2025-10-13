// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %f -o %output 2>&1 | compare %f

let g: Array<Option<Bool>> = []

func foo() {
    var a = g[4]
}
main() {}


/* SCAN
error: array index is out of bounds
 ==> globalArray01.cj:7:13:
  | 
7 |     var a = g[4]
  |             ^^^^ array index 4 is past the end of array (which contains 0 elements)
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
