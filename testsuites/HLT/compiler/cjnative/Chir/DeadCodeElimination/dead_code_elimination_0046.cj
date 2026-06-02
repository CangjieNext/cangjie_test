/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test1() {
    (return 0) + 1
    return 1
}

func test2() {
    1 + (return 0)
    return 1
}

func test3() {
    (return 0) + (return 1)
    return 2
}

func test4() {
    (return 0) - 1
    return 1
}

func test5() {
    1 - (return 0)
    return 1
}

func test6() {
    (return 0) - (return 1)
    return 2
}

func test7() {
    (return 0) * 1
    return 1
}

func test8() {
    1 * (return 0)
    return 1
}

func test9() {
    (return 0) * (return 1)
    return 2
}

func test10() {
    (return 0) / 1
    return 1
}

func test11() {
    1 / (return 0)
    return 1
}

func test12() {
    (return 0) / (return 1)
    return 2
}

func test13() {
    (return 0) % 1
    return 1
}

func test14() {
    1 % (return 0)
    return 1
}

func test15() {
    (return 0) % (return 1)
    return 2
}

func test16() {
    (return 0) ** 1
    return 1
}

func test17() {
    1 ** (return 0)
    return 1
}

func test18() {
    (return 0) ** (return 1)
    return 2
}

func test19() {
    (return 0) >> 1
    return 1
}

func test20() {
    1 >> (return 0)
    return 1
}

func test21() {
    (return 0) >> (return 1)
    return 2
}

func test22() {
    (return 0) << 1
    return 1
}

func test23() {
    1 << (return 0)
    return 1
}

func test24() {
    (return 0) << (return 1)
    return 2
}

func test25() {
    (return 0) < 1
    return 1
}

func test26() {
    1 < (return 0)
    return 1
}

func test27() {
    (return 0) < (return 1)
    return 2
}

func test28() {
    (return 0) > 1
    return 1
}

func test29() {
    1 > (return 0)
    return 1
}

func test30() {
    (return 0) > (return 1)
    return 2
}

func test31() {
    (return 0) <= 1
    return 1
}

func test32() {
    1 <= (return 0)
    return 1
}

func test33() {
    (return 0) <= (return 1)
    return 2
}

func test34() {
    (return 0) >= 1
    return 1
}

func test35() {
    1 >= (return 0)
    return 1
}

func test36() {
    (return 0) >= (return 1)
    return 2
}

func test37() {
    (return 0) == 1
    return 1
}

func test38() {
    1 == (return 0)
    return 1
}

func test39() {
    (return 0) == (return 1)
    return 2
}

func test40() {
    (return 0) != 1
    return 1
}

func test41() {
    1 != (return 0)
    return 1
}

func test42() {
    (return 0) != (return 1)
    return 2
}

func test43() {
    (return 0) is Int64
    return 1
}

func test44() {
    (return 0) as Int64
    return 1
}

func test45() {
    (return 0) & 1
    return 1
}

func test46() {
    1 & (return 0)
    return 1
}

func test47() {
    (return 0) & (return 1)
    return 2
}

func test48() {
    (return 0) | 1
    return 1
}

func test49() {
    1 | (return 0)
    return 1
}

func test50() {
    (return 0) | (return 1)
    return 2
}

func test51() {
    (return 0) ^ 1
    return 1
}

func test52() {
    1 ^ (return 0)
    return 1
}

func test53() {
    (return 0) ^ (return 1)
    return 2
}

func test54() {
    1..2 : (return 0)
    return 1
}

func test55() {
    1..=2 : (return 0)
    return 1
}

main() {
    return test1() + test2() + test3() + test4() + test5() + test6() + test7() + test8()
        + test9() + test10() + test11() + test12() + test13() + test14() + test15()
        + test16() + test17() + test18() + test19() + test20() + test21() + test22()
        + test23() + test24() + test25() + test26() + test27() + test28() + test29()
        + test30() + test31() + test32() + test33() + test34() + test35() + test36()
        + test37() + test38() + test39() + test40() + test41() + test42() + test43()
        + test44() + test45() + test46() + test47() + test48() + test49() + test50()
        + test51() + test52() + test53() + test54() + test55()
}
// ASSERT: scan parse_nl_warning
// ASSERT: scan chir_dce_unreachable
// ASSERT: scan chir_dce_unreachable_expression_hint
