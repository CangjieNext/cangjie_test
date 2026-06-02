// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//brief:测试String的api：func toAsciiTitle() : String。覆盖不同分隔符（非26个英文字符的大小写就是分隔符）
main(): Int64 {
    var r1 = "abc,abc!abc1abc abc$abc中abc".toAsciiTitle()
    print("${r1}")
    if (r1 != "Abc,Abc!Abc1Abc Abc$Abc中Abc") {
        return 6
    }
    return 0
}
