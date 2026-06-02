// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %dumpCHIRDebug %f -o %n.%suffix
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: regex-not \[static\].*goo
class C {
    static const func foo1() {
        const func goo1() {
            const func goo2() {
                2
            }
            goo2()
            2
        }
        goo1()
    }
}

main() {}
