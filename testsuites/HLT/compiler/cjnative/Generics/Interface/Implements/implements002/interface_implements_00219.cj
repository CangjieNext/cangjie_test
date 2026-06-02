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

public open class Father {}

public class Child <: Father {}

public interface I<T> {
    func foo(a: T): Father {
        return Father()
    }
}

public interface J<T> {
    func foo(a: T): Child {
        return Child()
    }
}

public open class A<T> {}

public class B<X, Y, Z> <: A<Int32> & I<Int8> & J<Int16> {
    public func foo(a: Int8): Child {
        return Child()
    }
}

main() {
    var a: B<Int8, Int16, Int32> = B<Int8, Int16, Int32>()
    return 0
}
