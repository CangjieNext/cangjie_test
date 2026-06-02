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
class LA {
    public var a: Bool
    public init(a: Bool) {
        this.a = a
    }
}

main(): Int64 {
    var l_a = LA(false)
    var r_a = true
    var r_b = true
    l_a.a = r_a || r_b
    if (l_a.a == true) {
        return 0
    }
    return 1
}
