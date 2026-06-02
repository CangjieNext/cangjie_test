/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan-1 @TestTemplate abstract class can't have more than one template.

@TestTemplate
abstract class Template1 {}

@TestTemplate
abstract class Template2 {}

@TestTemplate
abstract class Template <: Template1 & Template2 {}
