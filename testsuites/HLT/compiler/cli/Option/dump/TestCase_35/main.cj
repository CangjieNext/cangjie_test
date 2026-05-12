/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// cjc --dump-ast --dump-chir --dump-to-screen main.cj -o main, where compilation of main.cj would succeed.
// EXEC-PIPE: cjc --dump-ast --dump-chir --dump-to-screen main.cj -o main 2>&1 | compare %f
// (!host_win) EXEC-1: test -d main_IR
// (host_win) EXEC-1: if exist main_IR (exit 0) else (exit 1)
// ASSERT: scan File: main.cj
// ASSERT: scan packageAccessLevel: public
// ASSERT: scan-not ; ModuleID

main(): Unit {
    println("Success")
}
