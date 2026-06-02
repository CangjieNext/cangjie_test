/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %conditional_compilation_config_opt="backend=1" %cmp_opt %f -o %output
// ASSERT: scan user defined condition's key can not be the same with builtin condition

@When[backend == "1"]
main() {
    0
}
// ASSERT: regex-not no position error occurred
