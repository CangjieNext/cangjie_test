/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

open class Base {
    var a: Int32
    init() {
        a = 10
    }
}

class Data <: Base {
    var b: Int32 = 20
    init() {
        b = 3
    }

    init(data1: Int32) {
        super()
        this()
    }
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
