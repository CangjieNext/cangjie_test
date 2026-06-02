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

public interface faterInterface<T> {
    static func foo2<T>(a!: T): T {
        a
    }
}

public interface MyInterface<T> <: faterInterface<T> {
    func foo3(a: T): T {
        a
    }
}

extend Int64 <: MyInterface<IntNative> {}

main() {
    var i1: MyInterface<IntNative> = Int64(1)

    if (Int64.foo2<Bool>(a: true) && Int64(1).foo3(1) == 1 && i1.foo3(2) == 2) {
        return 0
    } else {
        return 1
    }
}
