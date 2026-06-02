/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcdefghij
// ASSERT: scan [96, 95, 94, 93, 92, 91, 90]

internal import std.console.*
internal import std.collection.*

main() {
    var array: Array<UInt8> = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106]
    var arrayList: ArrayList<UInt8> = ArrayList<UInt8>([96, 95, 94, 93, 92, 91, 90])
    var a = Console.stdErr
    a.writeln(array)
    a.write(arrayList)
    return 0
}
