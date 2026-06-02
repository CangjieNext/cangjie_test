/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f %conditional_compilation_config_opt -o %output
// ASSERT: regex error.*'-o' is not a vaild directory path, please check it or pass the key-value pair like: k1=v1,k2=v2.

main() {
    0
}
