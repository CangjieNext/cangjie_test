/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_B
// ASSERT: scan-not exception_A

class X <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        throw A()
    }
}

class Y <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        throw B()
    }
}

class A <: Exception {
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
    try (a: X = X(), b: Y = Y()) // Y first.
    {
    } finally {}
    return 0
}
