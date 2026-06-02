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

class Data {
    public var a: Int32 = 1
    public static var b: Int32 = 2
    public static func coo(x: Data): Data {
        return x
    }
    public init() {}
    public init(x: Int32) {
        this()
        a = x
    }
}

func run(): Int64 {
    var data: Data = Data(5)
    var res1: Data = Data.coo(data);
    if (data.a != 5 || res1.a != 5) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
