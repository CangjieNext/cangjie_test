/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -32768-32768
// ASSERT: scan 3276732767
// ASSERT: scan -2147483648-2147483648
// ASSERT: scan 21474836472147483647
// ASSERT: scan -9223372036854775808-9223372036854775808
// ASSERT: scan 92233720368547758079223372036854775807

internal import std.console.*
internal import std.math.*

main() {
    var a: Int16 = Int16.Min
    Console.stdOut.write(a)
    Console.stdOut.writeln(a)
    var a2: Int16 = Int16.Max
    Console.stdOut.write(a2)
    Console.stdOut.writeln(a2)

    var a3: Int32 = Int32.Min
    Console.stdOut.write(a3)
    Console.stdOut.writeln(a3)
    var a4: Int32 = Int32.Max
    Console.stdOut.write(a4)
    Console.stdOut.writeln(a4)

    var a5: Int64 = Int64.Min
    Console.stdOut.write(a5)
    Console.stdOut.writeln(a5)
    var a6: Int64 = Int64.Max
    Console.stdOut.write(a6)
    Console.stdOut.writeln(a6)
    return 0
}
