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

func run(): Int64 {
    var res1 = Data()
    if (res1.x == 5) {
        return 0
    }
    return 1
}

class Data {
    var x: Int32 = 1
    var y: Int32 = 2
    init(y!: Int32 = 4) {
        x = x + y
    }
}
