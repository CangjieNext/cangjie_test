/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: stringFile.cj
// EXEC: %compiler %cmp_opt %f -o %output
// （not Windows）RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1| compare %f
// （Windows）RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>result.txt && dos2unix result.txt && cat result.txt | compare %f

import std.fs.*
import std.io.*
import std.ast.*

main() {
    var code = readfromFile(Path("./stringFile.cj"));
    let ts = cangjieLex(code);
    let f = parseProgram(ts)
    let tokens = f.toTokens();
    for (eachToken in tokens) {
        if (eachToken.kind == STRING_LITERAL) {
            println(eachToken.toTokens().toString())
        }
        if (eachToken.kind == MULTILINE_RAW_STRING) {
            println(eachToken.toTokens().toString())
        }
        if (eachToken.kind == MULTILINE_STRING) {
            println(eachToken.toTokens().toString())
        }
    }
}

public func readfromFile(path: Path): String {
    let file: File = File(path, ReadWrite)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    code
}
/* SCAN
"\\"
"\\KDvP=sc\"~"
"123456789\n"
"abcdefghi'"
"}"
"\t"
###"asdfaf"#"###
##"
Hello,
Cangjie
Lang#"##
"""
Hello,
Cangjie\\"""
###"#asdfaf"#"###
 */
