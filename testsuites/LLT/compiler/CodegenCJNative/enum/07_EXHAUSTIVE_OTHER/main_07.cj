// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Result<T, E> {
    Ok(T) | Err(E)
}

open class CA {}

func foo<T>(clientListFunc: (T) -> Result<T, Int64>, t: T): Result<CA, Int64> where T <: CA {
    return match (clientListFunc(t)) {
        case Ok(list) => Ok(list)
        case Err(e) => Err(e)
    }
}

func goo<M>(m: M): Result<M, Int64> {
    return Result<M, Int64>.Ok(m)
}

main() {
    foo<CA>(goo<CA>, CA())
    return 0
}
