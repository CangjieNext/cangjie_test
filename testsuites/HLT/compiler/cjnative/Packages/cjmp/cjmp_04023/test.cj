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
// ASSERT: scan sema_common_open_class_no_init
// ASSERT: scan sema_no_non_param_constructor_in_super_class


