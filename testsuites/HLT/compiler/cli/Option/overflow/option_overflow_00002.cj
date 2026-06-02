/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow=saturating %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func test() {
    var a: Int8 = 100
    var b: Int8 = 100
    a + b
}

main() {
    test() - 127
}
