/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Father {}

class Child <: Father {}

interface J {
    func foo(a: Int16): Child
}

public class B <: J {
    func foo(a: Int16): Father {
        return Child()
    }
}

main() {
    return 0
}
// ASSERT: scan sema_return_type_incompatible
