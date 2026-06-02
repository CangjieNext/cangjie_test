// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

@C
struct Data {}

interface I0 {}

extend Data <: I0 {}

main() {}

/* SCAN
error: c type 'Data' cannot support interface extend
 ==> constraint_1.cj:8:8:
  | 
8 | extend Data <: I0 {}
  |        ^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
