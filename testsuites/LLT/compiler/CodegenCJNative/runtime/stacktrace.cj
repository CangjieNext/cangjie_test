// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception
// (not O2) ASSERT: scan stacktrace.cj:15
class A <: Exception {}

class B {
    public init(input!: Int64 = try {
            throw A()
        }
            //catch (_) {}
            finally {}) {
    }
}

main() {
    B()
    return 0
}
