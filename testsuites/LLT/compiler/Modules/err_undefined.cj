// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

internal import std.math.*

main() {
    let math = ""
    math.size
    std.f
}

/* SCAN
error: undeclared identifier 'std'
  ==> err_undefined.cj:14:5:
   | 
14 |     std.f
   |     ^ 
   | 

1 error generated, 1 error printed.
*/
