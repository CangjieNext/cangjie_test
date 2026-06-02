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
    func foo1(): T
    prop b: T {
        get() {
            foo1()
        }
    }
}

public interface MyInterface<T> <: faterInterface<Int64> {
    prop b: Int64 {
        get() {
            3
        }
    }
}

public enum myEnum<T> {
    A
}

extend<T> myEnum<T> <: MyInterface<UInt16> {
    public func foo1(): Int64 {
        1
    }
}

main() {
    var enum1: faterInterface<Int64> = myEnum<faterInterface<Int64>>.A
    var enum2: MyInterface<UInt16> = myEnum<faterInterface<Int64>>.A
    var enum3: myEnum<faterInterface<Int64>> = myEnum<faterInterface<Int64>>.A

    if (enum1.b == 3 && enum2.b == 3 && enum3.b == 3) {
        return 0
    } else {
        return 1
    }
}
