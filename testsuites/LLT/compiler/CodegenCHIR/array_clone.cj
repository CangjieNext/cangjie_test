// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

main() {
    let array1 = Array<Int64>(6, repeat: 42)
    if (array1[0] != 42 || array1[1] != 42 || array1[2] != 42 || array1[3] != 42 || array1[4] != 42 || array1[5] != 42) {
        return 1;
    }

    let array2: Array<Int64> = array1.clone()
    if (array2[0] != 42 || array2[1] != 42 || array2[2] != 42 || array2[3] != 42 || array2[4] != 42 || array2[5] != 42) {
        return 2;
    }

    array1[0] = 0
    if (array1[0] != 0 || array1[1] != 42 || array1[2] != 42 || array1[3] != 42 || array1[4] != 42 || array1[5] != 42) {
        return 3;
    }
    if (array2[0] != 42 || array2[1] != 42 || array2[2] != 42 || array2[3] != 42 || array2[4] != 42 || array2[5] != 42) {
        return 4;
    }

    array2[1] = 3
    if (array1[0] != 0 || array1[1] != 42 || array1[2] != 42 || array1[3] != 42 || array1[4] != 42 || array1[5] != 42) {
        return 5;
    }
    if (array2[0] != 42 || array2[1] != 3 || array2[2] != 42 || array2[3] != 42 || array2[4] != 42 || array2[5] != 42) {
        return 6;
    }

    return 0
}
