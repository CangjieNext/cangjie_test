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

import std.sync.*

class cls {
    static var a: Int64 = 0
    static init() {
        //a = 0
        let fut: Future<Unit> = spawn {
            a = 1
        }
        fut.get()
    }
}

main(): Int64 {
    if (cls.a == 1) {
        return 0
    }
    return 1
}
