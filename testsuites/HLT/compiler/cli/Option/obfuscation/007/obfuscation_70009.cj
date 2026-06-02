/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.sh test5.cfg
// EXEC: %compiler %cmp_opt %obf_all --obf-config=test5.cfg %save_temps %f -o %output
// EXEC: %disassembler %n.opt.bc -o obf.ll
// obf const
// EXEC-1: cat obf.ll | grep 123456789

package obfuscation_70009

main() {
    var name = "TEST_FOR_OBFUSCATION"
    var a1 = 123456789
    var a2 = 1
    var a3 = 1
    var a4 = 1
    var a5 = 1
    var a6 = 1
    var a7 = 1
    var a8 = 1
    var a9 = 1
    var a10 = 1
    var a11 = 1
    var a12 = 1
    var a13 = 1
    var a14 = 1
    var a15 = 1
    var a16 = 1
    var a17 = 1
    var a18 = 1
    var a19 = 1
    var a20 = 1
    var a21 = 1
    var a22 = 1
    var a23 = 1
    var a24 = 1
    var a25 = 1
    var a26 = 1
    var a27 = 1
    var a28 = 1
    var a29 = 1
    var a30 = 1
    var a31 = 1
    var a32 = 1
    var a33 = 1
    var a34 = 1
    var a35 = 1
    var a36 = 1
    var a37 = 1
    var a38 = 1
    var a39 = 1
    var a40 = 1
    return a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14 + a15 + a16 + a17 + a18 + a19 + a20 + a21 +
        a22 + a23 + a24 + a25 + a26 + a27 + a28 + a29 + a30 + a31 + a32 + a33 + a34 + a35 + a36 + a37 + a38 + a39 + a40 -
        39
}
