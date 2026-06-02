// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-1: %run %output

func test(): Bool {
    return false || return true
}

main(): Int64 {
    if (test()) {
        return 1
    } else {
        return 0
    }
}
