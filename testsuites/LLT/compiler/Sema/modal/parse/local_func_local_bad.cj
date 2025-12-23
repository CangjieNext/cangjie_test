// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %f %cmp_opt 2>&1 | compare %f

func foo() {
    func @~local bar() {
    }
}
main() {}

/* SCAN
error: local function 'bar' cannot have @~local type
  ==> local_func_local_bad.cj:10:18:
   | 
10 |     func @~local bar() {
   |                  ^^^ 
   | 

1 error generated, 1 error printed.
*/
