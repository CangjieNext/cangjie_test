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
    static func foo1(): Int64
    static func foo2<K>(a!: (Int64, Int64)): (Int64, Int64) {
        a
    }
}

public interface MyInterface <: fatherInterface<(Int64, Int64)> {
    static func foo3(): Int64 {
        foo1()
    }
    static func foo4(): Int64 {
        foo2<Float64>(a: (foo3(), 2))[1]
    }
}

extend<T> Range<T> <: MyInterface {
    static func f(): Int64 {
        1
    }
    public static func foo1() {
        f()
    }
}

main() {
    if (Range<Int64>.foo4() == 2 && Range<Int64>.foo1() == 1 && Range<Int64>.foo2<Rune>(a: (1, 2))[0] == 1 &&
        Range<Int64>.foo3() == 1) {
        return 0
    } else {
        return 1
    }
}
