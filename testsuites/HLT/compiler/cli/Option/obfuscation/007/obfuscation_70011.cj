/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.sh test7.cfg
// EXEC: %compiler %cmp_opt %obf_all --obf-config=test7.cfg %save_temps %f -o %output
// EXEC: %disassembler %n.opt.bc -o opt.ll
// EXEC: %compiler %cmp_opt %obf_all %save_temps %f -o %output
// EXEC: %disassembler %n.opt.bc -o obf.ll

// TODO: obf layout
// EXEC: cat obfuscation_70011.obf.map

package obfuscation_70011

var global_var_1 = 123456789

main() {
    return 0
}
