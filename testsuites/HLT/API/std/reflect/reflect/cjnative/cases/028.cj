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
// (not MAC) ASSERT: scan Type "default.E0" is not supported

import std.reflect.*

public enum E0 {
    ConstructorA | ConstructorB | ConstructorC
}

main(): Unit {
    TypeInfo.of<E0>() |> println
}
