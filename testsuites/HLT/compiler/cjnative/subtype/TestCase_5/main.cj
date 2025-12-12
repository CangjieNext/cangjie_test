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

// 使用MyOption而不是Option
public enum MyOption<T> {
    | Some(T)
    | None

    public func getOrThrow(): T {
        match (this) {
            case Some(t) => t
            case None => throw Exception()
        }
    }
}

public interface IA<T> {
    // 静态成员函数
    static func foo(a: T, b: String, c: MyOption<String>): MyOption<T>
    static func foo(a: T, b: String): MyOption<T> {
        println("ccc")
        foo(a, b, MyOption<String>.None)
    }
}

// interface-enum static
public enum CA<T> <: IA<CA<T>> {
    | A
    public static func foo(a: CA<T>, b: String, _: MyOption<String>): MyOption<CA<T>> {
        return MyOption<CA<T>>.Some(a)
    }
}

main(): Unit {
    let c = CA<Int64>.A
    CA<Int64>.foo(c, "A").getOrThrow()
}
