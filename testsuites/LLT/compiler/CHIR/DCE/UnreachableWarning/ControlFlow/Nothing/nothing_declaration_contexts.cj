// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing successors in declaration-body contexts.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class ThrowingHolder {
    init() {
        throw Exception()
        println("unreachable initializer")
    }
}

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

    static func create(): PropertyHolder {
        return PropertyHolder()
        return PropertyHolder()
    }

    func id(): Int64 {
        0
    }
}

struct Counter {
    let value: Int64

    init(value: Int64) {
        this.value = value
    }

    operator func +(other: Counter): Counter {
        return Counter(other.value)
        return Counter(0)
    }
}

main() {
    let action = {
        =>
        throw Exception()
        println("unreachable lambda")
    }
    action()
    println(PropertyHolder().enabled)
    println(PropertyHolder.create().id())
    println((Counter(1) + Counter(2)).value)
}

/* SCAN
warning: unreachable expression
  ==> nothing_declaration_contexts.cj:13:9:
   | 
12 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
13 |         println("unreachable initializer")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_declaration_contexts.cj:20:9:
   | 
19 |         return "hello"
   |         ~~~~~~~~~~~~~~ any code following this expression is unreachable
20 |         return "unreachable greeting"
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_declaration_contexts.cj:28:13:
   | 
27 |             return true
   |             ~~~~~~~~~~~ any code following this expression is unreachable
28 |             return false
   |             ^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_declaration_contexts.cj:34:16:
   | 
33 |         return PropertyHolder()
   |         ~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
34 |         return PropertyHolder()
   |                ^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_declaration_contexts.cj:51:16:
   | 
50 |         return Counter(other.value)
   |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
51 |         return Counter(0)
   |                ^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_declaration_contexts.cj:59:9:
   | 
58 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
59 |         println("unreachable lambda")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
