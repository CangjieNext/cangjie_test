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
    let arrViaStringF: Array<String> = ["cang", "jie", "test", "*#06#*"]
    let arrViaStringS: Array<String> = Array<String>()
    let arrViaStringT: Array<String> = Array<String>()
    if (arrViaStringF == arrViaStringS) {
        return 1
    }
    if (!(arrViaStringS == arrViaStringT)) {
        return 2
    }
    return 0
}
