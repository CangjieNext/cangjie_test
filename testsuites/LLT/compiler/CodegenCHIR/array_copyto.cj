// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

main() {
    let arr = [1, 2, 3, 4]
    arr.copyTo(arr, 1, 2, 2)
    if (arr != [1, 2, 2, 3]) {
        return 1
    }

    arr.copyTo(arr, 2, 1, 2)
    if (arr != [1, 2, 3, 3]) {
        return 1
    }

    0
}
