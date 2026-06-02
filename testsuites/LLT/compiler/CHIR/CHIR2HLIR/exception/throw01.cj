// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan exception_A

interface I {
    func foo(): Unit
}

class A <: Exception & I {
    public func foo() {}
    public override prop message: String {
        get() {
            return "message_A\n"
        }
    }
    public override func toString(): String {
        return "exception_A\n"
    }
}

main() {
    throw A()
    return 0
}
