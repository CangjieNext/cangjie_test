/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt   %f   -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan "\\n"

import stdx.serialization.serialization.*
import std.io.*
import stdx.encoding.json.*

main() {
    let s = "\n".serialize().toJson().toString()
    print(s)
    0
}
