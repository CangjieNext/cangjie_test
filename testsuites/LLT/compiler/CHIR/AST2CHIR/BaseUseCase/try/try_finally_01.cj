// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan An exception has occurred:

main() {
    try {
        println("try begin")
        throw Exception()
        println("try end")
    } finally {
        println("fi")
    }
}

/* SCAN-IN
try begin
fi
 */
