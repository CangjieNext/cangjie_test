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

struct R {
    var a = 0
    var b = 2
    public init() {}
}

class C {
    public var a = 0
    var b = 2
}

main(): Int64 {
    var a = R()
    var b = a
    a.a = 3

    var ac = C()
    var bc = ac
    ac.a = 3
    if (b.a == 0 && bc.a == 3) {
        return 0
    }
    return 2
}
