/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Data {
    public var i: Int32 = 0
    public Data(let a!: Int32 = i) {
    }
}

func run(): Int32 {
    var data: Data = Data()
    data.i = 9
    var data2: Data = Data(a: 5)

    if (data.a == 0 && data2.a == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super
