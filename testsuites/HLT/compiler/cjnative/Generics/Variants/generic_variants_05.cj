/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (A<String>("a").a != "a") {
        return 1
    }
    return 0
}

class A<T> {
    public var x: T
    public init(y: T) {
        x = y
    }
}

extend<T> A<T> {
    public prop a: T {
        get() {
            return x
        }
    }
}
