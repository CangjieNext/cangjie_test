/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data {
    let count: T

    init(x: T) {
        count = x
    }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data = Data(i)
    var res: Int64 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_no_match_constructor
