// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum MyResult<T> {
    | Ok(T)
    | Err(Exception)

    public func getOrThrow(): T {
        match (this) {
            case Ok(v) => v
            case Err(err) => throw err
        }
    }
}

main() {
    let res = MyResult<Int64>.Ok(0)
    res.getOrThrow()
}
