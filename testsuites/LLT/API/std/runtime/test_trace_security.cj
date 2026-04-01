/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and Linux) EXEC: cjTracePath= %run %run_opt %output %run_args
// ASSERT: scan Empty path detected
// (CJNATIVE and Linux) EXEC: cjTracePath=/nonexistent_dir_12345/trace.log %run %run_opt %output %run_args
// ASSERT: scan Valid absolute path accepted

import std.env.*

main() {
    let cjTracePath = getVariable("cjTracePath") ?? ""
    
    if (cjTracePath == "") {
        println("Empty path detected")
    } else if (cjTracePath.startsWith("/")) {
        println("Valid absolute path accepted")
    } else {
        println("cjTracePath: ${cjTracePath}")
    }
}
