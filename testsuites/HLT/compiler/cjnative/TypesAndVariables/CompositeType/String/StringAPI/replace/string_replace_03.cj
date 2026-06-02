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
    var oldStr: String = "!\u{0001}!\u{0002}!\u{fffe}!\u{ffff}!"
    var s1: String = oldStr.replace("\u{0001}", "\u{ffff}")
    var s2: String = oldStr.replace("\u{0002}", "\u{fffe}")
    var s3: String = oldStr.replace("\u{fffe}", "\u{0002}")
    var s4: String = oldStr.replace("\u{ffff}", "\u{0001}")

    print("oldStr = " + oldStr + "\n")
    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s3 = " + s3 + "\n")
    print("s4 = " + s4 + "\n")

    if (s1 == "!\u{ffff}!\u{0002}!\u{fffe}!\u{ffff}!" && s2 == "!\u{0001}!\u{fffe}!\u{fffe}!\u{ffff}!" && s3 ==
        "!\u{0001}!\u{0002}!\u{0002}!\u{ffff}!" && s4 == "!\u{0001}!\u{0002}!\u{fffe}!\u{0001}!") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
