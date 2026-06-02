/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Aoo<T> {}

class Boo<T> <: Aoo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    var a = Boo<Int32>(1)
    if (a.a != 1) {
        return 1
    }
    return 0
}
