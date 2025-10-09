/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// DEPENDENCE: 01
// (CJNATIVE)EXEC: %compiler %cmp_opt --output libb1.a %pkg_opt 01/src/b1 %compile_lib_opt
// (CJNATIVE)EXEC: %compiler %cmp_opt --output %output %pkg_opt 01/src -L. -lb1
// (not CJNATIVE)EXEC: %compiler %cmp_opt --output libb1.%middle %pkg_opt 01/src/b1 %compile_lib_opt
// (not CJNATIVE)EXEC: %compiler %cmp_opt --output %output %pkg_opt 01/src libb1.%middle
// RUN-EXEC: %run %run_opt %output %run_args
