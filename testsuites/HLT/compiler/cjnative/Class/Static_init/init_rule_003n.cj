/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

class cls {
    static var a = [0, 1, 2]
    static init() {
        var b = a[6]
    }
}

main(): Int64 {
    return 0
}
