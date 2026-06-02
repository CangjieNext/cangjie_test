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
// ASSERT: scan success!

var x = 0

class A <: Resource {
    public func isClosed():Bool {
        x++;
        true
    }
    public func close():Unit{}
}

class B <: Exception {}

main() {
    try {
        try (a: A = A()) {
            throw B()
        }
    } catch (_) {
        try (a: A = A()) {}
    } finally {
        try (a: A = A()) {}
    }
    print("success!\n")
    return x - 3
}
