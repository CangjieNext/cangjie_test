// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o main.exe
// RUN-EXEC-PIPE: %run %run_opt main.exe 2>&1 | compare %f 
// ASSERT: scan Hello cangjie!

main() {
    println("Hello cangjie!")
}
