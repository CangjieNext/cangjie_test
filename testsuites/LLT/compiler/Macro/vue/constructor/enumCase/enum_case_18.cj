// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import view.*

enum Eb1{
    | Red
    | Red(Int64)
    | @AA3[Red(Int64,Int64)] func gggsss(){}
}

main() {}

/* SCAN
error: unknown enum constructor
  ==> enum_case_18.cj:10:7:
   | 
10 |     | @AA3[Red(Int64,Int64)] func gggsss(){}
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unknown enum constructor
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

