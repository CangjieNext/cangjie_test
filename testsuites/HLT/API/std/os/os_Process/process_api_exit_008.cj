/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC-PIPE: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC-3: %run %run_opt %output %run_args

import std.process.*

main() {
    let fut: Future<Unit> = spawn {=> Process.current.exit(3)}
    sleep(Duration.second)
    Process.current.exit(5)
    0
}
