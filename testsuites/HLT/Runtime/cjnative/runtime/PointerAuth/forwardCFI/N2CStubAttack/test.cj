/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// !!!NOTE!!!: This testcase can only be run at real device, emulator is NOT support.

// LEVEL: 3
// (OHOS and not Android) DEPENDENCE: clib.c
// (OHOS and not Android) EXEC: %clang %clang_opt clib.c -o libclib.so -O0
// (OHOS and not Android) EXEC: %compiler %cmp_opt %f -o %output -l:libclib.so -L.
// (OHOS and not Android) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (OHOS and not Android) ASSERT: scan SIGILL

foreign func cfunc(cjFunc: CFunc<() -> Unit>): Unit

foreign func hook(): Unit

main() {
    unsafe {
        var cjFunc: CFunc<() -> Unit> = {
            => println("this is cjFunc")
        }
        cfunc(cjFunc)
        hook()
        cfunc(cjFunc)
    }
    println("done")
}
