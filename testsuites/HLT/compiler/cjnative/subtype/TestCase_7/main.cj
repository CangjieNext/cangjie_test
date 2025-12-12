/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public interface IA<T> {
    func foo(a: T, b: String, c: Option<String>): Option<T>
    func foo(a: T, b: String): Option<T> {
        println("ccc")
        foo(a, b, Option<String>.None)
    }
}

public class CA<T> <: IA<CA<T>> {
    public func foo(a: CA<T>, b: String, _: Option<String>): Option<CA<T>> {
        return Option<CA<T>>.Some(a)
    }
}

main(): Unit {
    let c = CA<Int64>()
    c.foo(c, "A").getOrThrow()
}
