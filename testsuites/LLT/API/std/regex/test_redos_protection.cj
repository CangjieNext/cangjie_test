/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC:  %run %run_opt %output %run_utest_opt

import std.regex.*

@Test
public class ReDoSProtectionTest {
    @TestCase
    func maliciousPatternRejected(): Unit {
        let regex = Regex("(a+)+$")
        let input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaX"
        
        var exceptionCaught = false
        try {
            let result = regex.matches(input)
        } catch (e: RegexException) {
            exceptionCaught = true
        }
        
        @Expect(exceptionCaught == true)
    }
    
    @TestCase
    func normalPatternNotAffected(): Unit {
        let regex = Regex("\\d+")
        let input = "1234567890"
        
        @Expect(regex.matches(input) == true)
    }
    
    @TestCase
    func complexPatternWithinLimits(): Unit {
        let regex = Regex("(a|b|c)+")
        let input = "abcabcabc"
        
        let result = regex.matches(input)
        
        @Expect(result == true)
    }
    
    @TestCase
    func findAllWithMaliciousPattern(): Unit {
        let regex = Regex("(a+)+$")
        let input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaX"

        var exceptionCaught = false
        try {
            let result = regex.findAll(input)
        } catch (e: RegexException) {
            exceptionCaught = true
        }

        @Expect(exceptionCaught == true)
    }

    @TestCase
    func allCountWithMaliciousPattern(): Unit {
        let regex = Regex("(a+)+$")
        let input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaX"

        var exceptionCaught = false
        try {
            let matcher = regex.matcher(input)
            let result = matcher.allCount()
        } catch (e: RegexException) {
            exceptionCaught = true
        }

        @Expect(exceptionCaught == true)
    }
}