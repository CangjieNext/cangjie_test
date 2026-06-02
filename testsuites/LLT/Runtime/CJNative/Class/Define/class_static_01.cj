// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data {
    public static func f(): Int32 {
        return a
    }
    public static func get(): Int32 {
        return f()
    }
    public static var a: Int32 = 10
    public static var b: Int64 = 20
}

func run(): Int64 {
    if (Data.get() == 10 && Data.b == 20) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
