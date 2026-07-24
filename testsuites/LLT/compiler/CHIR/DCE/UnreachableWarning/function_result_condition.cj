// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A value returned by a regular function is not propagated into DCE analysis.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

func makeValue(): Int64 {
    1
}

main() {
    var value = makeValue()
    if (value < 0) {
        println("not diagnosed")
    }
}
