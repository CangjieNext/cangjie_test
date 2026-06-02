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

class Data<T> {
    public let str: T

    public init(x: T) {
        str = x
    }
}

func run(): Int64 {
    var str: String = "hello Rune lang"
    let data: Data<String> = Data<String>(str)
    var res = data.str
    if (res == str) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
