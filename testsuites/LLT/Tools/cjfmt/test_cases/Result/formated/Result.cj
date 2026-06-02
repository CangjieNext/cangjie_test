// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package core

public enum Result<T> {
    Ok(T)
    | Err(Exception)

    func getOrThrow(): T {
        match (this) {
            case Ok(v) => v
            case Err(err) => throw err
        }
    }

    func getOrThrow(exception: () -> Exception): T {
        match (this) {
            case Ok(v) => v
            case Err(err) => throw exception()
        }
    }

    func getOrDefault(other: () -> T): T {
        match (this) {
            case Ok(v) => v
            case Err(err) => other()
        }
    }
}

public func ifOk<T>(r: Result<T>, action: (T) -> Unit): Unit {
    match (r) {
        case Ok(v) => action(v)
        case Err(_) => ()
    }
}

public func ifErr<T>(r: Result<T>, action: (Exception) -> Unit): Unit {
    match (r) {
        case Ok(v) => ()
        case Err(err) => action(err)
    }
}

public func resultOf<T>(expr: () -> T): Result<T> {
    try {
        Result<T>.Ok(expr())
    } catch (e: Exception) {
        Result<T>.Err(e)
    }
}
