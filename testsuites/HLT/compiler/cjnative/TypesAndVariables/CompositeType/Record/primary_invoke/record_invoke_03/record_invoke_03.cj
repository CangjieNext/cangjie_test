/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: record_invoke_03_a.cj
// EXEC: %compiler %cmp_opt %f record_invoke_03_a.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package record_invoke_03

let data: Data = Data(2, 3)

func run(): Int64 {
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 2 && length == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
