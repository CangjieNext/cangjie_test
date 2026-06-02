/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test_dir
// ERRCHECK: %compiler %cmp_opt %obf_all --obf-config=./test_dir %save_temps %f -o %output
// ASSERT: regex error.*: Not a file: './test_dir'.

package obf_me

main() {
    return 0
}
