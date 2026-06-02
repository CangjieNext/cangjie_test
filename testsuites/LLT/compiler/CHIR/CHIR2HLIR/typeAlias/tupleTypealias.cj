// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args
package collectionx

internal import std.collection.*

public type Buf<T> = Arr<T>

public class Arr<T> {
    private var myData: Array<T>
    public init(data: Array<T>) {
        myData = data
    }
    public func iterator(): Buf<T> {
        return this
    }
}

public class Header <: Iterable<(String, Arr<String>)> {
    protected var data = HashMap<String, Arr<String>>()
    public init() {}
    public func iterator(): Iterator<(String, Buf<String>)> {
        return data.iterator()
    }
}

main(): Int64 {
    let b = Header()
    return 0
}
