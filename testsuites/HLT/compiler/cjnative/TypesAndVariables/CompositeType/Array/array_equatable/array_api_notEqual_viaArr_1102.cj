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
    let arrViaString: Array<String> = ["cang", "jie", "test"]
    let arrViaArrF: Array<Array<String>> = Array<Array<String>>(3, repeat: arrViaString)
    let arrViaArrS: Array<Array<String>> = Array<Array<String>>(2, repeat: arrViaString)
    if (!(arrViaArrF != arrViaArrS)) {
        return 1
    }
    return 0
}
