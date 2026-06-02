// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_x` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f(): Unit {
    const x = { =>
        match (0) {
            case _ where return -1 => 0
            case _ => 1
        }
    }()
}

main() {}