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
    public let width: T

    public init(x: T) {
        width = x
    }
}

func run(): Int64 {
    var width: Rune = '\u{5234}'
    let data: Data<Rune> = Data<Rune>(width)
    var res = data.width
    if (res == width) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
