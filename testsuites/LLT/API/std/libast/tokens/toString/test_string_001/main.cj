/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test.cj %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.fs.*
internal import std.io.*
internal import std.ast.*

public func readfromFile(path: Path): String {
    let file: File = File(path, Read)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    code
}

main(): Int64 {
    var code = readfromFile(Path("./test.cj"));
    let ts = cangjieLex(code);
    let f = parseProgram(ts)
    let tokens = f.toTokens();
    for (eachToken in tokens) {
        if (eachToken.kind == STRING_LITERAL) {
            print("\"")
            print(eachToken.value)
            print("\"")
            print(" ")
            println(eachToken.toTokens().toString())
        }
    }
    return 0;
}

/* SCAN-IN
"\"+BE_~04X\\" "\"+BE_~04X\\"
"\\KDvP=sc\"~" "\\KDvP=sc\"~"
 */
