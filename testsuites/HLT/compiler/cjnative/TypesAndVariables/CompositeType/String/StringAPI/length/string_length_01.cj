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
    var s1: String = "hello Char lang"
    var s2 = "hello Char lang \n\r"
    var s3 = "hello Char lang \u{5324}"
    var s4 = s1[0..5]
    var s5 = s1[0..1]
    var s6 = "    "
    var s7 = ""

    var i1: Int64 = s1.size
    var i2: Int64 = s2.size
    var i3: Int64 = s3.size
    var i4: Int64 = s4.size
    var i5: Int64 = s5.size
    var i6: Int64 = s6.size
    var i7: Int64 = s7.size
    var i8: Int64 = "hello Char lang".size

    print("s1 = " + s1 + "\n")
    print("s1.size = " + i1.toString() + "\n")
    print("s2 = " + s2 + "\n")
    print("s2.size = " + i2.toString() + "\n")
    print("s3 = " + s3 + "\n")
    print("s3.size = " + i3.toString() + "\n")
    print("s4 = " + s4 + "\n")
    print("s4.size = " + i4.toString() + "\n")
    print("s5 = " + s5 + "\n")
    print("s5.size = " + i5.toString() + "\n")
    print("s6 = [" + s6 + "]" + "\n")
    print("s6.size = " + i6.toString() + "\n")
    print("s7 = [" + s7 + "]" + "\n")
    print("s7.size = " + i7.toString() + "\n")
    print("\"hello Char lang\".size = " + i8.toString() + "\n")

    if (i1 == 15 && i2 == 18 && i3 == 19 && i4 == 5 && i5 == 1 && i6 == 4 && i7 == 0 && i8 == 15) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
