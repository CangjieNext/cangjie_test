// ERRCHECK: %compiler %cmp_opt -Woff all %n.cj 2>&1 | compare %f

func foo(cond: Bool) {
    var a : VArray<Int64, $5>
    if (cond) {
        a = [1,2,3,4,5]
    }
    a
}

main() {
    0
}

/* SCAN
error: variable 'a' is used before initialization
 ==> varray_if.cj:8:5:
  | 
8 |     a
  |     ^ 
  | 
  # note: we detected variable 'a' is assigned in line 6, but in runtime, these codes might not be executed.

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
