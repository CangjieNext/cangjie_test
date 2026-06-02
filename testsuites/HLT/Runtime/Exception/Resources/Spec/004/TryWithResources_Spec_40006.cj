/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan C!B!A!

class A <: Resource {
    public func isClosed():Bool {
        print("A!");
        true
    }
    public func close():Unit {}
}

class B <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print("B!")
    }
}

class C <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print("C!")
    }
}

main() {
    try (a: A = A(), b: B = B(), c: C = C()) {
    } finally {
    }
    return 0
}
