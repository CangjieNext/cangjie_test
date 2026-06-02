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

main(): Int64 {
    return run()
}

struct Data {
    public var a: Int32 = 1
    public let b: Int32 = a
    public let c: Int32 = 2
    public var d: Int32 = c
    public init(x: Int32, y: Int32, z: Int32, w: Int32) {
    }
}

func run(): Int64 {
    var i1: Int32 = 5
    var i2: Int32 = 6
    var i3: Int32 = 6
    var i4: Int32 = 6
    let data: Data = Data(i1, i2, i3, i4)
    var a: Int32 = data.a
    var b: Int32 = data.b
    var c: Int32 = data.c
    var d: Int32 = data.d
    if (a == b && c == d && a == 1 && c == 2) {
        return 0
    }
    return 1
}
