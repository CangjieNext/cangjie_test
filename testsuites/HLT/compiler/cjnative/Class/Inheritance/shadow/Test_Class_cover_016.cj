/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1 {
    public static var x1 = 1
    public static func f1() {
        return x1
    }
}

class C2 <: C1 {
    public static let x2 = 2
    public static redef func f1() {
        return x2
    }
}

main(): Int64 {
    var v1 = C1.f1()

    var v2 = C2.f1()

    if (v1 != 1 || v2 != 2) {
        return 1
    }

    return 0
}
