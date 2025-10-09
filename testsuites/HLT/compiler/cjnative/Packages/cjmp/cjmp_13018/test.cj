/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp
// ERRCHECK: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// ASSERT: scan-2 parse_explicitly_abstract_only_for_cjmp_abstract_class
// ASSERT: scan-2 parse_illegal_modifier_in_scope
