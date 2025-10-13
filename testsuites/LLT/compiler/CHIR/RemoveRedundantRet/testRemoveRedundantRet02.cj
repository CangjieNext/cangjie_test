// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The func node in the line:9 and the column:1 was optimized by The opt: Redundant Return Removal
// ASSERT: scan The func node in the line:19 and the column:1 was optimized by The opt: Redundant Return Removal
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0
func foo() {
    while (a < 10) {
        a++
        if (a < 5) {
            continue
        }
    }

}

main() {
    foo()
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
