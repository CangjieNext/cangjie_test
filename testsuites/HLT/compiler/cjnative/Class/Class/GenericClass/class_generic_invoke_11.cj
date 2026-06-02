/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex-auto LoopClassTest: width=1
// ASSERT: regex-auto LoopClassTest: length=3
// ASSERT: regex-auto LoopClassTest: width=2
// ASSERT: regex-auto LoopClassTest: length=4

class Data<T> {
    public let width: T
    public let length: T
    public init(x: T, y: T) {
        width = x
        length = y
    }
}

func run(): Int64 {
    var data: Data<Int32>
    var rows: Array<Int32> = [2, 3]
    for (index in rows) {
        data = Data<Int32>(index - 1, index + 1)
        print("LoopClassTest: width=" + data.width.toString() + "\n")
        print("LoopClassTest: length=" + data.length.toString() + "\n")
    }
    return 0
}

main(): Int64 {
    return run()
}
