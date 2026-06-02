/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

open class Base {
    public static let a: Int32 = 2
}

class Data <: Base {
    public var b: Int32 = 0
    public init() {}
    public init(x: Int32) {
        this()
        b = Base.a + x
    }
}

func run(): Int64 {
    var data: Data = Data(1)
    if (Base.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
