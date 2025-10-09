/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_A

class A <: Exception & Resource {
    public func isClosed() {
        false
    }
    public func close() {
        throw B()
    } // will be auto invoked.
    public override prop message: String {
        get() {
            return "message_A\n"
        }
    }
    public override func toString(): String {
        return "exception_A\n"
    }
}

class B <: Exception {
    public override prop message: String {
        get() {
            return "message_B\n"
        }
    }
    public override func toString(): String {
        return "exception_B\n"
    }
}

main() {
    try (a: A = A()) {
        throw a
    } finally {}
    return 0
}
