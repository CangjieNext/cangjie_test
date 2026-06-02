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

type int = Int32

interface I {
    func a(): int {
        2
    }
}

extend int <: I {
    public func a(): int {
        2
    }
}

type tu = (int, int)

main(): Int64 {
    var a: tu = (Int32(1).a(), Int32(1).a())
    if (a[0] - 1 == 1 && a[1] == 2) {
        return 0
    } else {
        return 1
    }
    return 0
}
