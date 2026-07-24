// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// All-throw match control flow does not make a following statement diagnosed.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

func matchThrows(value: Bool) {
    match (value) {
        case true => throw Exception()
        case false => throw Exception()
    }
    println("not diagnosed")
}

main() {}
