// (DEBUG_OPTION) EXEC: %compiler %f -O0 -g %dumpCHIRDebug
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: lldb --batch -o 'b ham.cj:14' main | grep "ham.cj:14:13"
// (DEBUG_OPTION) EXEC: %mkdir o2
// (DEBUG_OPTION) EXEC: %cd o2 && %compiler ../%f -O2 -g %dumpCHIRDebug
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n '/Func @_CN7default6<main>Hv() : Int64/,/}/p' default_CHIR/*_ConstantPropagation.chirtxt > a.t
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n '/Func @_CN7default6<main>Hv() : Int64/,/}/p' o2/default_CHIR/*_ConstantPropagation.chirtxt > b.t
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: %diff a.t b.t
// check in O0 and O2, for-in range has the same level of const propagation

main() {
    var a = 10
    for (i in 1..10) {
        if (i < 5) {
            continue
        }
        a += i
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
