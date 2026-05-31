// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@Java
foreign class M {
    public prop x: Int64
}

/* SCAN-IN
error: @Java foreign type cannot declare a property, Java fields are declared as var or let variables
 ==> java_mirror_prop_forbidden.cj:5:5:
  | 
5 |     public prop x: Int64
  |     ^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

