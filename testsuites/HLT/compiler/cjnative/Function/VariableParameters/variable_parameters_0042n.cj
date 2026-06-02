/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(arr!: Array<Int64>) {
    var s = 0
    for (x in arr) {
        s += x
    }
    s
}

main() {
    var a = test(1, 2, 3)
    if (a == 1) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_wrong_number_of_arguments
