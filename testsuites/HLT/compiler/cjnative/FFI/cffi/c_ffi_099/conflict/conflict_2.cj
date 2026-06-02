/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test

var count = 0

@C
func has_invoke_core_global_init() {
    count += 1
}

@C
func has_invoke_test_global_init() {
    count += 1
}

main() {
    unsafe {
        has_invoke_core_global_init()
        has_invoke_test_global_init()
    }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
