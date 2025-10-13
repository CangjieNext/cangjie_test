// an empty file is necessary to trigger this bug
// EXEC: %touch collection02.cj
// EXEC-PIPE-1: %compiler -lasan %incrementalCompile %cmp_opt collection02.cj %f -O2 2>&1 | compare %f
// ASSERT: scan 'main' is missing
// ASSERT: scan 1 error generated, 1 error printed

public func foo(): Int64 {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
