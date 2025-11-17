/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow=throwing %f -o %output
// RUN-ERRCHECK: %run %run_opt %output %run_args
// ASSERT: scan OverflowException: add

var temp: Int8 = 1

func f1() {
    return temp + 99
}

func test() {
    var a: Int8 = f1()
    var b: Int8 = f1()
    a + b
}

main() {
    test()
}
