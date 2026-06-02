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

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.sort.SortExtension
import std.fs.{File, Path}
import std.unittest.common.*
import stdx.unittest.data.*
import stdx.serialization.serialization.*
import stdx.encoding.json.*

@Test
class Test_csv_parser {
    static func parseCsv(csvBuilder: () -> CsvStrategy<HashMap<String, String>>) {
        csvBuilder().provider(Configuration()).provide() |> collectArrayList
    }

    static func assertEqual(json: JsonArray, csvData: ArrayList<HashMap<String, String>>) {
        @Assert(json.size(), csvData.size)
        let serializedCsv = csvData |> map {it: HashMap<String, String> => it.serialize()} |> collectArrayList
        let jsovFromCsv = DataModelSeq(serializedCsv).toJson()

        @Assert(json.toJsonString(), jsovFromCsv.toJsonString())
    }

    static func assertEqual(jsonFile: String, csvData: ArrayList<HashMap<String, String>>) {
        assertEqual(JsonArray.fromStr(String.fromUtf8(File.readFrom(jsonFile))).asArray(), csvData)
    }

    @TestCase[fileName in [ "empty_lines_lf", "empty_lines_crlf" ], skipEmptyLines in [ false, true ]]
    func emptyLineTest(fileName: String, skipEmptyLines: Bool) {
        let jsonFile = "files/${fileName}.json"
        let csvFile = "files/${fileName}.csv"
        let parseCsv = {=> parseCsv {csv(csvFile, skipEmptyLines: skipEmptyLines)}}

        if (!skipEmptyLines) {
            @AssertThrows[IllegalStateException]({ parseCsv() })
            return
        }

        let csvData = ArrayList<HashMap<String, String>>()
        csvData.add(all: parseCsv())

        assertEqual(jsonFile, csvData)
    }

    @TestCase
    func incorrectColumnsCountTest() {
        let csvFile = "files/incorrect_columns_count.csv"
        @AssertThrows[IllegalStateException]({ parseCsv { csv(csvFile) } })
    }

    @TestCase
    func delimiterTest() {
        let csvSpaceDelimiterFile = "files/simple_delimiter.csv"
        let csvExpectedFile = "files/simple_lf.csv"
        let expected = parseCsv {csv(csvExpectedFile)}
        let actual = parseCsv {csv(csvSpaceDelimiterFile, delimiter: r' ')}
        @Assert(expected, actual)
    }

    @TestCase
    func quoteEscapeTest() {
        let jsonFile = "files/simple_quote_escape.json"
        let csvFile = "files/simple_quote_escape.csv"
        let csv = parseCsv {csv(csvFile, quoteChar: r'`', escapeChar: r'\'')}
        assertEqual(jsonFile, csv)
    }

    @TestCase
    func emptyContentTest() {
        let csvFile = "files/empty.csv"
        let data = parseCsv {csv(csvFile)}
        @Assert(data.isEmpty())
    }

    @TestCase[header in [ None, [ "a", "b", "c" ] ], overrideFirstRowHeader in [ false, true ]]
    func headerTest(header: Option<Array<String>>, overrideFirstRowHeader: Bool) {
        if (header == None && overrideFirstRowHeader) {
            return
        } // unreachable state
        let csvFile = "files/simple_lf.csv"
        let skipRows: Array<UInt64> = if (overrideFirstRowHeader) {
            [0]
        } else {
            []
        }
        let data = parseCsv {csv(csvFile, header: header, skipRows: skipRows)}

        let expected = match ((header, overrideFirstRowHeader)) {
            case (None, _) => ArrayList<HashMap<String, String>>.of(
                HashMap(("n", "1"), ("name", "Alex"), ("age", "21")),
                HashMap(("n", "2"), ("name", "John"), ("age", "28"))
            )
            case (Some(h), true) => ArrayList<HashMap<String, String>>.of(
                HashMap((h[0], "1"), (h[1], "Alex"), (h[2], "21")),
                HashMap((h[0], "2"), (h[1], "John"), (h[2], "28"))
            )
            case (Some(h), false) => ArrayList<HashMap<String, String>>.of(
                HashMap((h[0], "n"), (h[1], "name"), (h[2], "age")),
                HashMap((h[0], "1"), (h[1], "Alex"), (h[2], "21")),
                HashMap((h[0], "2"), (h[1], "John"), (h[2], "28"))
            )
        }

        @Assert(expected, data)
    }
}
