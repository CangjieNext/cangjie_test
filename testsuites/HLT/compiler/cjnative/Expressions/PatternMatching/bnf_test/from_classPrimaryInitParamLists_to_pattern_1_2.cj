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

open class Boo {
    public var a: Int64 = 0
    public var b: Int64 = 0
    public func get() {
        return a + b
    }
    public Boo(y: Int64, x!: Int64 = match (1) {
            case _ => 1
        }) {
        b = y
        a = x
    }
}

main(): Int64 {
    var a = Boo(1).get()
    if (a != 2) {
        return 1
    }
    return 0
}
