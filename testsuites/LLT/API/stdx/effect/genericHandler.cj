/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan The number is 10
// ASSERT: scan The result is 100
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.*

class Get<T> <: Command<T> {}

func inject<T, R>(arg: T, fn: () -> R): R {
    try {
        fn()
    } handle (_: Get<T>) {
        resume with arg
    }
}

main() {
    let result = inject<Int64, Int64>(10) {
        println("The number is ${perform Get<Int64>()}")
        10 * perform Get<Int64>()
    }
    println("The result is ${result}")
    0
}
