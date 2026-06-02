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

class ClassData<T> {
    public var i: T
    public init(n: T) {
        this.i = n
    }
    public func test(j: T): T {
        i = j
        return i
    }
}

type CD<T> = ClassData<T>

main(): Int64 {
    var cd1: CD<String> = ClassData<String>("")
    let v1: String = cd1.test("hello")
    var cd2: CD<UInt16> = ClassData<UInt16>(0)
    let i: UInt16 = 1
    let v2: UInt16 = cd2.test(i)
    let res: String = v1 + v2.toString()
    if (res == "hello1") {
        return 0
    }
    return 1
}
