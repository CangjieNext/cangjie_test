// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  --output-type=exe  -o %output
// EXEC: %ls
// (!host_win) EXEC: test -f default.cjo.flag
// (host_win) EXEC: if exist default.cjo.flag (exit 0) else (exit 1)
// (!host_win) EXEC: test -f default.cjo
// (host_win) EXEC: if exist default.cjo (exit 0) else (exit 1)
// RUN-EXEC: %run %output  | compare %f
// ASSERT: scan Hello cangjie!

main() {
    println("Hello cangjie!")
}
