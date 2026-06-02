/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

// EXEC: %compiler %cmp_opt %obf_all --obf-level=1 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=2 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=3 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=4 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=5 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=6 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=7 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=8 %save_temps %f -o %output
// EXEC: %compiler %cmp_opt %obf_all --obf-level=9 %save_temps %f -o %output

package obf_me

main() {
    return 0
}
