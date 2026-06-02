// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

package test

func getLine(a!: Int64 = @sourceLine()) {
    return a
}

main() {
    var a = getLine()
    return a - 6
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

