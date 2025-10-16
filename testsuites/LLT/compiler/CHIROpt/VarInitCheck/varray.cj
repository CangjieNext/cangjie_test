// ERRCHECK: %compiler %cmp_opt -Woff all %n.cj 2>&1 | compare %f

struct SA {}

func foo() {
    let sa: SA
    var a = VArray<SA, $5>(repeat: sa)
}

main() {
    foo()
    0
}

/* SCAN
error: variable 'sa' is used before initialization
 ==> varray.cj:7:34:
  | 
7 |     var a = VArray<SA, $5>(repeat: sa)
  |                                  ^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
