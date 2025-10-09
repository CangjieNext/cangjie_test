/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// DEPENDENCE: mp
// EXEC: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// ERRCHECK: %compiler %cmp_opt mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// ASSERT: scan-1 sema_not_matched
