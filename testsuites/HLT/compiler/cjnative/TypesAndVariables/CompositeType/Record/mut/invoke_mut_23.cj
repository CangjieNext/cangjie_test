/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

struct R<T> {
    public R(let a: T) {
    }

    public mut func c(b: T) {
        a = b
        return a
    }
}

main() {
    var b = R<Int64>(6)
    b.c(7)
    return b.a - 7
}
// ASSERT: scan sema_cannot_assign_to_immutable
