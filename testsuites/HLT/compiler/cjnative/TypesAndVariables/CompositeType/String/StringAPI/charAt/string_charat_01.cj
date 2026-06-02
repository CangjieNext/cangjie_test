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

func run(): Int64 {
    var s1: String = "hello char lang"
    var s2 = "hello char lang \n\r"
    var s3 = "hello char lang \u{5324}"
    var s4 = s1[0..6]
    var s5 = s1[0..7]
    var s6 = "    "

    var i1: Byte = s1[14]
    var i2: Byte = s2[16]
    var i3: Byte = s3[16]
    var i4: Byte = s4[5]
    var i5: Byte = s5[6]
    var i6: Byte = s6[3]
    var i7: Byte = "hello Char lang"[14]

    print("s1 = " + s1 + "\n")
    print("s1[] = " + Rune(UInt32(i1)).toString() + "\n")
    print("s2 = " + s2 + "\n")
    print("s2[] = " + Rune(UInt32(i2)).toString() + "\n")
    print("s3 = " + s3 + "\n")
    print("s3[] = " + Rune(UInt32(i3)).toString() + "\n")
    print("s4 = " + s4 + "\n")
    print("s4[] = " + Rune(UInt32(i4)).toString() + "\n")
    print("s5 = " + s5 + "\n")
    print("s5[] = " + Rune(UInt32(i5)).toString() + "\n")
    print("s6 = [" + s6 + "]" + "\n")
    print("s6[] = " + Rune(UInt32(i6)).toString() + "\n")
    print("\"hello Char lang\"[] = " + Rune(UInt32(i7)).toString() + "\n")

    if (i1 == UInt8(UInt32(r'g')) && i2 == UInt8(UInt32(r'\n')) && i4 == UInt8(UInt32(r' ')) && i5 == UInt8(UInt32(r'c')) &&
        i6 == UInt8(UInt32(r' ')) && i7 == UInt8(UInt32(r'g'))) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
