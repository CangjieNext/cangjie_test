/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    let insBox: Box<Int32> = Box<Int32>(32)
    let arrViaBoxF: Array<Box<Int32>> = Array<Box<Int32>>(3, repeat: insBox)
    let arrViaBoxS: Array<Box<Int32>> = Array<Box<Int32>>(5, repeat: insBox)
    if (arrViaBoxF == arrViaBoxS) {
        return 1
    }
    return 0
}
