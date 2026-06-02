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
    public func area<T>(width: T): T {
        return width
    }
}

func run(): Int64 {
    var width: Int32 = 2
    let data: Data = Data()
    var res: Int32 = data.area<Int32>(width)
    if (res == 2) {
        return 0
    }
    return 1
}
