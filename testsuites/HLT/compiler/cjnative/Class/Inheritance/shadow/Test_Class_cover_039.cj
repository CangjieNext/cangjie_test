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

interface I1 {
    static func a() {
        return 1
    }
}

public interface I2 <: I1 {
    static func a() {
        return 2
    }
}

main(): Int64 {
    if (I2.a() != 2 || I1.a() != 1) {
        return 1
    }

    return 0
}
