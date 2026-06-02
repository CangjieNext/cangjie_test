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

type bo = Bool

enum enumA {
    | A

    public func a(a: bo) {
        return a.toString()
    }
    public static func b(): bo {
        true
    }
}

main(): Int64 {
    if (A.a(false) == "false" && enumA.b()) {
        return 0
    } else {
        return 1
    }
}
