/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2)EXEC: %compiler %cmp_opt %obf_const %save_temps %f -o %output
// (not O2)EXEC: %disassembler %n.opt.bc
// (not O2)found.
// (not O2)EXEC: cat %n.opt.ll | grep 0x40FE240A78194C01
// (not O2)RUN-EXEC: %run %run_opt %output %run_args

// (not O2)EXEC: %compiler %cmp_opt %no_obf_const %save_temps %f -o %output
// (not O2)EXEC: %disassembler %n.opt.bc
// found.
// (not O2)EXEC: cat %n.opt.ll | grep 0x40FE240A78194C01

// 0x40FE240A78194C01 is hex 123456.654321
// float will not obf.
main() {
    var a = 123456.654321
    var b = a + 1.0
    println(b)
    return 0
}
