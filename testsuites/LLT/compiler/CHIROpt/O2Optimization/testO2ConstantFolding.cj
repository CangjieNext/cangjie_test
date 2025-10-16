// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %chir2llvm %f --output-type=staticlib -o %output 2>&1 | compare %f
// ASSERT: scan The binary node in the line:9 and the column:12 was optimized by The opt: Constant Folding
// ASSERT: scan The binary node in the line:9 and the column:16 was optimized by The opt: Constant Folding
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
    return 3 | 8 & 5 ^ 12
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
