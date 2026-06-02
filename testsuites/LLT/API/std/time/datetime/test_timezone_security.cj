/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_datetime_pub.cj
// EXEC: %compiler %cmp_opt %f test_datetime_pub.cj %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args

import std.time.*

@Test
public class TimezoneSecurityTest {
    @TestCase
    func loadValidTimezoneFile(): Unit {
        // Test that valid timezone files can be loaded
        let tz1 = TimeZone.load("America/New_York")
        @Expect(tz1.id, "America/New_York")
        
        let tz2 = TimeZone.load("Europe/London")
        @Expect(tz2.id, "Europe/London")
        
        let tz3 = TimeZone.load("Asia/Shanghai")
        @Expect(tz3.id, "Asia/Shanghai")
        
        let tz4 = TimeZone.load("Pacific/Honolulu")
        @Expect(tz4.id, "Pacific/Honolulu")
    }

    @TestCase
    func loadNonExistentTimezone(): Unit {
        // Test that loading non-existent timezone throws exception
        try {
            let _ = TimeZone.load("Non/Existent")
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }
    }

    @TestCase
    func loadTimezoneFromInvalidPath(): Unit {
        // Test that loading timezone from invalid path throws exception
        try {
            let _ = TimeZone.loadFromPaths("NonExistent", ["/non/existent/path"])
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }
    }

    @TestCase
    func loadTimezoneWithEmptyName(): Unit {
        // Test that loading timezone with empty name throws exception
        try {
            let _ = TimeZone.load("")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone id.")
        }
    }

    @TestCase
    func loadTimezoneWithTooLongName(): Unit {
        // Test that loading timezone with too long name throws exception
        let longName = "A" * 5000
        try {
            let _ = TimeZone.load(longName)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone id.")
        }
    }
}
