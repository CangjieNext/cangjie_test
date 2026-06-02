/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output a b c 1 2 3 test TEST %run_args | compare %f
// ASSERT: scan a b c 1 2 3 test TEST

import std.process.*

main() {
    var result = Process.current.arguments
    for (myresult in result) {
        print(myresult + " ")
    }

    return 0
}
