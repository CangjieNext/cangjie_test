/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I1 {
    func get(): Int32
}

class ClassA <: I1 {
    public var i: Int32 = 10
    public func get(): Int32 {
        return i
    }
}

class ClassB <: I1 {
    public var i: Int32 = 20
    public func get(): Int32 {
        return i
    }
}

class ClassC <: I1 {
    public var i: Int32 = 30
    public func get(): Int32 {
        return i
    }
}

main(): Int64 {
    var a = ClassA()
    var b = ClassB()
    let arr: Array<I1> = [a, b, ClassC()]
    if (arr[0].get() == 10 && arr[1].get() == 20 && arr[2].get() == 30) {
        return 0
    }
    return 1
}
