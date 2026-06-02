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

    private static func fixCrlfContent(fileName: String) {
        let content = File.readFrom(fileName)
        let fixedContent = ArrayList(content)

        for (i in fixedContent.size - 2..0 : -1) {
            if (fixedContent[i + 1] == b'\n' && fixedContent[i] != b'\r') {
                fixedContent.add(b'\r', at: i)
            }
        }
        File.writeTo(fileName, fixedContent.toArray())
    }

    private static func fixLfContent(fileName: String) {
        let content = File.readFrom(fileName)
        let fixedContent = ArrayList(content)

        for (i in fixedContent.size - 2..0 : -1) {
            if (fixedContent[i] == b'\r' && fixedContent[i + 1] == b'\n') {
                fixedContent.remove(at: i)
            }
        }
        File.writeTo(fileName, fixedContent.toArray())
    }

    @TestCase[fileName in [ "simple_lf", "simple_crlf", "quoted", "quoted_lf", "quoted_crlf", "quoted_comma", 
 "quoted_quote", "empty_row", "ending_newline" ]]
    func csvJsonTest(fileName: String) {
        let jsonFile = "files/${fileName}.json"
        let csvFile = "files/${fileName}.csv"

        if (fileName.endsWith("crlf")) {
            fixCrlfContent(jsonFile)
            fixCrlfContent(csvFile)
        } else {
            fixLfContent(jsonFile)
            fixLfContent(csvFile)
        }

        let csvData = parseCsv {csv(csvFile, skipEmptyLines: false)}

        assertEqual(jsonFile, csvData)
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
}
