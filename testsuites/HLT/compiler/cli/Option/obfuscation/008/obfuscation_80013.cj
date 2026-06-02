/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %obf_all %save_temps %no_obf_layout --obf-seed=10000000000 %f -o %output
// ASSERT: scan The value of --obf-seed is invalid.

package obf_me

main() {
    return 0
}
