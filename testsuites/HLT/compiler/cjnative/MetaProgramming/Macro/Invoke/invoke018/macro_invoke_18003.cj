/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import define.*

@M
struct Rectangle {
    let name: String
    public Rectangle(name: String, var desc: String, let width: Int64, let height: Int64) {
        this.name = name
    }
}

main() {
    println("works!")
    let r = Rectangle("Bob", "nice", 10, 12)
    if (r.name != "Bob" || r.desc != "nice" || r.width != 10) {
        return 1
    }
    return r.height - 12
}
