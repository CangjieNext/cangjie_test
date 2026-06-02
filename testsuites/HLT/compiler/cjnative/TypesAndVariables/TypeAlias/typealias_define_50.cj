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

class ClassData {
    public static let a: Int32 = -2
    private var i: Int32 = 333

    public static func get_a(): Int32 {
        return a
    }

    public func set(j: Int32) {
        i = j
    }

    public func get(): Int32 {
        return i
    }
}

type CD<T> = ClassData

main(): Int64 {
    var cd1: CD<Int32> = ClassData()
    var res1: Int32 = cd1.get()
    cd1.set(-333)
    var res2: Int32 = cd1.get()
    var res3: Int32 = CD<Int32>.get_a()
    if (res1 == 333 && res2 == -333 && res3 == -2) {
        return 0
    }
    return 1
}
