// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A {
    public open prop v: Int64 {
        get() {
            return 1
        }
    }
}

class B <: A {
    public override prop v: Int64 {
        get() {
            return super.v + 1
        }
    }
}

main(): Int64 {
    if (A().v != 1) {
        return 1
    }
    if (B().v != 2) {
        return 2
    }
    return 0
}
