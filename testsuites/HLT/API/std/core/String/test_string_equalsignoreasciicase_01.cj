/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

@Test
class Test_string_equalsignoreasciicase_01 {
    @TestCase
    func test_equalsignoreasciicase_01(): Unit {
        let str1 = ""
        let str2 = "abc12343udwj"
        let str3 = str1.trimStart(r'a')
        let str4 = str2.trimStart(r'a')
        let str5 = str1.trimEnd([r'j', r'd'])
        let str6 = str2.trimEnd(r'j', r'd')
        @Expect(str3, "")
        @Expect(str4, "bc12343udwj")
        @Expect(str5,"")
        @Expect(str6, "abc12343udw")
        @Expect(str3.equalsIgnoreAsciiCase(str4), false)
        @Expect(str5.equalsIgnoreAsciiCase(str6), false)
    }

    @TestCase
    func test_equalsignoreasciicase_02(): Unit {
        let str1 = "123456723093487543"
        let str2 = "\0123456723093487543\0"
        let str3 = str1.trimStart(r'\\')
        let str4 = str2.trimEnd(r'0')
        let str5 = str2.trimStart(r'\\')
        let str6 = str1.trimEnd(r'3')
        @Expect(str2, "\0123456723093487543\0")
        @Expect(str3, "123456723093487543")
        @Expect(str4, "\0123456723093487543\0")
        @Expect(str5, "\0123456723093487543\0")
        @Expect(str6, "12345672309348754")
        @Expect(str3.equalsIgnoreAsciiCase(str4), false)
        @Expect(str5.equalsIgnoreAsciiCase(str6), false)
    }

    @TestCase
    func test_equalsignoreasciicase_03(): Unit {
        let str1 = "仓仓仓仓颉鸿"
        let str2 = "颉鸿蒙蒙蒙蒙"
        let str3 = str1.trimStart(r'仓')
        let str4 = str2.trimEnd(r'蒙')
        @Expect(str3, "颉鸿")
        @Expect(str4, "颉鸿")
        @Expect(str3.equalsIgnoreAsciiCase(str4), true)
    }

    @TestCase
    func test_equalsignoreasciicase_04(): Unit {
        let str1 = "@@@@@@@#$%^&)^%^&(^(*^_^()))"
        let str2 = "#$%^&)^%^&(^(*^_^()))>>>>>>>>>"
        let str3 = str1.trimStart(r'@')
        let str4 = str2.trimEnd(r'>')
        @Expect(str3, "#$%^&)^%^&(^(*^_^()))")
        @Expect(str4, "#$%^&)^%^&(^(*^_^()))")
        @Expect(str3.equalsIgnoreAsciiCase(str4), true)
    }

    @TestCase
    func test_equalsignoreasciicase_05(): Unit {
        let str1 = "FFFFFAAAAAbbbbbbbCCCCCCDDDDDDDeeeeeee"
        let str2 = "aaaaabbbbbbbCCCCCCDDDDDDDEEEEEEEgggggggg"
        let str3 = str1.trimStart(r'F')
        let str4 = str2.trimEnd(r'g')
        @Expect(str3, "AAAAAbbbbbbbCCCCCCDDDDDDDeeeeeee")
        @Expect(str4, "aaaaabbbbbbbCCCCCCDDDDDDDEEEEEEE")
        @Expect(str3.equalsIgnoreAsciiCase(str4), true)
    }

    @TestCase
    func test_equalsignoreasciicase_06(): Unit {
        let str1 = StringBuilder(r'a', 1000).toString()
        let str2 = StringBuilder(r'A', 1000).toString()
        let str3 = str1.trimStart(r'C')
        let str4 = str2.trimEnd(r'D')
        @Expect(str3.equalsIgnoreAsciiCase(str4), true)
    }
}
