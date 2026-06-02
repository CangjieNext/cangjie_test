/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

class Data {
    public static var a: Int32 = 1
    private static func f(): Int32 {
        a = a + 1
        return a
    }
    public func get(): Int32 {
        return f()
    }
}

func run(): Int64 {
    var value: Data = Data()
    if (value.get() != 2) {
        return 2
    }
    if (value.get() != 3) {
        return 3
    }
    return 0
}

main(): Int64 {
    return run()
}
