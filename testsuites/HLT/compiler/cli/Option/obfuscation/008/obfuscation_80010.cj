/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %obf_all %save_temps %no_obf_layout --obf-seed=100 %f -o %output
// EXEC: %disassembler %n.opt.bc -o a.ll
// EXEC: %compiler %cmp_opt %obf_all %save_temps %no_obf_layout --obf-seed=101 %f -o %output
// EXEC: %disassembler %n.opt.bc -o b.ll
// should not equal
// (not Windows) EXEC-1: diff a.ll b.ll 2>&1 1>%null_path

package obfuscation_80010

main() {
    return 0
}
