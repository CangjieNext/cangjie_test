/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %compile_lib_opt %f 2>&1 | compare %f

class Data {
    private var a: Int32 = 1
}

func run(): Int64 {
    var value: Data = Data()
    if (value.a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_access_control
