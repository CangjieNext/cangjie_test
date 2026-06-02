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
func MRT_NewSem() {
    count += 1
}

@C
func MCC_ThrowException() {
    count += 1
}

main() {
    unsafe {
        MRT_NewSem()
        MCC_ThrowException()
    }
    try {
        throw Exception("emmm")
    } catch (e: Exception) {
        count += 1
    }

    if (count == 3) {
        return 0
    } else {
        return 1
    }
}
