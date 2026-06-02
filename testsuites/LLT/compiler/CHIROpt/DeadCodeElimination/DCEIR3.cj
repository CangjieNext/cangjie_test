// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %overflowOpt -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC-1: %run %run_opt %output %run_args

var gv1 = -2

main() {
    var x: Int32 = 1
    x >> gv1
    0
}

// ASSERT: regex-not [DCE] The RShift expression at [14,.*] has been deleted
