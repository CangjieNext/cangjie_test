/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt %f -o %output

@When[TEST == "true"]
import x.xxx

@When[TEST == "true"]
func bar() {
    return 1
}

@When[TEST == "true"]
main() {
    bar()
}
// ASSERT: scan package_search_error
