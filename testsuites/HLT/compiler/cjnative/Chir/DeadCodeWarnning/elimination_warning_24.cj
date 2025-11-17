/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
var a = 1

public func test() {
    if (a == 1) {
        return 1
        return 2
    } else if (a == 2) {
        return 3
        return 4
    } else if (a == 3) {
        return 5
        return 6
    } else if (a == 4) {
        return 7
        return 8
    }

    return 9
    return 10
}

main() {
}
// ASSERT: scan chir2_dce_unreachable_expression
