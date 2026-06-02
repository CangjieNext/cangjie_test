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

var val = 2

open class A {
    public mut static prop b: Int64 {
        get() {
            val
        }
        set(v) {
            val = v
        }
    }
}

class C <: A {}

main(): Int64 {
    if (C.b != 2) {
        return 1
    }

    return 0
}
