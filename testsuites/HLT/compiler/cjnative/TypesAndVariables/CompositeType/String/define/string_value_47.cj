/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hog

var str = "Hello Char Lang"
var i1: Int64 = 0
var i2: Int64 = 4
var s1: Rune = Rune(UInt32(str[i1]))
var s2: Rune = Rune(UInt32(str[i2]))
var s3: Rune = Rune(UInt32(str[14]))

func run(): Int64 {
    print("StringTest: " + s1.toString() + s2.toString() + s3.toString())
    return 0
}

main(): Int64 {
    return run()
}
