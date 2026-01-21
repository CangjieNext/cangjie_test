/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// cjc --dump-ast --dump-ir --dump-all --dump-to-screen main.cj -o main, where compilation of main.cj would succeed.
// EXEC-PIPE: cjc --dump-ast --dump-ir --dump-all --dump-to-screen main.cj -o main 2>&1 | compare %f
// ASSERT: scan File: main.cj
// ASSERT: scan packageAccessLevel: public
// ASSERT: scan ; ModuleID

main(): Unit {
    println("Success")
}
