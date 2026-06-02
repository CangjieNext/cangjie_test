/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var v: Bool = Some(true) ?? false
    for (i in 0..5) {
        if (v) {
            Some(1)
        } else {
            Some(1.0)
        }
    }
    while (true) {
        if (v) {
            Some(1)
        } else {
            Some(1.0)
        }
        break
    }
    do {
        if (v) {
            Some(1)
        } else {
            Some(1.0)
        }
        break
    } while (true)
    return 0
}
