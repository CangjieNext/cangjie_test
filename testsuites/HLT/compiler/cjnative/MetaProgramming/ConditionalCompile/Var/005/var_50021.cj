/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %conditional_compilation_config_opt="=1" %cmp_opt %f -o %output
// ASSERT: scan user defined condition should be like: k1=v1,k2=v2 or <directory path of cfg.toml>

main() {
    0
}
// ASSERT: regex-not no position error occurred
