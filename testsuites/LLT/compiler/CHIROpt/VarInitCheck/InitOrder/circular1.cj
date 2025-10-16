// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f -o %output 2>&1 | compare %f


class a<T> {
    static mut prop v : String {
        get() { c }
        set(_) {  }
    } 
    static var c = v
}

main() {
    a<Int64>()
    0
}

/* SCAN
error: global/static variable 'c' is used before initialization during initializing 'c'
 ==> circular1.cj:7:17:
  | 
7 |         get() { c }
  |                 ^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
