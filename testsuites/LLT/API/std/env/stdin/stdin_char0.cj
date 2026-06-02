/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// (Unix) RUN-EXEC-PIPE-0: echo "abc" | %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: echo abc | %run %run_opt %output %run_args

/*
 * Test description:This test case is designed to test the hard-to-reach branches of the code.
 * Test API: public func trim(src: Array<Byte>, trimBytes: Array<Byte>): Array<Byte>
 */

internal import std.env.*

main() {
    var input: String = ""
    getStdIn().read()

    while (true) {
        var line: Option<String> = getStdIn().readln()
        match (line) {
            case Some(a) => input = input + a
            case None => break
        }
    }
    println(input)
    if (input != "bc") {
        return -1
    }
    return 0
}
