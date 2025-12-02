/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (OHOS) ASSERT: scan positive
// (not OHOS) ASSERT: scan negative

import std.collection.*

@When[os == "Linux"]
main(): Unit {
    println("positive")
}

@When[!(os == "Linux")]
main(): Unit {
    println("negative")
}
