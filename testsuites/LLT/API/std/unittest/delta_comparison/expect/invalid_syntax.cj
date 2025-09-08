/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: regex @Expect\(x1, x2, delta:\)\r?\n +\| +\^
// ASSERT: regex @Expect\(, x1, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, , delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <, x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, delta2: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x2 > x1\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(, , delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x3\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 < x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 ==, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 !=, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(< x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(> x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(== x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(<= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(>= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(!= x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(, x2, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, delta: d\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta:\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 < x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 < x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 < x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 < x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 > x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, x1 == x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 >= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 <= x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, <= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 > x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 != x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 < x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 == x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 >= x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 > x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 >= x2, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 >= x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 > x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 > x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 == x2, x2 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <= x2, delta: d, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 < x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 != x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >= x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <= x2, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 < x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 > x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 == x2, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 != x2, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 < x2, x1 > x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 >= x2, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 > x2, delta: d, x1 <= x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x3\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 < x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 == x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 == x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 >=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 <=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 >\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 ==\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, >= x2\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 >= x2, \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 <= x2, extra: e\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 == x2, x1 !=\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 != x2, x1 <\)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 >= x2, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1 == x2, delta: d, x1 <= x, delta: \)\r?\n +\| +\^
// ASSERT: regex @Expect\(x1, x2, deta: d\)\r?\n +\| +\^


import std.unittest.RelativeDelta

@Test
class T {
    static let x1 = 1.0f16
    static let x2 = 1.0f16
    static let d = 1.0f16
    static let e = 1.0f16

    func ImplicitEqMissingDeltaValue() {
        @Expect(x1, x2, delta:)
    }

    func ImplicitEqMissingFirstArgument() {
        @Expect(, x1, delta: d)
    }

    func ImplicitEqMissingSeondArg() {
        @Expect(x1, , delta: d)
    }

    func ImplicitEqExtraNamedParameterNotAllowed() {
        @Expect(x1, x2, delta: d, extra: e)
    }

    func LessInvalidCmpOperator() {
        @Expect(x1 <, x2, delta: d)
    }

    func ImplicitEqCommaMissingExtraParameter() {
        @Expect(x1, x2, delta: d, )
    }

    func ImplicitEqSecondDeltaIsDeprecated() {
        @Expect(x1, x2, delta: d, delta2: e)
    }

    func ImplicitEqExtraParameterNotAllowed() {
        @Expect(x1, x2, delta: d, x3)
    }

    func ImplicitEqExtraCompareInThirdParamLess() {
        @Expect(x1, x2, delta: d, x1 < x2)
    }

    func ImplicitEqTwoSameDeltaNamedParam() {
        @Expect(x1, x2, delta: d, delta: d)
    }

    func ImplicitEqExtraCompareInThirdParamGreater() {
        @Expect(x1, x2, delta: d, x1 > x2)
    }

    func ImplicitEqExtraCompareInThirdParamEq() {
        @Expect(x1, x2, delta: d, x1 == x2)
    }

    func ImplicitEqExtraCompareInThirdParamNotEq() {
        @Expect(x1, x2, delta: d, x1 !=)
    }

    func ImplicitEqExtraCompareInThirdParamEqWithoutOperands() {
        @Expect(x1, x2, delta: d, ==)
    }

    func ImplicitEqTwoCmpExtraParams() {
        @Expect(x1, x2, delta: d, x1 < x2, x2 > x1)
    }

    func ImplicitEqSecondNamedDeltaWithoutValue() {
        @Expect(x1, x2, delta: d, delta: )
    }

    func ImplicitEqExtraCmpLessLastComma() {
        @Expect(x1, x2, delta: d, x1 < x2, )
    }

    func ImplicitEqWithoutFirstTwoParams() {
        @Expect(, , delta: d)
    }

    func ImplicitEqExtraCmpAndUsualParam() {
        @Expect(x1, x2, delta: d, x1 < x2, x3)
    }

    func ImplicitEqDuplicateDeltaWithExtraCmpParam() {
        @Expect(x1, x2, delta: d, x1 < x2, delta: d)
    }

    func ImplicitEqExtraInvalidCmpGraterOrEqParam() {
        @Expect(x1, x2, delta: d, x1 >=)
    }

    func ImplicitEqExtraInvalidCmpLessOrEqParam() {
        @Expect(x1, x2, delta: d, x1 <=)
    }

    func ImplicitEqExtraInvalidCmpGreaterParam() {
        @Expect(x1, x2, delta: d, x1 >)
    }

    func ImplicitEqExtraInvalidCmpLessParam() {
        @Expect(x1, x2, delta: d, x1 <)
    }

    func ImplicitEqExtraInvalidEqParam() {
        @Expect(x1, x2, delta: d, x1 ==)
    }

    func ImplicitEqExtraInvalidGreaterOrEq() {
        @Expect(x1, x2, delta: d, >= x2)
    }

    func ImplicitEqExtraInvalidGreaterOrEqComma() {
        @Expect(x1, x2, delta: d, x1 >= x2, )
    }

    func ImplicitEqExtraLessOrEqExtraNamedParam() {
        @Expect(x1, x2, delta: d, x1 <= x2, extra: e)
    }

    func ImplicitEqExtraLessCmpExtraIncompleteGreaterCmp() {
        @Expect(x1, x2, delta: d, x1 < x2, x1 >)
    }

    func ImplicitEqExtraEqExtraIncompleteNotEq() {
        @Expect(x1, x2, delta: d, x1 == x2, x2 !=)
    }

    func ImplicitEqExtraNotEqExtraIncompleteLess() {
        @Expect(x1, x2, delta: d, x1 != x2, x1 <)
    }

    func ImplicitEqExtraGreaterOrEqNamedDeltaParam() {
        @Expect(x1, x2, delta: d, x1 >= x2, delta: )
    }

    func ImplicitEqExtraLessOrEqNamedDeltaComma() {
        @Expect(x1, x2, delta: d, x1 <= x2, delta: d, )
    }

    func ImplicitEqExtraGreaterIncompleteLess() {
        @Expect(x1, x2, delta: d, x1 > x2, x1 <)
    }

    func ImplicitEqExtraEqNotEq() {
        @Expect(x1, x2, delta: d, x1 == x2, x1 !=)
    }

    func ImplicitEqExtraNotEqIncompleteLessOrEq() {
        @Expect(x1, x2, delta: d, x1 != x2, x1 <=)
    }

    func ImplicitEqExtraGreaterOrEqIncompleteLess() {
        @Expect(x1, x2, delta: d, x1 >= x2, x1 <)
    }

    func ImplicitEqExtraLessOrEqIncompleteGreater() {
        @Expect(x1, x2, delta: d, x1 <= x2, x1 >)
    }

    func ImplicitEqExtraLessIncompleteEq() {
        @Expect(x1, x2, delta: d, x1 < x2, x1 ==)
    }

    func ImplicitEqExtraGreaterIncompleteNotEq() {
        @Expect(x1, x2, delta: d, x1 > x2, x1 !=)
    }

    func ImplicitEqExtraEqIncompleteLessOrEq() {
        @Expect(x1, x2, delta: d, x1 == x2, x1 <=)
    }

    func ImplicitEqExtraNotEqIncompleteGreaterOrEq() {
        @Expect(x1, x2, delta: d, x1 != x2, x1 >=)
    }

    func ImplicitEqExtraLessGreater() {
        @Expect(x1, x2, delta: d, x1 < x2, x1 > x2)
    }

    func ImplicitEqExtraGreaterOrEqIncompelteEq() {
        @Expect(x1, x2, delta: d, x1 >= x2, x1 ==)
    }

    func ImplicitEqExtraLessOrEqIncompelteNotEq() {
        @Expect(x1, x2, delta: d, x1 <= x2, x1 !=)
    }

    func ImplicitEqExtraGreater() {
        @Expect(x1, x2, delta: d, x1 > x2, x1 < x2)
    }

    func ImplicitEqExtraLessEq() {
        @Expect(x1, x2, delta: d, x1 < x2, x1 == x2)
    }

    func ImplicitEqExtraGreaterOrEqIncompleteNotEq() {
        @Expect(x1, x2, delta: d, x1 >= x2, x1 !=)
    }

    func ImplicitEqExtraLessIncompleteGreaterOrEq() {
        @Expect(x1, x2, delta: d, x1 < x2, x1 >=)
    }

    func ImplicitEqExtraEqIncompleteLess() {
        @Expect(x1, x2, delta: d, x1 == x2, x1 <)
    }

    func ImplicitEqExtraLessOrEqIncompleteEq() {
        @Expect(x1, x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitLessValidComparison() {
        let x1 = 1.0f16
        let x2 = 2.0f16
        @Expect(x1 < x2, delta: d) // correct
    }

    func ExplicitGreaterValidComparison() {
        let x1 = 1.0f16
        let x2 = 2.0f16
        @Expect(x1 > x2, delta: d) // correct
    }

    func ExplicitEqualValidComparison() {
        @Expect(x1 == x2, delta: d) // correct
    }

    func ExplicitLessOrEqualValidComparison() {
        @Expect(x1 <= x2, delta: d) // correct
    }

    func ExplicitGreaterOrEqualValidComparison() {
        @Expect(x1 >= x2, delta: d) // correct
    }

    func ExplicitNotEqualValidComparison() {
        let x2 = 0.0f16
        @Expect(x1 != x2, delta: d) // correct
    }

    func ExplicitLessMissingSecondOperand() {
        @Expect(x1 <, delta: d)
    }

    func ExplicitGreaterMissingSecondOperand() {
        @Expect(x1 >, delta: d)
    }

    func ExplicitEqualMissingSecondOperand() {
        @Expect(x1 ==, delta: d)
    }

    func ExplicitLessOrEqualMissingSecondOperand() {
        @Expect(x1 <=, delta: d)
    }

    func ExplicitGreaterOrEqualMissingSecondOperand() {
        @Expect(x1 >=, delta: d)
    }

    func ExplicitNotEqualMissingSecondOperand() {
        @Expect(x1 !=, delta: d)
    }

    func ExplicitLessMissingFirstOperand() {
        @Expect(< x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Expect(> x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Expect(== x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Expect(<= x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Expect(>= x2, delta: d)
    }

    func ExplicitGreaterMissingFirstOperand() {
        @Expect(!= x2, delta: d)
    }

    func ExplicitMissingFirstOperand() {
        @Expect(, x2, delta: d)
    }

    func ExplicitMissingComparisonOperand() {
        @Expect(x1, delta: d)
    }

    func ExplicitLessMissingDeltaValue() {
        @Expect(x1 < x2, delta:)
    }

    func ExplicitLessExtraNamedParameterNotAllowed() {
        @Expect(x1 < x2, delta: d, extra: e)
    }

    func ExplicitLessExtraParameterNotAllowed() {
        @Expect(x1 < x2, delta: d, x3)
    }

    func ExplicitLessExtraComparisonInThirdParam() {
        @Expect(x1 < x2, delta: d, x1 > x2)
    }

    func ExplicitLessSecondNamedDeltaWithoutValue() {
        @Expect(x1 < x2, delta: d, delta: )
    }

    func ExplicitLessExtraCmpLessLastComma() {
        @Expect(x1 < x2, delta: d, x1 < x2, )
    }

    func ExplicitLessExtraLessCmpExtraIncompleteGreaterCmp() {
        @Expect(x1 < x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitLessExtraInvalidCmpGreaterOrEqParam() {
        @Expect(x1 < x2, delta: d, x1 >=)
    }

    func ExplicitLessExtraInvalidCmpLessOrEqParam() {
        @Expect(x1 < x2, delta: d, x1 <=)
    }

    func ExplicitLessExtraInvalidCmpGreaterParam() {
        @Expect(x1 < x2, delta: d, x1 >)
    }

    func ExplicitLessExtraInvalidCmpLessParam() {
        @Expect(x1 < x2, delta: d, x1 <)
    }

    func ExplicitLessExtraInvalidEqParam() {
        @Expect(x1 < x2, delta: d, x1 ==)
    }

    func ExplicitLessExtraInvalidGreaterOrEq() {
        @Expect(x1 < x2, delta: d, >= x2)
    }

    func ExplicitLessExtraInvalidGreaterOrEqComma() {
        @Expect(x1 < x2, delta: d, x1 >= x2, )
    }

    func ExplicitLessExtraLessOrEqExtraNamedParam() {
        @Expect(x1 < x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitLessExtraEqExtraIncompleteNotEq() {
        @Expect(x1 < x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitLessExtraNotEqExtraIncompleteLess() {
        @Expect(x1 < x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitLessExtraGreaterOrEqNamedDeltaParam() {
        @Expect(x1 < x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitLessExtraLessOrEqNamedDeltaComma() {
        @Expect(x1 < x2, delta: d, x1 <= x2, delta: d, )
    }

    func ExplicitLessExtraGreaterIncompleteLess() {
        @Expect(x1 < x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitLessExtraEqNotEq() {
        @Expect(x1 < x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitLessExtraNotEqIncompleteLessOrEq() {
        @Expect(x1 < x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteLess() {
        @Expect(x1 < x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitLessExtraLessOrEqIncompleteGreater() {
        @Expect(x1 < x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitLessExtraLessIncompleteEq() {
        @Expect(x1 < x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitLessExtra() {
        @Expect(x1 < x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitLessExtraEqIncompleteLessOrEq() {
        @Expect(x1 < x2, delta: d, x1 == x2, x1 <=)
    }

    func ExplicitLessExtraNotEqIncompleteGreaterOrEq() {
        @Expect(x1 < x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitLessExtraLessGreater() {
        @Expect(x1 < x2, delta: d, x1 < x2, x1 > x2)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteEq() {
        @Expect(x1 < x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitLessExtraLessOrEqIncompleteNotEq() {
        @Expect(x1 < x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitLessExtraGreater() {
        @Expect(x1 < x2, delta: d, x1 > x2, x1 < x2)
    }

    func ExplicitLessExtraLessEq() {
        @Expect(x1 < x2, delta: d, x1 < x2, x1 == x2)
    }

    func ExplicitLessExtraGreaterOrEqIncompleteNotEq() {
        @Expect(x1 < x2, delta: d, x1 >= x2, x1 !=)
    }

    func ExplicitLessExtraLessIncompleteGreaterOrEq() {
        @Expect(x1 < x2, delta: d, x1 < x2, x1 >=)
    }

    func ExplicitLessExtraEqIncompleteLess() {
        @Expect(x1 < x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitLessExtraLessOrEqIncompleteEq() {
        @Expect(x1 < x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitLessOrEqSecondNamedDeltaWithoutValue() {
        @Expect(x1 <= x2, delta: d, delta: )
    }

    func ExplicitLessOrEqExtraCmpLessOrEqLastComma() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, )
    }

    func ExplicitLessOrEqExtraLessOrEqCmpExtraIncompleteGreaterCmp() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitLessOrEqExtraInvalidCmpGreaterOrEqParam() {
        @Expect(x1 <= x2, delta: d, x1 >=)
    }

    func ExplicitLessOrEqExtraInvalidCmpLessParam() {
        @Expect(x1 <= x2, delta: d, x1 <)
    }

    func ExplicitLessOrEqExtraInvalidCmpGreaterParam() {
        @Expect(x1 <= x2, delta: d, x1 >)
    }

    func ExplicitLessOrEqExtraInvalidEqParam() {
        @Expect(x1 <= x2, delta: d, x1 ==)
    }

    func ExplicitLessOrEqExtraInvalidGreaterOrEq() {
        @Expect(x1 <= x2, delta: d, >= x2)
    }

    func ExplicitLessOrEqExtraInvalidGreaterOrEqComma() {
        @Expect(x1 <= x2, delta: d, x1 >= x2, )
    }

    func ExplicitLessOrEqExtraLessExtraNamedParam() {
        @Expect(x1 <= x2, delta: d, x1 < x2, extra: e)
    }

    func ExplicitLessOrEqExtraEqExtraIncompleteNotEq() {
        @Expect(x1 <= x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitLessOrEqExtraNotEqExtraIncompleteLess() {
        @Expect(x1 <= x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitLessOrEqExtraGreaterOrEqNamedDeltaParam() {
        @Expect(x1 <= x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitLessOrEqExtraLessIncompleteGreater() {
        @Expect(x1 <= x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitLessOrEqExtraEqNotEq() {
        @Expect(x1 <= x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitLessOrEqExtraNotEqIncompleteLessOrEq() {
        @Expect(x1 <= x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteLess() {
        @Expect(x1 <= x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitLessOrEqExtraLessIncompleteEq() {
        @Expect(x1 <= x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitLessOrEqExtra() {
        @Expect(x1 <= x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitLessOrEqExtraEqIncompleteLess() {
        @Expect(x1 <= x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitLessOrEqExtraNotEqIncompleteGreaterOrEq() {
        @Expect(x1 <= x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitLessOrEqExtraLessGreater() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, x1 > x2)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteEq() {
        @Expect(x1 <= x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitLessOrEqExtraLessIncompleteNotEq() {
        @Expect(x1 <= x2, delta: d, x1 < x2, x1 !=)
    }

    func ExplicitLessOrEqExtraGreater() {
        @Expect(x1 <= x2, delta: d, x1 > x2, x1 < x2)
    }

    func ExplicitLessOrEqExtraLessEq() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, x1 == x2)
    }

    func ExplicitLessOrEqExtraGreaterOrEqIncompleteNotEq() {
        @Expect(x1 <= x2, delta: d, x1 >= x2, x1 !=)
    }

    func ExplicitLessOrEqExtraLessIncompleteGreaterOrEq() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, x1 >=)
    }

    func ExplicitLessOrEqExtraLessOrEqIncompleteEq() {
        @Expect(x1 <= x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitGreaterOrEqSecondNamedDeltaWithoutValue() {
        @Expect(x1 >= x2, delta: d, delta: )
    }

    func ExplicitGreaterOrEqExtraCmpGreaterOrEqLastComma() {
        @Expect(x1 >= x2, delta: d, x1 >= x2, )
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqCmpExtraIncompleteLessCmp() {
        @Expect(x1 >= x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraInvalidCmpLessOrEqParamMissingSecondOperand() {
        @Expect(x1 >= x2, delta: d, x1 <=)
    }

    func ExplicitGreaterOrEqExtraInvalidCmpLessParam() {
        @Expect(x1 >= x2, delta: d, x1 <)
    }

    func ExplicitGreaterOrEqExtraCmpLessOrEqParam() {
        @Expect(x1 >= x2, delta: d, x1 <= x2)
    }

    func ExplicitGreaterOrEqExtraInvalidEqParam() {
        @Expect(x1 >= x2, delta: d, x1 ==)
    }

    func ExplicitGreaterOrEqExtraInvalidLessOrEq() {
        @Expect(x1 >= x2, delta: d, <= x2)
    }

    func ExplicitGreaterOrEqExtraInvalidLessOrEqComma() {
        @Expect(x1 >= x2, delta: d, x1 <= x2, )
    }

    func ExplicitGreaterOrEqExtraGreaterExtraNamedParam() {
        @Expect(x1 >= x2, delta: d, x1 > x2, extra: e)
    }

    func ExplicitGreaterOrEqExtraEqExtraIncompleteNotEq() {
        @Expect(x1 >= x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitGreaterOrEqExtraNotEqExtraIncompleteGreater() {
        @Expect(x1 >= x2, delta: d, x1 != x2, x1 >)
    }

    func ExplicitGreaterOrEqExtraLessOrEqNamedDeltaParam() {
        @Expect(x1 >= x2, delta: d, x1 <= x2, delta: )
    }

    func ExplicitGreaterOrEqExtraGreaterIncompleteLess() {
        @Expect(x1 >= x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraEqNotEq() {
        @Expect(x1 >= x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitGreaterOrEqExtraNotEqIncompleteGreaterOrEq() {
        @Expect(x1 >= x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteLess() {
        @Expect(x1 >= x2, delta: d, x1 <= x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqIncompleteEq() {
        @Expect(x1 >= x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitGreaterOrEqExtra() {
        @Expect(x1 >= x2, delta: d, x1 < x2, x1 !=)
    }

    func ExplicitGreaterOrEqExtraEqIncompleteGreater() {
        @Expect(x1 >= x2, delta: d, x1 == x2, x1 >)
    }

    func ExplicitGreaterOrEqExtraNotEqIncompleteLessOrEq() {
        @Expect(x1 >= x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitGreaterOrEqExtraGreaterLess() {
        @Expect(x1 >= x2, delta: d, x1 >= x2, x1 < x2)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteEq() {
        @Expect(x1 >= x2, delta: d, x1 <= x2, x1 ==)
    }

    func ExplicitGreaterOrEqExtraGreaterIncompleteGreaterOrEq() {
        @Expect(x1 >= x2, delta: d, x1 > x2, x1 >=)
    }

    func ExplicitGreaterOrEqExtraGreaterOrEqLess() {
        @Expect(x1 >= x2, delta: d, x1 >= x2, x1 < x2)
    }

    func ExplicitGreaterOrEqExtraEqIncompleteLess() {
        @Expect(x1 >= x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitGreaterOrEqExtraLessOrEqIncompleteNotEq() {
        @Expect(x1 >= x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitGreaterExtraNamedParameterNotAllowed() {
        @Expect(x1 > x2, delta: d, extra: e)
    }

    func ExplicitGreaterExtraParameterNotAllowed() {
        @Expect(x1 > x2, delta: d, x3)
    }

    func ExplicitGreaterExtraComparisonInThirdParam() {
        @Expect(x1 > x2, delta: d, x1 < x2)
    }

    func ExplicitGreaterSecondNamedDeltaWithoutValue() {
        @Expect(x1 > x2, delta: d, delta: )
    }

    func ExplicitGreaterExtraCmpGreaterLastComma() {
        @Expect(x1 > x2, delta: d, x1 > x2, )
    }

    func ExplicitGreaterExtraInvalidCmpGreaterOrEqParam() {
        @Expect(x1 > x2, delta: d, x1 >=)
    }

    func ExplicitGreaterExtraInvalidCmpLessOrEqParam() {
        @Expect(x1 > x2, delta: d, x1 <=)
    }

    func ExplicitGreaterExtraInvalidCmpGreaterParam() {
        @Expect(x1 > x2, delta: d, x1 >)
    }

    func ExplicitGreaterExtraInvalidCmpLessParam() {
        @Expect(x1 > x2, delta: d, x1 <)
    }

    func ExplicitGreaterExtraInvalidEqParam() {
        @Expect(x1 > x2, delta: d, x1 ==)
    }

    func ExplicitGreaterExtraInvalidGreaterOrEq() {
        @Expect(x1 > x2, delta: d, >= x2)
    }

    func ExplicitGreaterExtraInvalidGreaterOrEqComma() {
        @Expect(x1 > x2, delta: d, x1 >= x2, )
    }

    func ExplicitGreaterExtraLessOrEqExtraNamedParam() {
        @Expect(x1 > x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitGreaterExtraGreaterCmpExtraIncompleteLessCmp() {
        @Expect(x1 > x2, delta: d, x1 > x2, x1 <)
    }

    func ExplicitGreaterExtraEqExtraIncompleteNotEq() {
        @Expect(x1 > x2, delta: d, x1 == x2, x2 !=)
    }

    func ExplicitGreaterExtraNotEqExtraIncompleteLess() {
        @Expect(x1 > x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitGreaterExtraGreaterOrEqNamedDeltaParam() {
        @Expect(x1 > x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitGreaterExtraLessOrEqNamedDeltaComma() {
        @Expect(x1 > x2, delta: d, x1 <= x2, delta: d, )
    }

    func ExplicitGreaterExtraLessCmpExtraIncompleteGreaterCmp() {
        @Expect(x1 > x2, delta: d, x1 < x2, x1 >)
    }

    func ExplicitGreaterExtraEqNotEq() {
        @Expect(x1 > x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitGreaterExtraNotEqIncompleteLessOrEq() {
        @Expect(x1 > x2, delta: d, x1 != x2, x1 <=)
    }

    func ExplicitGreaterExtraGreaterOrEqIncompleteLess() {
        @Expect(x1 > x2, delta: d, x1 >= x2, x1 <)
    }

    func ExplicitGreaterExtraLessOrEqIncompleteGreater() {
        @Expect(x1 > x2, delta: d, x1 <= x2, x1 >)
    }

    func ExplicitGreaterExtraLessIncompleteEq() {
        @Expect(x1 > x2, delta: d, x1 < x2, x1 ==)
    }

    func ExplicitGreaterExtraGreaterIncompleteNotEq() {
        @Expect(x1 > x2, delta: d, x1 > x2, x1 !=)
    }

    func ExplicitGreaterExtraEqIncompleteLessOrEq() {
        @Expect(x1 > x2, delta: d, x1 == x2, x1 <=)
    }

    func ExplicitGreaterExtraNotEqIncompleteGreaterOrEq() {
        @Expect(x1 > x2, delta: d, x1 != x2, x1 >=)
    }

    func ExplicitGreaterExtraLessGreater() {
        @Expect(x1 > x2, delta: d, x1 < x2, x1 > x2)
    }

    func ExplicitGreaterExtraGreaterOrEqIncompleteEq() {
        @Expect(x1 > x2, delta: d, x1 >= x2, x1 ==)
    }

    func ExplicitGreaterExtraLessOrEqIncompleteNotEq() {
        @Expect(x1 > x2, delta: d, x1 <= x2, x1 !=)
    }

    func ExplicitEqualExtraNamedParameterNotAllowed() {
        @Expect(x1 == x2, delta: d, extra: e)
    }

    func ExplicitEqualExtraParameterNotAllowed() {
        @Expect(x1 == x2, delta: d, x3)
    }

    func ExplicitEqualExtraComparisonInThirdParam() {
        @Expect(x1 == x2, delta: d, x1 < x2)
    }

    func ExplicitEqualSecondNamedDeltaWithoutValue() {
        @Expect(x1 == x2, delta: d, delta: )
    }

    func ExplicitEqualExtraCmpEqualLastComma() {
        @Expect(x1 == x2, delta: d, x1 == x2, )
    }

    func ExplicitEqualExtraEqualCmpExtraIncompleteLessCmp() {
        @Expect(x1 == x2, delta: d, x1 == x2, x1 <)
    }

    func ExplicitEqualExtraInvalidCmpGreaterOrEqParam() {
        @Expect(x1 == x2, delta: d, x1 >=)
    }

    func ExplicitEqualExtraInvalidCmpLessOrEqParam() {
        @Expect(x1 == x2, delta: d, x1 <=)
    }

    func ExplicitEqualExtraInvalidCmpGreaterParam() {
        @Expect(x1 == x2, delta: d, x1 >)
    }

    func ExplicitEqualExtraInvalidCmpLessParam() {
        @Expect(x1 == x2, delta: d, x1 <)
    }

    func ExplicitEqualExtraInvalidEqParam() {
        @Expect(x1 == x2, delta: d, x1 ==)
    }

    func ExplicitEqualExtraInvalidGreaterOrEq() {
        @Expect(x1 == x2, delta: d, >= x2)
    }

    func ExplicitEqualExtraInvalidGreaterOrEqComma() {
        @Expect(x1 == x2, delta: d, x1 >= x2, )
    }

    func ExplicitEqualExtraLessOrEqExtraNamedParam() {
        @Expect(x1 == x2, delta: d, x1 <= x2, extra: e)
    }

    func ExplicitEqualExtraEqualNotEq() {
        @Expect(x1 == x2, delta: d, x1 == x2, x1 !=)
    }

    func ExplicitEqualExtraNotEqExtraIncompleteLess() {
        @Expect(x1 == x2, delta: d, x1 != x2, x1 <)
    }

    func ExplicitEqualExtraGreaterOrEqNamedDeltaParam() {
        @Expect(x1 == x2, delta: d, x1 >= x2, delta: )
    }

    func ExplicitEqualExtraLessOrEqNamedDeltaParam() {
        @Expect(x1 == x2, delta: d, x1 <= x, delta: )
    }

    func ImplicitEqualInvalidDeltaNamedArg() {
        @Expect(x1, x2, deta: d)
    }
}
