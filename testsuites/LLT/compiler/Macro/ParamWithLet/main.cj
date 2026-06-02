// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: qq.cj
// EXEC:%compiler qq.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Bob,nice,12,10

import qq.*

@M
class Rectangle {
    let name: String

    public Rectangle(name: String, var desc: String, let width: Int64, let height: Int64) {
        this.name = name
    }
}

main() {
    let r = Rectangle("Bob", "nice", 10, 12)
    println("${r.name},${r.desc},${r.height},${r.width}")
    if (r.height != 12) {
        return 1
    }
    return 0
}
