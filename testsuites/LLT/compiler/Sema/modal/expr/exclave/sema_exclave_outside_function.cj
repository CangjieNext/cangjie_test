// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

let a = exclave {
    42
}

func foo(a!: Nothing = exclave { 33 }) {
    a
}

main() {}

/* SCAN
error: exclave must be used in a function
  ==> sema_exclave_outside_function.cj:13:24:
   | 
13 | func foo(a!: Nothing = exclave { 33 }) {
   |                        ^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
