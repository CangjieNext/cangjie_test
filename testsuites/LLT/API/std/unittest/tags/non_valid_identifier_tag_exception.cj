/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan-3 Illegal parameters for @Tag
// ASSERT: scan-3 @Tag macro has no passed arguments or one of the tags is not valid identifier

@Test
@Tag["NotSoNice", Nice, 3]
func caseA() {
    @Fail("Should not run")
}

@Test
@Tag[Nice, But,]
func caseB() {
    @Fail("Should not run")
}

@Test
@Tag[, But, Nice]
func caseC() {
    @Fail("Should not run")
}
