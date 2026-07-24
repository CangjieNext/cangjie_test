// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing successors in an interface default method and property getter.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface Greeter {
    func greeting(): String {
        return "hello"
        return "unreachable greeting"
    }
}

class PropertyHolder {
    prop enabled: Bool {
        get() {
            return true
            return false
        }
    }
}

main() {
    println(PropertyHolder().enabled)
}

/* SCAN
warning: unreachable expression
  ==> nothing_interface_getter.cj:14:9:
   | 
13 |         return "hello"
   |         ~~~~~~~~~~~~~~ any code following this expression is unreachable
14 |         return "unreachable greeting"
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_interface_getter.cj:22:13:
   | 
21 |             return true
   |             ~~~~~~~~~~~ any code following this expression is unreachable
22 |             return false
   |             ^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
