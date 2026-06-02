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
    var character: Rune = 'a'
    var u32Number: UInt32 = 0
    u32Number = UInt32(character) // uint32Number = 97
    u32Number -= 32
    character = Rune(u32Number) // character = `A`
    return 0
}
