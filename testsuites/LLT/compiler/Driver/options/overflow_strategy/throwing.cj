// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %f %int_overflow_opt=throwing -o %output 2>&1 | compare %f

main() {
    try {
        let v: UInt8 = 255
        let v8: UInt8 = v + 1
        println(v8)
    } catch (_) {
        println(65535)
    }
    0
}

/* SCAN-IN
error: arithmetic operation '+' overflow
  ==> throwing.cj:12:25:
   | 
12 |         let v8: UInt8 = v + 1
   |                         ^^^^^ operation 'UInt8(255) + UInt8(1)' would overflow
   | 
   # note: range of UInt8 is 0 ~ 255

1 error generated, 1 error printed.
*/
