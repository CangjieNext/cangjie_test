/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan sema_deprecation_override_warning

open class A {
    @Deprecated
    public open prop a: Int64 {
        get() {
            0
        }
    }
}

class C <: A {
    public override prop a: Int64 {
        get() {
            1
        }
    }
}

main() {}
