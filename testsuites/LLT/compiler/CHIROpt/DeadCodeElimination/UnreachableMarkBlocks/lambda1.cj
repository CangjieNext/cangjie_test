// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %frontendCompiler %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_ClearBlocksMarkAsUnreachable.chir | compare %f
// (CJNATIVE and not Windows) ASSERT: scan-not [unreachable]

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
}
