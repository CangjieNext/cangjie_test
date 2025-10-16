// LEVEL: 0
// EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

main() {
    if (true) { 1 } else { 2 }
    if (false) { 3 } else { 4 }
    0
}

// ASSERT: scan-not core dump


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
