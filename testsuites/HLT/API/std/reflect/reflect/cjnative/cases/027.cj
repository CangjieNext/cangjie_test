/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan Type "Tuple<Int64, Bool>" is not supported

import std.reflect.*

main(): Unit {
    TypeInfo.of<(Int64, Bool)>() |> println
}
