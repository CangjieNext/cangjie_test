/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE-0: unset LD_LIBRARY_PATH && %output %run_args 2>&1 | compare %f
// ASSERT: scan true23456canghjietesty

import std.console.*
import std.convert.*
import std.collection.*
import std.math.*

main() {
    Console.stdOut.write(true)
    let array: Array<UInt8> = [50, 51, 52, 53, 54]
    Console.stdOut.write(array)
    Console.stdOut.write("canghjietest")
    Console.stdOut.write("y")
    var arr1 = ["true", "false", #"true"#, #"false"#, "${true}"]
    var arr2 = ArrayList<Bool>()
    var arr3 = ArrayList<Bool>([true, false, true, false, true])
    for (i in arr1) {
        arr2.add(Bool.parse(i))
    }
    if (arr2 != arr3) {
        return 1
    }
    return 0
}
