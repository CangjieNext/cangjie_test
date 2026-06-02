/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

let p1 = 2

main() {
    let f1: CFunc<(CPointer<Int16>) -> Unit> = {
        ptr => p1
    }

    var p: CPointer<Int16> = CPointer<Int16>()
    unsafe { f1(p) }

    return 0
}
