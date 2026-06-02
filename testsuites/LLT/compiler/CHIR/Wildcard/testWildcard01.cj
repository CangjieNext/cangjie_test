// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE: %compiler %cmp_opt  %enableO2 %debugCHIROpt %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE: %run %run_opt %output %run_args
// ASSERT: scan-not The node in the line:8 and the column:5 was optimized by The opt: ref2letc

func test() {
    println("test")
    return 2
}

main():Int64{
    _ = test()
    return 0
}