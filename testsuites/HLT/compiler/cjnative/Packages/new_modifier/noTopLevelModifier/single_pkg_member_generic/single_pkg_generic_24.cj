/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_no_match_operator_function_call

public class BB {}

public enum Foo<T> where T <: BB {
    | Red(T) | Green | Blue

    private operator func ()(): Int64 {
        return 0
    }
}

protected var test = Foo<BB>.Green
protected var test1 = Foo<BB>.Red(BB())
public var aa = test1()
