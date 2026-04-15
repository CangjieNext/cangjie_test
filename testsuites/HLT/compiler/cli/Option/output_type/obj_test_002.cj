// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  --output-type=obj  --compile-target=exe -o main.o --experimental
// EXEC: %ls
// (!host_win) EXEC-1: test -f default.cjo.flag
// (host_win) EXEC-1: if exist default.cjo.flag (exit 0) else (exit 1)
// EXEC: %compiler %cmp_opt main.o -lcangjie-std-core --experimental -o %output
// RUN-EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan Hello cangjie!

main() {
    println("Hello cangjie!")
}
