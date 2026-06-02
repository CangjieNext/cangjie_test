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
    var a: Int32 = 1
    var b: Int32 = 2
    init() {
        a = 10
        b = 20
    }

    init(data1: Int32) {
        a = 100
        this()
    }
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
