/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan isClosed!close!success!

class A <: Resource {
    public func isClosed():Bool {
        print("isClosed!");
        false
    } // isClosed before closed.
    public func close():Unit {
        print("close!")
    }
}

main() {
    try (`a` = A()) {}
    print("success!\n")
    return 0
}
