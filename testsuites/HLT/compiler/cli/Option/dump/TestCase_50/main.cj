/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// cjc --dump-ast --dump-ir --dump-all main.cj -o main, where compilation of main.cj would succeed.
// EXEC: cjc --dump-ast --dump-ir --dump-all main.cj -o main
// (!host_win) EXEC: test -d main_AST
// (host_win) EXEC: if exist main_AST (exit 0) else (exit 1)
// (!host_win) EXEC: test -d main_CHIR
// (host_win) EXEC: if exist main_CHIR (exit 0) else (exit 1)
// (!host_win) EXEC: test -d main_IR
// (host_win) EXEC: if exist main_IR (exit 0) else (exit 1)

main(): Unit {
    println("Success")
}
