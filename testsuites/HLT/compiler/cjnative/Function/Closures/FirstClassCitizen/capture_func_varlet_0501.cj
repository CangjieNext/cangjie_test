/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let a: Int32 = 1

    func test(a: () -> Int32) {
        return a()
    }

    var ret = test({=> return a})

    if (ret != 1) {
        return 1
    }
    return 0
}
