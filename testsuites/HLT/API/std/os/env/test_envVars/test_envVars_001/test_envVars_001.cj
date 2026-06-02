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
import std.collection.*

main() {
    var path = Process.current.environment
    var res = path.get("TEST_ENV").getOrThrow()

    if (res == "test_env") {
        print("pass")
    }

    return 0
}
