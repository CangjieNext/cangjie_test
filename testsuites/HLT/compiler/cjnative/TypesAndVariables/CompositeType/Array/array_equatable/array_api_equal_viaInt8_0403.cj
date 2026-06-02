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
    let arrViaInt8F: Array<Int8> = [16, -12, 91]
    let arrViaInt8S: Array<Int8> = Array<Int8>()
    let arrViaInt8T: Array<Int8> = Array<Int8>()
    if (arrViaInt8F == arrViaInt8S) {
        return 1
    }
    if (!(arrViaInt8S == arrViaInt8T)) {
        return 2
    }
    return 0
}
