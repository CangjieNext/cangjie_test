/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan exception_B

class A <: Resource {
    public func isClosed():Bool {
        throw B()
    }
    public func close():Unit {
        print("A!\n")
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

class C <: Exception {
    public override prop message: String {
        get() {
            return "message_C\n"
        }
    }
    public override func toString(): String {
        return "exception_C\n"
    }
}

main() {
    while (true) {
        try (a: A = A()) {
            return 2
        }
    }
    return 3
}
