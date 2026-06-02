/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// (not O2)EXEC: %compiler %cmp_opt %serial_compile %obf_const %save_temps %f -o %output
// (not O2)EXEC: %disassembler %n.opt.bc
// in func, should not found.
// (not O2)EXEC-1: cat %n.opt.ll | grep 4886718345
// (not O2)RUN-EXEC: %run %run_opt %output %run_args

// (not O2)EXEC: %compiler %cmp_opt %serial_compile %no_obf_const %save_temps %f -o %output
// (not O2)EXEC: %disassembler %n.opt.bc
// found.
// (not O2)EXEC: cat %n.opt.ll | grep 4886718345

// 4886718345 == 0x123456789
func test() {
    var a = 0
    if (a == 0x123456789) {
        return 1
    }
    return 0
}

main() {
    test()
    return 0
}
