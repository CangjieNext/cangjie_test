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

// 位操作符应用于类成员变量/成员函数返回值
open class Base {
    public var base_a: Int32 = 10
}

class Data <: Base {
    public var b: Int32 = 10
    public var a: Int32
    public init() {
        this.a = !this.b + !!!!super.base_a
    }
    public func foo() {
        return this.b
    }
}

main(): Int64 {
    var data = Data()
    var res1 = data.a
    var res2 = !Data().b >> 2
    var res3 = !Data().foo() >> 2
    if (res1 == -1 && res2 == res3) {
        return 0
    }
    return 1
}
