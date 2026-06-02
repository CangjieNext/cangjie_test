// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 1:5
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_cffi_opt %run_args 2>&1 | compare %f
// ASSERT: scan Hello World

foreign func testfunc(): Unit

var count = 0

main(): Int64 {
    unsafe {
        if (testfunc() == ()) {
            count += 1
        }
    }
    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
