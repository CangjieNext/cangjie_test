/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo(1) != 5) {
        return 1
    }
    if (C().foo(1) != 1) {
        return 1
    }
    if (R().foo(1) != 2) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo(Int32)
}

class C {
    public func foo(x: Int32) {
        return x
    }
}

struct R {
    public func foo(x: Int32) {
        return x + 1
    }
}

interface I {
    func foo(x: Int32) {
        return x + 2
    }
}

func foo(x: Int32) {
    func foo(x: Int32) {
        return x + 3
    }
    return foo(x) + 1
}
