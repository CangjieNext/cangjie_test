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

public enum A {
    a

    public func test<T>(x: T) {
        x
    }
}

enum B {
    b

    public func test<T>(x: T) {
        x
    }
}

main() {
    a.test<Int64>(1) + b.test<Int64>(-1)
}
