/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func run(): Int64 {
    var opt: Option<Int32> = Option<Int32>.None<Int32>
    var res: Int32 = match (opt) {
        case Some(x) => x
        case None => 0
    }
    if (res == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_invalid_type_param_of_enum_member_access
