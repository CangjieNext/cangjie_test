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
    public static let width: Int32 = 10
    public static let length: Int32 = 20
    //    let width: Int32 = 10
    //    let length: Int32 = 20
    public var w: Int32
    public var l: Int32

    public Data(x: Int32, y: Int32) {
        w = x
        l = y
    }

    public operator func -(): Data {
        var left: Int32 = width - 1
        var right: Int32 = length - 1
        print("label width :" + left.toString() + "\n")
        print("label length :" + right.toString())
        Data(left, right)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data = Data(a, b)
    var d1 = -data
    var res1: Int32 = d1.w
    var res2: Int32 = d1.l
    if (res1 == 9 && res2 == 19) {
        return 0
    }
    return 1
}
