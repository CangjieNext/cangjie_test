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
    public Data(let a!: Bool = x, var x!: Bool = a) {
    }
}

func run(): Int32 {
    var data: Data = Data()

    if (data.a && data.x) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan sema_capture_has_shadow_variable
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super
