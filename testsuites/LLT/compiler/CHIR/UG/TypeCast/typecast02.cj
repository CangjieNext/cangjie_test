// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f --int-overflow=wrapping -Woff all -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not An exception has occurred:

var xxx: Float64 = 70.0

func foo(): Int64 {
    try {
        Int32(xxx)
    } finally {
        -Float64(50.0)
    }
    xxx *= Float64(58.0)
    return 0
}

main() {
    for (i in 0..10000) {
        foo()
    }
    return 0
}
