/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: regex @Assert\(x1, x2, delta:\)\r?\n +\| +\^
// ASSERT: regex @Assert\(, x1, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, , delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <, x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, delta2: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x2 > x1\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(, , delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x3\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 < x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 ==, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 !=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(< x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(> x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(== x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(<= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(>= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(!= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(, x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta:\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 < x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 < x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 < x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 < x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 <= x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, <= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 > x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 != x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 < x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 == x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 >= x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 > x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 >= x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 >= x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 > x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 > x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 == x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1 == x2, delta: d, x1 <= x, delta: \)\r?\n +\| +\^
// ASSERT: regex @Assert\(x1, x2, deta: d\)\r?\n +\| +\^


import std.unittest.RelativeDelta

@Test
class T {
    static let x1 = 1.0f16
    static let x2 = 1.0f16
    static let d = 1.0f16
    static let e = 1.0f16

    func ImplicitEqMissingDeltaValue() {
        @Assert(x1, x2, delta:)
    }

    func ImplicitEqMissingFirstArgument() {
        @Assert(, x1, delta: d)
    }

    func ImplicitEqMissingSeondArg() {
        @Assert(x1, , delta: d)
    }

    func ImplicitEqExtraNamedParameterNotAllowed() {
        @Assert(x1, x2, delta: d, extra: e)
    }

    func LessInvalidCmpOperator() {
        @Assert(x1 <, x2, delta: d)
    }

    func ImplicitEqCommaMissingExtraParameter() {
        @Assert(x1, x2, delta: d, )
    }

    func ImplicitEqSecondDeltaIsDeprecated() {
        @Assert(x1, x2, delta: d, delta2: e)
    }

    func ImplicitEqExtraParameterNotAllowed() {
        @Assert(x1, x2, delta: d, x3)
    }

    func ImplicitEqExtraCompareInThirdParamLess() {
        @Assert(x1, x2, delta: d, x1 < x2)
    }

    func ImplicitEqTwoSameDeltaNamedParam() {
        @Assert(x1, x2, delta: d, delta: d)
    }

    func ImplicitEqExtraCompareInThirdParamGreater() {
        @Assert(x1, x2, delta: d, x1 > x2)
    }

    func ImplicitEqExtraCompareInThirdParamEq() {
        @Assert(x1, x2, delta: d, x1 == x2)
    }

    func ImplicitEqExtraCompareInThirdParamNotEq() {
        @Assert(x1, x2, delta: d, x1 !=)
    }

    func ImplicitEqExtraCompareInThirdParamEqWithoutOperands() {
        @Assert(x1, x2, delta: d, ==)
    }

    func ImplicitEqTwoCmpExtraParams() {
        @Assert(x1, x2, delta: d, x1 < x2, x2 > x1)
    }

    func ImplicitEqSecondNamedDeltaWithoutValue() {
        @Assert(x1, x2, delta: d, delta: )
    }

    func ImplicitEqExtraCmpLessLastComma() {
        @Assert(x1, x2, delta: d, x1 < x2, )
    }

    func ImplicitEqWithoutFirstTwoParams() {
        @Assert(, , delta: d)
    }

    func ImplicitEqExtraCmpAndUsualParam() {
        @Assert(x1, x2, delta: d, x1 < x2, x3)
    }

    func ImplicitEqDuplicateDeltaWithExtraCmpParam() {
        @Assert(x1, x2, delta: d, x1 < x2, delta: d)
    }

    func ImplicitEqExtraInvalidCmpGraterOrEqParam() {
        @Assert(x1, x2, delta: d, x1 >=)
    }

    func ImplicitEqExtraInvalidCmpLessOrEqParam() {
        @Assert(x1, x2, delta: d, x1 <=)
    }

    func ImplicitEqExtraInvalidCmpGreaterParam() {
        @Assert(x1, x2, delta: d, x1 >)
    }

    func ImplicitEqExtraInvalidCmpLessParam() {
        @Assert(x1, x2, delta: d, x1 <)
    }

    func ImplicitEqExtraInvalidEqParam() {
        @Assert(x1, x2, delta: d, x1 ==)
    }

    func ImplicitEqExtraInvalidGreaterOrEq() {
        @Assert(x1, x2, delta: d, >= x2)
    }

    func ImplicitEqExtraInvalidGreaterOrEqComma() {
        @Assert(x1, x2, delta: d, x1 >= x2, )
    }

    func ImplicitEqExtraLessOrEqExtraNamedParam() {
        @Assert(x1, x2, delta: d, x1 <= x2, extra: e)
    }

    func ImplicitEqExtraLessCmpExtraIncompleteGreaterCmp() {
        @Assert(x1, x2, delta: d, x1 < x2, x1 >)
    }

    func ImplicitEqExtraEqExtraIncompleteNotEq() {
        @Assert(x1, x2, delta: d, x1 == x2, x2 !=)
    }

    func ImplicitEqExtraNotEqExtraIncompleteLess() {
        @Assert(x1, x2, delta: d, x1 != x2, x1 <)
    }

    func ImplicitEqExtraGreaterOrEqNamedDeltaParam() {
        @Assert(x1, x2, delta: d, x1 >= x2, delta: )
    }

    func ImplicitEqExtraLessOrEqNamedDeltaComma() {
        @Assert(x1, x2, delta: d, x1 <= x2, delta: d, )
    }

    func ImplicitEqExtraGreaterIncompleteLess() {
        @Assert(x1, x2, delta: d, x1 > x2, x1 <)
    }

    func ImplicitEqExtraEqNotEq() {
        @Assert(x1, x2, delta: d, x1 == x2, x1 !=)
    }

    func ImplicitEqExtraNotEqIncompleteLessOrEq() {
        @Assert(x1, x2, delta: d, x1 != x2, x1 <=)
    }

    func ImplicitEqExtraGreaterOrEqIncompleteLess() {
        @Assert(x1, x2, delta: d, x1 >= x2, x1 <)
    }

    func ImplicitEqExtraLessOrEqIncompleteGreater() {
        @Assert(x1, x2, delta: d, x1 <= x2, x1 >)
    }

    func ImplicitEqExtraLessIncompleteEq() {
        @Assert(x1, x2, delta: d, x1 < x2, x1 ==)
    }

    func ImplicitEqExtraGreaterIncompleteNotEq() {
        @Assert(x1, x2, delta: d, x1 > x2, x1 !=)
    }

    func ImplicitEqExtraEqIncompleteLessOrEq() {
        @Assert(x1, x2, delta: d, x1 == x2, x1 <=)
    }

    func ImplicitEqExtraNotEqIncompleteGreaterOrEq() {
        @Assert(x1, x2, delta: d, x1 != x2, x1 >=)
    }

    func ImplicitEqExtraLessGreater() {
        @Assert(x1, x2, delta: d, x1 < x2, x1 > x2)
    }

    func ImplicitEqExtraGreaterOrEqIncompelteEq() {
        @Assert(x1, x2, delta: d, x1 >= x2, x1 ==)
    }

    func ImplicitEqExtraLessOrEqIncompelteNotEq() {
        @Assert(x1, x2, delta: d, x1 <= x2, x1 !=)
    }

    func ImplicitEqExtraGreater() {
        @Assert(x1, x2, delta: d, x1 > x2, x1 < x2)
    }

    func ImplicitEqExtraLessEq() {
        @Assert(x1, x2, delta: d, x1 < x2, x1 == x2)
    }

    func ImplicitEqExtraGreaterOrEqIncompleteNotEq() {
        @Assert(x1, x2, delta: d, x1 >= x2, x1 !=)
    }

    func ImplicitEqExtraLessIncompleteGreaterOrEq() {
        @Assert(x1, x2, delta: d, x1 < x2, x1 >=)
    }

    func ImplicitEqExtraEqIncompleteLess() {
        @Assert(x1, x2, delta: d, x1 == x2, x1 <)
    }

    func ImplicitEqExtraLessOrEqIncompleteEq() {
        @Assert(x1, x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitLessValidComparison() {
        let x1 = 1.0f16
        let x2 = 2.0f16
        @Assert(x1 < x2, delta: d) // correct
    }

    func ExplicitGreaterValidComparison() {
        let x1 = 1.0f16
        let x2 = 2.0f16
        @Assert(x1 > x2, delta: d) // correct
    }

    func ExplicitEqualValidComparison() {
        @Assert(x1 == x2, delta: d) // correct
    }

    func ExplicitLessOrEqualValidComparison() {
        @Assert(x1 <= x2, delta: d) // correct
    }

    func ExplicitGreaterOrEqualValidComparison() {
        @Assert(x1 >= x2, delta: d) // correct
    }

    func ExplicitNotEqualValidComparison() {
        let x2 = 0.0f16
        @Assert(x1 != x2, delta: d) // correct
    }

    func ExplicitLessMissingSecondOperand() {
        @Assert(x1 <, delta: d)
    }

    func ExplicitGreaterMissingSecondOperand() {
        @Assert(x1 >, delta: d)
    }

    func ExplicitEqualMissingSecondOperand() {
        @Assert(x1 ==, delta: d)
    }

    func ExplicitLessOrEqualMissingSecondOperand() {
        @Assert(x1 <=, delta: d)
    }

    func ExplicitGreaterOrEqualMissingSecondOperand() {
        @Assert(x1 >=, delta: d)
    }

    func ExplicitNotEqualMissingSecondOperand() {
        @Assert(x1 !=, delta: d)
    }

    func ExplicitLessMissingFirstOperand() {
        @Assert(< x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Assert(> x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Assert(== x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Assert(<= x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Assert(>= x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Assert(!= x2, delta: d)
    }

    func ExplicitMissingFirstOperand() {
        @Assert(, x2, delta: d)
    }

    func ExplicitMissingComparisonOperand() {
        @Assert(x1, delta: d)
    }

    func ExplicitLessMissingDeltaValue() {
        @Assert(x1 < x2, delta:)
    }

    func ExplicitLessExtraNamedParameterNotAllowed() {
        @Assert(x1 < x2, delta: d, extra: e)
    }

    func ExplicitLessExtraParameterNotAllowed() {
        @Assert(x1 < x2, delta: d, x3)
    }

    func ExplicitLessExtraComparisonInThirdParam() {
        @Assert(x1 < x2, delta: d, x1 > x2)
    }

    func ExplicitLessSecondNamedDeltaWithoutValue() {
        @Assert(x1 < x2, delta: d, delta: )
    }

    func ExplicitLessExtraCmpLessLastComma() {
        @Assert(x1 < x2, delta: d, x1 < x2, )
    }

    func ExplicitLessExtraLessCmpExtraIncompleteGreaterCmp() {
        @Assert(x1 < x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitLessExtraInvalidCmpGreaterOrEqParam() {
        @Assert(x1 < x2, delta: d, x1 >=)
    }

    func ExplicitLessExtraInvalidCmpLessOrEqParam() {
        @Assert(x1 < x2, delta: d, x1 <=)
    }

    func ExplicitLessExtraInvalidCmpGreaterParam() {
        @Assert(x1 < x2, delta: d, x1 >)
    }

    func ExplicitLessExtraInvalidCmpLessParam() {
        @Assert(x1 < x2, delta: d, x1 <)
    }

    func ExplicitLessExtraInvalidEqParam() {
        @Assert(x1 < x2, delta: d, x1 ==)
    }

    func ExplicitLessExtraInvalidGreaterOrEq() {
        @Assert(x1 < x2, delta: d, >= x2)
    }

    func ExplicitLessExtraInvalidGreaterOrEqComma() {
        @Assert(x1 < x2, delta: d, x1 >= x2, )
    }

    func ExplicitLessExtraLessOrEqExtraNamedParam() {
        @Assert(x1 < x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitLessExtraEqExtraIncompleteNotEq() {
        @Assert(x1 < x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitLessExtraNotEqExtraIncompleteLess() {
        @Assert(x1 < x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitLessExtraGreaterOrEqNamedDeltaParam() {
        @Assert(x1 < x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitLessExtraLessOrEqNamedDeltaComma() {
        @Assert(x1 < x2, delta: d, x1 <= x2, delta: d, )
    }

    func ExplicitLessExtraGreaterIncompleteLess() {
        @Assert(x1 < x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitLessExtraEqNotEq() {
        @Assert(x1 < x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitLessExtraNotEqIncompleteLessOrEq() {
        @Assert(x1 < x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteLess() {
        @Assert(x1 < x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitLessExtraLessOrEqIncompleteGreater() {
        @Assert(x1 < x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitLessExtraLessIncompleteEq() {
        @Assert(x1 < x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitLessExtra() {
        @Assert(x1 < x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitLessExtraEqIncompleteLessOrEq() {
        @Assert(x1 < x2, delta: d, x1 == x2, x1 <=)
    }

    func ExplicitLessExtraNotEqIncompleteGreaterOrEq() {
        @Assert(x1 < x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitLessExtraLessGreater() {
        @Assert(x1 < x2, delta: d, x1 < x2, x1 > x2)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteEq() {
        @Assert(x1 < x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitLessExtraLessOrEqIncompleteNotEq() {
        @Assert(x1 < x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitLessExtraGreater() {
        @Assert(x1 < x2, delta: d, x1 > x2, x1 < x2)
    }

    func ExplicitLessExtraLessEq() {
        @Assert(x1 < x2, delta: d, x1 < x2, x1 == x2)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteNotEq() {
        @Assert(x1 < x2, delta: d, x1 >= x2, x1 !=)
    }

    func ExplicitLessExtraLessIncompleteGreaterOrEq() {
        @Assert(x1 < x2, delta: d, x1 < x2, x1 >=)
    }

    func ExplicitLessExtraEqIncompleteLess() {
        @Assert(x1 < x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitLessExtraLessOrEqIncompleteEq() {
        @Assert(x1 < x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitLessOrEqSecondNamedDeltaWithoutValue() {
        @Assert(x1 <= x2, delta: d, delta: )
    }

    func ExplicitLessOrEqExtraCmpLessOrEqLastComma() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, )
    }

    func ExplicitLessOrEqExtraLessOrEqCmpExtraIncompleteGreaterCmp() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitLessOrEqExtraInvalidCmpGreaterOrEqParam() {
        @Assert(x1 <= x2, delta: d, x1 >=)
    }

    func ExplicitLessOrEqExtraInvalidCmpLessParam() {
        @Assert(x1 <= x2, delta: d, x1 <)
    }

    func ExplicitLessOrEqExtraInvalidCmpGreaterParam() {
        @Assert(x1 <= x2, delta: d, x1 >)
    }

    func ExplicitLessOrEqExtraInvalidEqParam() {
        @Assert(x1 <= x2, delta: d, x1 ==)
    }

    func ExplicitLessOrEqExtraInvalidGreaterOrEq() {
        @Assert(x1 <= x2, delta: d, >= x2)
    }

    func ExplicitLessOrEqExtraInvalidGreaterOrEqComma() {
        @Assert(x1 <= x2, delta: d, x1 >= x2, )
    }

    func ExplicitLessOrEqExtraLessExtraNamedParam() {
        @Assert(x1 <= x2, delta: d, x1 < x2, extra: e)
    }

    func ExplicitLessOrEqExtraEqExtraIncompleteNotEq() {
        @Assert(x1 <= x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitLessOrEqExtraNotEqExtraIncompleteLess() {
        @Assert(x1 <= x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitLessOrEqExtraGreaterOrEqNamedDeltaParam() {
        @Assert(x1 <= x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitLessOrEqExtraLessIncompleteGreater() {
        @Assert(x1 <= x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitLessOrEqExtraEqNotEq() {
        @Assert(x1 <= x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitLessOrEqExtraNotEqIncompleteLessOrEq() {
        @Assert(x1 <= x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteLess() {
        @Assert(x1 <= x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitLessOrEqExtraLessIncompleteEq() {
        @Assert(x1 <= x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitLessOrEqExtra() {
        @Assert(x1 <= x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitLessOrEqExtraEqIncompleteLess() {
        @Assert(x1 <= x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitLessOrEqExtraNotEqIncompleteGreaterOrEq() {
        @Assert(x1 <= x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitLessOrEqExtraLessGreater() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, x1 > x2)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteEq() {
        @Assert(x1 <= x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitLessOrEqExtraLessIncompleteNotEq() {
        @Assert(x1 <= x2, delta: d, x1 < x2, x1 !=)
    }

    func ExplicitLessOrEqExtraGreater() {
        @Assert(x1 <= x2, delta: d, x1 > x2, x1 < x2)
    }

    func ExplicitLessOrEqExtraLessEq() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, x1 == x2)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteNotEq() {
        @Assert(x1 <= x2, delta: d, x1 >= x2, x1 !=)
    }

    func ExplicitLessOrEqExtraLessIncompleteGreaterOrEq() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, x1 >=)
    }

    func ExplicitLessOrEqExtraLessOrEqIncompleteEq() {
        @Assert(x1 <= x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitGreaterOrEqSecondNamedDeltaWithoutValue() {
        @Assert(x1 >= x2, delta: d, delta: )
    }

    func ExplicitGreaterOrEqExtraCmpGreaterOrEqLastComma() {
        @Assert(x1 >= x2, delta: d, x1 >= x2, )
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqCmpExtraIncompleteLessCmp() {
        @Assert(x1 >= x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraInvalidCmpLessOrEqParamMissingSecondOperand() {
        @Assert(x1 >= x2, delta: d, x1 <=)
    }

    func ExplicitGreaterOrEqExtraInvalidCmpLessParam() {
        @Assert(x1 >= x2, delta: d, x1 <)
    }

    func ExplicitGreaterOrEqExtraCmpLessOrEqParam() {
        @Assert(x1 >= x2, delta: d, x1 <= x2)
    }

    func ExplicitGreaterOrEqExtraInvalidEqParam() {
        @Assert(x1 >= x2, delta: d, x1 ==)
    }

    func ExplicitGreaterOrEqExtraInvalidLessOrEq() {
        @Assert(x1 >= x2, delta: d, <= x2)
    }

    func ExplicitGreaterOrEqExtraInvalidLessOrEqComma() {
        @Assert(x1 >= x2, delta: d, x1 <= x2, )
    }

    func ExplicitGreaterOrEqExtraGreaterExtraNamedParam() {
        @Assert(x1 >= x2, delta: d, x1 > x2, extra: e)
    }

    func ExplicitGreaterOrEqExtraEqExtraIncompleteNotEq() {
        @Assert(x1 >= x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitGreaterOrEqExtraNotEqExtraIncompleteGreater() {
        @Assert(x1 >= x2, delta: d, x1 != x2, x1 >)
    }

    func ExplicitGreaterOrEqExtraLessOrEqNamedDeltaParam() {
        @Assert(x1 >= x2, delta: d, x1 <= x2, delta: )
    }

    func ExplicitGreaterOrEqExtraGreaterIncompleteLess() {
        @Assert(x1 >= x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraEqNotEq() {
        @Assert(x1 >= x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitGreaterOrEqExtraNotEqIncompleteGreaterOrEq() {
        @Assert(x1 >= x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteLess() {
        @Assert(x1 >= x2, delta: d, x1 <= x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqIncompleteEq() {
        @Assert(x1 >= x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitGreaterOrEqExtra() {
        @Assert(x1 >= x2, delta: d, x1 < x2, x1 !=)
    }

    func ExplicitGreaterOrEqExtraEqIncompleteGreater() {
        @Assert(x1 >= x2, delta: d, x1 == x2, x1 >)
    }

    func ExplicitGreaterOrEqExtraNotEqIncompleteLessOrEq() {
        @Assert(x1 >= x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitGreaterOrEqExtraGreaterLess() {
        @Assert(x1 >= x2, delta: d, x1 >= x2, x1 < x2)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteEq() {
        @Assert(x1 >= x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitGreaterOrEqExtraGreaterIncompleteGreaterOrEq() {
        @Assert(x1 >= x2, delta: d, x1 > x2, x1 >=)
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqLess() {
        @Assert(x1 >= x2, delta: d, x1 >= x2, x1 < x2)
    }

    func ExplicitGreaterOrEqExtraEqIncompleteLess() {
        @Assert(x1 >= x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteNotEq() {
        @Assert(x1 >= x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitGreaterExtraNamedParameterNotAllowed() {
        @Assert(x1 > x2, delta: d, extra: e)
    }

    func ExplicitGreaterExtraParameterNotAllowed() {
        @Assert(x1 > x2, delta: d, x3)
    }

    func ExplicitGreaterExtraComparisonInThirdParam() {
        @Assert(x1 > x2, delta: d, x1 < x2)
    }

    func ExplicitGreaterSecondNamedDeltaWithoutValue() {
        @Assert(x1 > x2, delta: d, delta: )
    }

    func ExplicitGreaterExtraCmpGreaterLastComma() {
        @Assert(x1 > x2, delta: d, x1 > x2, )
    }

    func ExplicitGreaterExtraInvalidCmpGreaterOrEqParam() {
        @Assert(x1 > x2, delta: d, x1 >=)
    }

    func ExplicitGreaterExtraInvalidCmpLessOrEqParam() {
        @Assert(x1 > x2, delta: d, x1 <=)
    }

    func ExplicitGreaterExtraInvalidCmpGreaterParam() {
        @Assert(x1 > x2, delta: d, x1 >)
    }

    func ExplicitGreaterExtraInvalidCmpLessParam() {
        @Assert(x1 > x2, delta: d, x1 <)
    }

    func ExplicitGreaterExtraInvalidEqParam() {
        @Assert(x1 > x2, delta: d, x1 ==)
    }

    func ExplicitGreaterExtraInvalidGreaterOrEq() {
        @Assert(x1 > x2, delta: d, >= x2)
    }

    func ExplicitGreaterExtraInvalidGreaterOrEqComma() {
        @Assert(x1 > x2, delta: d, x1 >= x2, )
    }

    func ExplicitGreaterExtraLessOrEqExtraNamedParam() {
        @Assert(x1 > x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitGreaterExtraGreaterCmpExtraIncompleteLessCmp() {
        @Assert(x1 > x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitGreaterExtraEqExtraIncompleteNotEq() {
        @Assert(x1 > x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitGreaterExtraNotEqExtraIncompleteLess() {
        @Assert(x1 > x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitGreaterExtraGreaterOrEqNamedDeltaParam() {
        @Assert(x1 > x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitGreaterExtraLessOrEqNamedDeltaComma() {
        @Assert(x1 > x2, delta: d, x1 <= x2, delta: d, )
    }

    func ExplicitGreaterExtraLessCmpExtraIncompleteGreaterCmp() {
        @Assert(x1 > x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitGreaterExtraEqNotEq() {
        @Assert(x1 > x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitGreaterExtraNotEqIncompleteLessOrEq() {
        @Assert(x1 > x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitGreaterExtraGreaterOrEqIncompleteLess() {
        @Assert(x1 > x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitGreaterExtraLessOrEqIncompleteGreater() {
        @Assert(x1 > x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitGreaterExtraLessIncompleteEq() {
        @Assert(x1 > x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitGreaterExtraGreaterIncompleteNotEq() {
        @Assert(x1 > x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitGreaterExtraEqIncompleteLessOrEq() {
        @Assert(x1 > x2, delta: d, x1 == x2, x1 <=)
    }

    func ExplicitGreaterExtraNotEqIncompleteGreaterOrEq() {
        @Assert(x1 > x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitGreaterExtraLessGreater() {
        @Assert(x1 > x2, delta: d, x1 < x2, x1 > x2)
    }

    func ExplicitGreaterExtraGreaterOrEqIncompleteEq() {
        @Assert(x1 > x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitGreaterExtraLessOrEqIncompleteNotEq() {
        @Assert(x1 > x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitEqualExtraNamedParameterNotAllowed() {
        @Assert(x1 == x2, delta: d, extra: e)
    }

    func ExplicitEqualExtraParameterNotAllowed() {
        @Assert(x1 == x2, delta: d, x3)
    }

    func ExplicitEqualExtraComparisonInThirdParam() {
        @Assert(x1 == x2, delta: d, x1 < x2)
    }

    func ExplicitEqualSecondNamedDeltaWithoutValue() {
        @Assert(x1 == x2, delta: d, delta: )
    }

    func ExplicitEqualExtraCmpEqualLastComma() {
        @Assert(x1 == x2, delta: d, x1 == x2, )
    }

    func ExplicitEqualExtraEqualCmpExtraIncompleteLessCmp() {
        @Assert(x1 == x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitEqualExtraInvalidCmpGreaterOrEqParam() {
        @Assert(x1 == x2, delta: d, x1 >=)
    }

    func ExplicitEqualExtraInvalidCmpLessOrEqParam() {
        @Assert(x1 == x2, delta: d, x1 <=)
    }

    func ExplicitEqualExtraInvalidCmpGreaterParam() {
        @Assert(x1 == x2, delta: d, x1 >)
    }

    func ExplicitEqualExtraInvalidCmpLessParam() {
        @Assert(x1 == x2, delta: d, x1 <)
    }

    func ExplicitEqualExtraInvalidEqParam() {
        @Assert(x1 == x2, delta: d, x1 ==)
    }

    func ExplicitEqualExtraInvalidGreaterOrEq() {
        @Assert(x1 == x2, delta: d, >= x2)
    }

    func ExplicitEqualExtraInvalidGreaterOrEqComma() {
        @Assert(x1 == x2, delta: d, x1 >= x2, )
    }

    func ExplicitEqualExtraLessOrEqExtraNamedParam() {
        @Assert(x1 == x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitEqualExtraEqualNotEq() {
        @Assert(x1 == x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitEqualExtraNotEqExtraIncompleteLess() {
        @Assert(x1 == x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitEqualExtraGreaterOrEqNamedDeltaParam() {
        @Assert(x1 == x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitEqualExtraLessOrEqNamedDeltaParam() {
        @Assert(x1 == x2, delta: d, x1 <= x, delta: )
    }

    func ImplicitEqualInvalidDeltaNamedArg() {
        @Assert(x1, x2, deta: d)
    }
}
