/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f
// (not iOS) RUN-EXEC-PIPE-0: echo ^***********^$ > input.txt && %run %run_opt %output %run_args < input.txt 2>&1 | compare %f
// (not Windows or OHOS)ASSERT: scan ^
// (Windows and not OHOS)ASSERT: scan ***********$
import std.console.*

func func1(c: Rune): Bool {
    return c == r'^'
}

main() {
    let c = Console.stdIn.readUntil(func1)
    println(c.getOrThrow())
    return 0
}
