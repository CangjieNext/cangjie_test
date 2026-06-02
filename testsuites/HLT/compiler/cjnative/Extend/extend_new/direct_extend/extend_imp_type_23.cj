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
type bo = Bool

extend bo {
    public static func a(): bo {
        true
    }
}

enum enumA {
    | A

    public func a(a!: bo = bo.a()) {
        return a.toString()
    }
    public static func b(): bo {
        bo.a()
    }
}

main(): Int64 {
    if (A.a() == "true" && enumA.b()) {
        return 0
    } else {
        return 1
    }
}
