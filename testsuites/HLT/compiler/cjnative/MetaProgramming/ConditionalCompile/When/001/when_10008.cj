/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_10008.cj
// EXEC: %compiler %conditional_compilation_config_opt="TEST=false" %cmp_opt %compile_lib_opt test_10008.cj -o test_10008.%middle
// ERRCHECK: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt test_10008.%middle %f -o %output

@When[TEST == "true"]
import test.*

@When[TEST == "true"]
func bar() {
    return foo()
}

@When[TEST == "true"]
main() {
    bar()
}
// ASSERT: scan sema_undeclared_identifier
