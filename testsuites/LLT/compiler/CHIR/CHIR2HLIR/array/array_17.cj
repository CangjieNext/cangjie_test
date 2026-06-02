// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

main() {
    var arr1 = Array<Int16>(5, {i => 0})
    var arr2 = Array<Int16>(5, {i => Int16(i)})
    arr2.copyTo(arr1, 1, 5, 0)
    arr2.copyTo(arr1, 1, 5, 3)
    return 0
}
