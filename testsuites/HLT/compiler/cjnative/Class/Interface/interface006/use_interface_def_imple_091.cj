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

public interface fatherInterface<T> {
    static func b1(): Int64
    static func b2(): Int64 {
        b1()
    }
}

public interface MyInterface<T> <: fatherInterface<T> {
    static func b3(): Int64 {
        b2()
    }
}

extend Float32 <: MyInterface<Float64> {
    static func f() {
        10
    }
    public static func b1(): Int64 {
        f()
    }
}

main() {
    if (Float32.b2() == 10 && Float32.b3() == 10) {
        return 0
    } else {
        return 1
    }
}
