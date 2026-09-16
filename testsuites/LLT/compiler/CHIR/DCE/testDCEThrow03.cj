// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

class A <: Exception & Resource {
    public func isClosed() {
        throw B()
        var a = 1
        throw B()
    }
    public func close() {
        print("A!\n")
    }
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
    } finally {}
    return 0
}
