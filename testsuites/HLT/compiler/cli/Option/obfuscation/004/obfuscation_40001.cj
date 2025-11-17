/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %serial_compile %obf_cf_flatten %save_temps %f -o %output
// EXEC: %disassembler %n.opt.bc
// EXEC: cp  %n.opt.ll %n.obf.opt.ll

// EXEC: %compiler %cmp_opt %serial_compile %save_temps %f -o %output
// EXEC: %disassembler %n.opt.bc
// RUN-EXEC: %run %run_opt %output %run_args

// will have switch ir after obf.
// (not O2) EXEC: cat %n.obf.opt.ll | grep switch
// will not have switch ir.
// EXEC-1: cat %n.opt.ll | grep switch

package obfuscation_40001

var g_1 = 10
var g_2 = -10

func func_a() {
    return g_1 + g_2
}

func func_b() {
    return g_1 - g_2
}

func func_c() {
    return g_1 * g_2
}

func func_d() {
    return g_1 / g_2
}

main() {
    if (func_a() > 0) {
        println("func_a() > 0")
    }
    if (func_b() > 0) {
        println("func_b() > 0")
    } else if (func_c() > 0) {
        println("func_c() > 0")
    } else if (func_d() > 0) {
        println("func_d() > 0")
    } else {
        println("else")
    }
    return 0
}
