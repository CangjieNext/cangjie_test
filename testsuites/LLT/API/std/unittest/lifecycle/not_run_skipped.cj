/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color --filter=-FilteredOut --exclude-tags=Tag | compare %f
// ASSERT: scan-4 Godel
// ASSERT: scan-1 Ramanujan
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 1
// ASSERT: scan-1 SKIPPED: 3

@Test
class FilteredOut {
    @BeforeAll
    @BeforeEach
    @AfterEach
    @AfterAll
    func a() {
        @Fail("Should not run")
    }

    @TestCase
    func casev() {
        @Fail("Should not run")
    }
}

@Test
@Skip
class Skipped {
    @BeforeAll
    @BeforeEach
    @AfterEach
    @AfterAll
    func a() {
        @Fail("Should not run")
    }

    @TestCase
    func casev() {
        @Fail("Should not run")
    }
}

@Test
@Tag[Tag]
class ExcludeTagged {
    @BeforeAll
    @BeforeEach
    @AfterEach
    @AfterAll
    func a() {
        @Fail("Should not run")
    }

    @TestCase
    func casev() {
        @Fail("Should not run")
    }
}

@Test
class Normal {
    @BeforeAll
    @BeforeEach
    @AfterEach
    @AfterAll
    func a() {
        println("Godel")
    }

    @TestCase
    func caseq() {
        println("Ramanujan")
    }
}
