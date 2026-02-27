/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not iOS) EXEC: %compiler %conditional_compilation_config_opt="a=1,b=2" %cmp_opt %compile_lib_opt %f -o %output

@When[a == "1" && b == "1"]
main() {
    0
}
