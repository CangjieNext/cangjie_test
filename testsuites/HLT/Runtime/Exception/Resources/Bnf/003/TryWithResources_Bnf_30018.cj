/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-3: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!close!close!

class A <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print("close!")
    }
}

main() {
    try (a = A()) {
        try (b = A()) {
            return 1
        }
    } catch (_) {
        try (b = A()) {
            return 2
        }
    } finally {
        try (b = A()) {
            return 3
        }
    }
    print("success!\n")
    return 0
}
