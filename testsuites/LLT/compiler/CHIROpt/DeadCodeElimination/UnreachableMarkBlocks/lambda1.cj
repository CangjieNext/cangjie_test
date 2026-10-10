// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ClearBlocksMarkAsUnreachable.chirtxt" "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Local lambda match should not leave unreachable-marked blocks in foo.
// ASSERT: scan srcCodeIdentifier: foo
// ASSERT: scan-not [unreachable]

func foo(): Int64 {
    var a = 999
    func goo() {
        match (a) {
            case 10 => true
            case _ => false
        }
    }
    goo()
    1
}

main() {
    foo()
    return 0
}
