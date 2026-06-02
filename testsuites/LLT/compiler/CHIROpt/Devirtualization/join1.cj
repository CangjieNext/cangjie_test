// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE: %compiler %debugCHIROpt %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

internal import std.ast.*

func parseAttrs(attrTokens: Tokens): Unit {
    var tokens = Tokens()
    for (tok in attrTokens) {
        tokens += tok
    }
    if (tokens.size > 0) { // tokens.size should be an Invoke
        println("44")
    } else {
        println("strange: ${tokens.size}")
    }
}

main() {
    0
}

// ASSERT: regex-not \[Devirtualization\].*\[17,9\]
