// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_BoxRecursionEnum.chir | compare %f

enum E {
    A | B(S)
}

struct S {
    let x: E
    init(a: E) {
        x = a
    }
}

main() {}

// ASSERT: regex-begin enum @_CN7default1EE {.*
// ASSERT: regex-next A
// ASSERT: regex-next B\(Box<Struct-_CN7default1SE>&\)
