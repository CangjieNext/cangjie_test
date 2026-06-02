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

class A<T> {
    public operator func ()(input: T) {}
}

interface B<T> {
    operator func ()(input: T) {}
}

class C<T> <: B<T> {}

struct D<T> {
    public operator func ()(input: T) {}
}

func test<T>(input: T) {
    var a: A<T> = A<T>()
    var b: B<T> = C<T>()
    var c: D<T> = D<T>()
    a(input)
    b(input)
    c(input)
}

main() {
    var a: A<Int64> = A<Int64>()
    var b: B<Int64> = C<Int64>()
    var c: D<Int64> = D<Int64>()
    a(1)
    b(1)
    c(1)
    return 0
}
