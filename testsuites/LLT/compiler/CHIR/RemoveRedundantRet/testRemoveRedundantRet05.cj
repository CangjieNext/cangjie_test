// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %disableCHIROpt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not optimized by The opt: Redundant Return Removal
// ASSERT: scan-not optimized by The opt: Redundant Return Removal
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo() {
    1
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
