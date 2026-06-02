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

extend Float16 {
    func test(a: Int64) {
        return a
    }
}

extend Float16 {
    func test(a: Int64, b: Int64) {
        return a + b
    }
    func f1() {
        test(1)
    }
    func f2() {
        test(1, 2)
    }
}

extend Float32 {
    func test(a: Int64) {
        return a
    }
}

extend Float32 {
    func test(a: Int64, b: Int64) {
        return a + b
    }
    func f1() {
        test(1)
    }
    func f2() {
        test(1, 2)
    }
}

extend Float64 {
    func test(a: Int64) {
        return a
    }
}

extend Float64 {
    func test(a: Int64, b: Int64) {
        return a + b
    }
    func f1() {
        test(1)
    }
    func f2() {
        test(1, 2)
    }
}

main() {
    var a: Float16 = 1.0
    var b: Float32 = 1.0
    var c: Float64 = 1.0
    if (a.f1() != 1) {
        return 1
    }
    if (a.f2() != 3) {
        return 2
    }
    if (b.f1() != 1) {
        return 1
    }
    if (b.f2() != 3) {
        return 2
    }
    if (c.f1() != 1) {
        return 1
    }
    if (c.f2() != 3) {
        return 2
    }
    return 0
}
