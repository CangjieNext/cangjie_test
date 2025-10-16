// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile %f 2>&1 | compare %f

// ASSERT: scan frontend error detected, roll back to full compilation
// ASSERT: scan error: expected identifier or pattern after 'let', found '='

let = 1
main():Unit{
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
