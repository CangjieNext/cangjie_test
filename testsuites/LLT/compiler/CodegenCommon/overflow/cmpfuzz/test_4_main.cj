// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_4.cj
// EXEC: %compiler %int_overflow_opt=wrapping %cmp_opt test_4.cj -o test4O0.%suffix
// (Unix) EXEC: export cjStackSize=1MB && %run test4O0.%suffix %run_args &> test4O0.txt
// (Windows) EXEC: (set cjStackSize=1MB) && %run test4O0.%suffix >test4O0.txt 2>&1
// EXEC: %compiler %int_overflow_opt=wrapping %cmp_opt %enableO2 test_4.cj -o test4O2.%suffix
// (Unix) EXEC: %run test4O2.%suffix %run_args &> test4O2.txt
// (Windows) EXEC: %run test4O2.%suffix >test4O2.txt 2>&1
// EXEC: %diff test4O0.txt test4O2.txt
