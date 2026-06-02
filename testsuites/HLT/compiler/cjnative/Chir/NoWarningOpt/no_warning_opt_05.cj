/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not warning

let x = 4

func f() {
    print("${x}")
    func f1() {
        print("${x}")
    }
    let f2 = {
        => print("${x}")
    }
    let x = 99
    f1()
    f2()
}

main() {
    f()
}
