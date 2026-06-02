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
    let arrViaFloat16F: Array<Float16> = [16.1, 6.5, 2.3, 9.6]
    let arrViaFloat16S: Array<Float16> = Array<Float16>()
    let arrViaFloat16T: Array<Float16> = Array<Float16>()
    if (arrViaFloat16F == arrViaFloat16S) {
        return 1
    }
    if (!(arrViaFloat16S == arrViaFloat16T)) {
        return 2
    }
    return 0
}
