// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    public func isClosed() {
        print("A!");
        true
    }
    public func close() {}
}

var a: Unit = try (a: A = A()) {
    0
}

main() {
    print("success!\n")
    return a
}
