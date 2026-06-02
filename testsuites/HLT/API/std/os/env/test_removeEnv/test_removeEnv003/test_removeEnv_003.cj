/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %export TEST_ENV=test_env&& %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass

import std.process.*

main() {
    var result1 = Process.current.getEnv("TEST_ENV").getOrThrow()
    if (result1 != "") {
        Process.current.removeEnv("TEST_GET_ENV")
        var result2 = Process.current.getEnv("TEST_ENV").getOrThrow()
        if (result2 == "test_env") {
            print("pass")
        }
    }
    return 0
}
