// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f -o %output 2>&1 | compare %f


class CA {
    static mut prop a : Int64 {
        get() { println(b); b }
        set(d)  { }
    }
    static var b: Int64
    static init() {
        b = a
        b = 5
    }
}

main() {
    0
}

/* SCAN
error: global/static variable 'b' is used before initialization during initializing 'b'
 ==> circular5.cj:7:25:
  | 
7 |         get() { println(b); b }
  |                         ^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
