// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan 5
 
class CA {
    static mut prop a : Int64 {
        get() { println(b); b }
        set(d)  { }
    }
    static var b: Int64
    static init() {
        b = 5
        b = a
    }
}
 
main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
