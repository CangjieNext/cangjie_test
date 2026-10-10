/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Weave-only: a well-named but unknown anno class in the .annoinfo file.

// EXEC-PIPE-0: printf '%s\n' 'default' 'dummyInit' 'UnknownAnno' 'default' 'dummyAspect' '0' 'false' 'false' 'default' '' 'woven' '()->Unit' 'false' 'false' > default-default.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan Unknown annotation class name 'UnknownAnno'.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func woven(): Unit {
    println("woven")
}

main() {
    woven()
    0
}
