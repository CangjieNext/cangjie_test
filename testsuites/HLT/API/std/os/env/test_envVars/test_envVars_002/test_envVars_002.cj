/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not iOS) RUN-EXEC-PIPE: %export TEST_ENVA=test_enva && %export TEST_ENVB=test_envb && %export TEST_ENVC="$TEST_ENVA:$TEST_ENVB" && %run %run_opt %output %run_args | compare %f
// (not Windows and not iOS) ASSERT: scan pass

import std.process.*
import std.collection.*

main() {
    var path = Process.current.environment
    var res = path.get("TEST_ENVC").getOrThrow()

    if (res == "test_enva:test_envb") {
        print("pass")
    }

    return 0
}
