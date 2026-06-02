// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var flag = false
    spawn {
        var a = 1
        if (a + 1 == 2) {
            flag = true
        }
    }
    return
}

/* SCAN
error: 'spawn' expressions cannot capture mutable variables; consider using 'let' or boxing
  ==> err_capture_var.cj:11:11:
   | 
11 |       spawn {
   |  ___________^
12 | |         var a = 1
   | | ...
16 | |     }
   | |_____^
   | 
note: 'flag' is mutable
  ==> err_capture_var.cj:14:13:
   | 
14 |             flag = true
   |             ^^^^ 
   | 

1 error generated, 1 error printed.
*/
