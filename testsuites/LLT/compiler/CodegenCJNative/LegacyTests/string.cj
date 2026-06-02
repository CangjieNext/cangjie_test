// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_str(): Byte {
    let sss: String = "asd"
    var index: Int64 = 1
    let a: Byte = sss[index]
    let c: Int64 = sss.size
    let d: Rune = r'a'
    let f: Array<Rune> = [r'2', r'3']
    index = 0
    let e: Byte = sss[index]
    let str1 = "仓颉"
    let str2 = "语言"
    let str3 = "cangjie"
    let str4 = str1 + str2 + str3
    print(str4)
    return e
}

func codegenUnitTest(): Byte {
    return ark_str()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == UInt8(UInt32(r'a'))) {
        return 0
    } else {
        return -1
    }
}
