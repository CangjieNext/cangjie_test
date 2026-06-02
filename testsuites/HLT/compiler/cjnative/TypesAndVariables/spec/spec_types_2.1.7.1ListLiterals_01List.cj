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
    let emptyList: Array<Int64> = [] // empty Array<Int64>
    let list0 = [1, 2, 3, 3, 2, 1] // list0 = [1, 2, 3, 3, 2, 1]
    let list1 = [1 + 3, 2 + 3, 3 + 3] // list1 = [4, 5, 6]
    for (i in list0) {
        print("${i}")
    }
    print("\n")
    for (j in list1) {
        print("${j}")
    }
    return 0
}
