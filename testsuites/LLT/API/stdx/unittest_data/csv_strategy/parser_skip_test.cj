/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args -Woff=all

import std.collection.*
import std.sort.SortExtension
import std.fs.{File, Path}
import stdx.unittest.data.*

@Test
class Test_csv_parser {
    static func parseCsv(csvBuilder: () -> CsvStrategy<HashMap<String, String>>) {
        csvBuilder().provider(Configuration()).provide() |> collectArrayList
    }

    @TestCase[skipRows in [ [ 0 ] ]]
    func skipHeaderRowTest(skipRows: Array<UInt64>) {
        let csvFile = "files/simple_lf.csv"

        let expected = ArrayList<HashMap<String, String>>.of(HashMap([("1", "2"), ("Alex", "John"), ("21", "28")]))

        let parsedCsv = parseCsv {csv(csvFile, skipRows: skipRows)}
        @Assert(expected, parsedCsv)
    }

    @TestCase[skipRows in [ [ 0, 1, 2 ] ]]
    func skipAllRowsTest(skipRows: Array<UInt64>) {
        let csvFile = "files/simple_lf.csv"

        let parsedCsv = parseCsv {csv(csvFile, skipRows: skipRows)}
        @Assert(parsedCsv.isEmpty())
    }

    @TestCase[skipRows in [ [ 1 ], [ 2, 10 ] ]]
    func skipRowsTest(skipRows: Array<UInt64>) {
        skipRows.sortDescending()
        let csvFile = "files/simple_lf.csv"

        let expected = ArrayList.of(
            HashMap<String, String>([("n", "1"), ("name", "Alex"), ("age", "21")]),
            HashMap<String, String>([("n", "2"), ("name", "John"), ("age", "28")])
        )
        skipRows |>
            forEach {
            rowToSkip: UInt64 => if (Int64(rowToSkip - 1) < expected.size) {
                expected.remove(at: Int64(rowToSkip - 1))
            }
        }

        let parsedCsv = parseCsv {csv(csvFile, skipRows: skipRows)}

        @Assert(expected, parsedCsv)
    }

    @TestCase[skipColumns in [ [ 0, 1, 2 ], [ 0 ], [ 1 ], [ 2, 10 ] ]]
    func skipColumnsTest(skipColumns: Array<UInt64>) {
        skipColumns.sortDescending()
        let csvFile = "files/simple_lf.csv"

        let header = ArrayList.of("n", "name", "age")
        skipColumns |>
            forEach {
            columnToSkip: UInt64 => if (Int64(columnToSkip) < header.size) {
                header.remove(at: Int64(columnToSkip))
            }
        }

        let data = parseCsv {csv(csvFile, skipColumns: skipColumns)}

        if (header.isEmpty()) {
            @Assert(data.isEmpty())
            return
        }

        @Assert(2, data.size)
        for (record in data) {
            @Assert(header.size, record.size)
            for (columnName in header) {
                @Assert(record.contains(columnName))
            }
        }
    }
}
