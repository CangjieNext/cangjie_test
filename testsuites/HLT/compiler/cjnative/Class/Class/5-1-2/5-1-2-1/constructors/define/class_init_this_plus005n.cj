/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output  %run_args 2>&1 | compare %f
// ASSERT: scan 10
// ASSERT: scan 20

class Data {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public init() {
        a = 10
        b = 20
        print(a.toString() + "\n")
        print(b.toString() + "\n")
    }
    public init(data1: Int32) {
        this
    }
}

func run(): Int64 {
    var data: Data = Data(5)
    var data1: Data = Data()
    return 0
}

main(): Int64 {
    return run()
}
