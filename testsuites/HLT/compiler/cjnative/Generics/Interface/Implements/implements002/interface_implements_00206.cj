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

public interface I<T> {
    func foo(a: T): Int32 {
        return Int32(1)
    }
}

public interface J<T> {
    func foo(a: T): Int32 {
        return Int32(2)
    }
}

public open class A<T> {}

public class B<X, Y, Z> <: A<Int32> & I<Int8> & J<Int16> {
    public func foo(a: Int8): Int32 {
        return Int32(1)
    }
    public func foo(a: Int16): Int32 {
        return Int32(2)
    }
}

main() {
    var a: B<Int8, Int16, Int32> = B<Int8, Int16, Int32>()
    if (a.foo(Int8(1)) != Int32(1)) {
        return 1
    }
    if (a.foo(Int16(1)) != Int32(2)) {
        return 1
    }
    return 0
}
