/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1 {
    let a: Int64
    const init() {
        this.a = 0
    }
}

class C2 <: C1 {
    let b: String
    const init() {
        super()
        this.b = "a"
    }
}

main() {
    const c1 = C1()
    const c2 = C2()
    if (c1.a == 0 && c2.a == 0 && c2.b == "a") {
        return 0
    }
    return 1
}
