/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

class TestParseFormat {
    public func testTimeParse():Int64 {
        let mylocation = ["America/Managua", "America/Manaus", "America/Marigot", "America/Martinique",
            "America/Matamoros", "America/Mazatlan", "America/Menominee", "America/Merida", "America/Metlakatla",
            "America/Mexico_City", "America/Miquelon", "America/Moncton", "America/Monterrey", "America/Montevideo",
            "America/Montserrat", "America/Nassau", "America/New_York", "America/Nipigon", "America/Nome",
            "America/Noronha", "America/North_Dakota/Beulah", "America/North_Dakota/Center",
            "America/North_Dakota/New_Salem", "America/Nuuk", "America/Ojinaga", "America/Panama", "America/Pangnirtung",
            "America/Paramaribo", "America/Phoenix", "America/Port-au-Prince", "America/Port_of_Spain",
            "America/Porto_Velho", "America/Puerto_Rico", "America/Punta_Arenas", "America/Rainy_River",
            "America/Rankin_Inlet", "America/Recife", "America/Regina", "America/Resolute", "America/Rio_Branco",
            "America/Santarem", "America/Santiago", "America/Santo_Domingo", "America/Sao_Paulo", "America/Scoresbysund",
            "America/Sitka", "America/St_Barthelemy", "America/St_Johns", "America/St_Kitts", "America/St_Lucia",
            "America/St_Thomas", "America/St_Vincent", "America/Swift_Current", "America/Tegucigalpa", "America/Thule",
            "America/Thunder_Bay", "America/Tijuana", "America/Toronto", "America/Tortola", "America/Vancouver",
            "America/Whitehorse", "America/Winnipeg", "America/Yakutat", "America/Yellowknife", "Antarctica/Casey",
            "Antarctica/Davis", "Antarctica/DumontDUrville", "Antarctica/Macquarie", "Antarctica/Mawson",
            "Antarctica/McMurdo", "Antarctica/Palmer", "Antarctica/Rothera", "Antarctica/Syowa", "Antarctica/Troll",
            "Antarctica/Vostok", "Arctic/Longyearbyen"]

        let myoffset = [0, 1 * 60 * 60, 2 * 60 * 60, 3 * 60 * 60, 4 * 60 * 60, 5 * 60 * 60, 6 * 60 * 60, 7 * 60 * 60,
            8 * 60 * 60, 9 * 60 * 60, 10 * 60 * 60, 11 * 60 * 60, 12 * 60 * 60, -1 * 60 * 60, -2 * 60 * 60, -3 * 60 * 60,
            -4 * 60 * 60, -5 * 60 * 60, -6 * 60 * 60, -7 * 60 * 60, -8 * 60 * 60, -9 * 60 * 60, -10 * 60 * 60,
            -11 * 60 * 60]

        for (location in mylocation) {
            for (offset in myoffset) {
                var loc1 = TimeZone(location, Duration.second * offset)
                var loc2 = TimeZone(location, Duration.second * offset)
                assertEqual(loc1.toString(), loc2.toString(),
                    "Comparing the result of init(), the location is ${location}, the offset is ${offset}\n")

                var now = DateTime.now()
                var time1 = now.inTimeZone(loc1)
                var time2 = now.inTimeZone(loc2)
                assertEqual(time1.toString(), time2.toString(),
                    "Comparing the result of init(), the location is ${location}, the offset is ${offset}\n")
            }
        }
        return 0
    }
}

func assertEqual(result: String, expected: String, msg: String): Bool {
    if (result != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${result}\n")
        return true
    }
    return false
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
