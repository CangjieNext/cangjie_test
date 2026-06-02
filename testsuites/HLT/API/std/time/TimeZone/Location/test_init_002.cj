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
        let mylocation = ["America/Adak", "America/Anchorage", "America/Anguilla", "America/Antigua",
            "America/Araguaina", "America/Argentina/Buenos_Aires", "America/Argentina/Catamarca",
            "America/Argentina/Cordoba", "America/Argentina/Jujuy", "America/Argentina/La_Rioja",
            "America/Argentina/Mendoza", "America/Argentina/Rio_Gallegos", "America/Argentina/Salta",
            "America/Argentina/San_Juan", "America/Argentina/San_Luis", "America/Argentina/Tucuman",
            "America/Argentina/Ushuaia", "America/Aruba", "America/Asuncion", "America/Atikokan", "America/Bahia",
            "America/Bahia_Banderas", "America/Barbados", "America/Belem", "America/Belize", "America/Blanc-Sablon",
            "America/Boa_Vista", "America/Bogota", "America/Boise", "America/Cambridge_Bay", "America/Campo_Grande",
            "America/Cancun", "America/Caracas", "America/Cayenne", "America/Cayman", "America/Chicago",
            "America/Chihuahua", "America/Costa_Rica", "America/Creston", "America/Cuiaba", "America/Curacao",
            "America/Danmarkshavn", "America/Dawson", "America/Dawson_Creek", "America/Denver", "America/Detroit",
            "America/Dominica", "America/Edmonton", "America/Eirunepe", "America/El_Salvador", "America/Fort_Nelson",
            "America/Fortaleza", "America/Glace_Bay", "America/Goose_Bay", "America/Grand_Turk", "America/Grenada",
            "America/Guadeloupe", "America/Guatemala", "America/Guayaquil", "America/Guyana", "America/Halifax",
            "America/Havana", "America/Hermosillo", "America/Indiana/Indianapolis", "America/Indiana/Knox",
            "America/Indiana/Marengo", "America/Indiana/Petersburg", "America/Indiana/Tell_City",
            "America/Indiana/Vevay", "America/Indiana/Vincennes", "America/Indiana/Winamac", "America/Inuvik",
            "America/Iqaluit", "America/Jamaica", "America/Juneau", "America/Kentucky/Louisville",
            "America/Kentucky/Monticello", "America/Kralendijk", "America/La_Paz", "America/Lima", "America/Los_Angeles",
            "America/Lower_Princes", "America/Maceio"]

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
