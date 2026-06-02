/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f

func cond() {
    return true
}

func test() {
    var a = [1, 2, 3]
    var x = 1
    if (cond()) {
        x = 4
    } else {
        x = 5
    }
    let y = a[x]
}

main() {
    test()
    0
}

// ASSERT: scan An exception has occurred:
// ASSERT: scan IndexOutOfBoundsException
