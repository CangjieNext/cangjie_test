// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix -g 2>&1
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_ClosureConversion.chir | compare %f
// (not Windows and CJNATIVE and DEBUG_OPTION) ASSERT: regex-16 Unit = StoreElementRef


func h() {
    func f() {
        var x = 1
        func g() {
            x
        } // captured a mutable variable

        g()
    }
    return f // ok
}

main() {
    h()()
}
