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
    if (v) {
        1
    } else if (v || true) {
        1.0
    } else if (v || true) {
        true
    } else if (v || true) {
        "a"
    } else if (v || true) {
        Some(1)
    } else {
        Some(1.0)
    }
    return 0
}
