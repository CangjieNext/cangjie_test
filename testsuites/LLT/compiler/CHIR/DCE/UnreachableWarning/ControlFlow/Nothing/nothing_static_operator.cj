// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify return successors in a static method and operator body.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


class PropertyHolder {
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
    println(PropertyHolder.create().id())
    println((Counter(1) + Counter(2)).value)
}

/* SCAN
warning: unreachable expression
  ==> nothing_static_operator.cj:14:16:
   | 
13 |         return PropertyHolder()
   |         ~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
14 |         return PropertyHolder()
   |                ^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_static_operator.cj:31:16:
   | 
30 |         return Counter(other.value)
   |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
31 |         return Counter(0)
   |                ^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
