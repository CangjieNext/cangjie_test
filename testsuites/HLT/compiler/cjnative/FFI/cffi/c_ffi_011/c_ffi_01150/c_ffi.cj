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

main() {
    let p1 = 2
    var pass = 0

    let f1: CFunc<(CPointer<Float64>) -> Unit> = {
        ptr =>
        let p1 = 2
        unsafe { p1 }
    }

    var p: CPointer<Float64> = CPointer<Float64>()
    unsafe { f1(p) }
}
