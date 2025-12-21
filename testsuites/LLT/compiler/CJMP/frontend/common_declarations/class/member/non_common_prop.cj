// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

common class Foo {
    private var a = 0
    mut prop b: Int64 {
        get() {
            print("get")
            a
        }
        set(value) {
            print("set")
            a = value
        }
    }
    init() {}
}


/* SCAN
*/
