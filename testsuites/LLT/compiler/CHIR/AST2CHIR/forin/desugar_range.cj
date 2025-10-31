// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f %dumpCHIRDebug
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n -E '/Func @_CN7default12WordsManager3fooHCNac9ArrayListIRNat6StringEE\(/,/Func .*\(/p' default_CHIR/0_AST_CHIR.chir | compare %f

import std.collection.*

class WordsManager {
    func foo(lines: ArrayList<String>) {
        for (line in lines.size + 1..=lines.size - 1) {
        }
    }
}

main() {
}

// ASSERT: scan ForInClosedRange
