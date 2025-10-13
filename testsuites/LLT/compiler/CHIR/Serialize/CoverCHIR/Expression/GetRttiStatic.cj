// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// (DEBUG_OPTION) EXEC: %chirDis default.chir
// (CJNATIVE and DEBUG_OPTION) EXEC: %cat *_Emit_Debug.chirtxt | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan GetRTTIStatic
// (DEBUG_OPTION) EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

open class A {}

interface I {
    static func f1() : A
    static func f2(): Unit {
        f1()
    }
}

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
