// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-42: %run %output
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_d`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func myTarget(x: Int64) {
    match (x) {
        case 0 => Type
        case 1 => Parameter
        case 2 => Init
        case 3 => MemberProperty
        case 4 => MemberFunction
        case _ => MemberVariable
    }
}

const d = myTarget(2)

main() {
    match(d) {
        case Init => 42
        case _ => 0
    }
}