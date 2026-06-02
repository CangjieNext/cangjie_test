// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan The nested func in the line:14 and the column:5 was closure converted
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f0() {
    func f1() {
        0
    }
    f1()
}

main() {
    f0()
}

