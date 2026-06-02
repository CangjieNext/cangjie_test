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
    let arrViaChar1: Array<Rune> = [r' ', r'H', r'*']
    let arrViaChar2: Array<Rune> = [r' ', Rune(UInt32("gfHX"[2])), r'*', r'l']
    if (arrViaChar1 == arrViaChar2) {
        return 1
    }
    return 0
}
