// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not  unreachable pattern

interface I {
    func test(): Bool {
        match (this) {
            case v: ?Int64 => false
            case v: Int64 => true
            case _ => false
        }
    }
}

extend Int64 <: I {}

extend<T> Option<T> <: I {}

main() {
    let a: ?Int64 = 1
    if (a.test()) {
        return 1
    }
    return 0
}