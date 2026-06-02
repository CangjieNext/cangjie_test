/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_20004.cj
// EXEC: %compiler %cmp_macro test_20004.cj
// ERRCHECK: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt  %f -o %output


import test.*

@When
func test(){0}

@When[TEST=="true"]
main(){test()}
// ASSERT: scan parse_expected_lsquare_after
