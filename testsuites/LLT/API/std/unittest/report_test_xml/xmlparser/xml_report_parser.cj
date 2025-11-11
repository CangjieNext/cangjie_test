/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package xmlparser

import std.time.*
import std.regex.*
import std.convert.*
import std.collection.*
import std.process.*
import std.io.*
import std.fs.*

public open class XmlTagParser {
    public let tagName: String
    private let storage = HashMap<String, String>()

    private let bodyStart: Int64
    private let bodyEnd: Int64

    public let start: Int64
    public let end: Int64

    public prop body: ?String {
        get() {
            if (bodyStart == bodyEnd) {
                None
            } else {
                data[bodyStart..bodyEnd]
            }
        }
    }

    XmlTagParser(private let data: String) {
        let tagMatcher = Regex("<\\s*(\\w+)").matcher(data)
        let tagMatchData = tagMatcher.find() ?? throw Exception("Tag matching error")
        this.tagName = tagMatchData.matchString(1)

        start = tagMatchData.matchPosition().start
        let openTagEnd = (data[start..].indexOf(b'>') ?? throw Exception(
            "Open tag ending of ${tagName} missed")) + start

        this.bodyStart = openTagEnd + 1
        if (data[openTagEnd - 1] == b'/') {
            bodyEnd = this.bodyStart
            end = openTagEnd
        } else {
            let endTagData = Regex("</\\s*${tagName}\\s*>").matcher(data[bodyStart..]).find()?.matchPosition() ?? throw Exception(
                "Closing tag of ${tagName} missed")

            bodyEnd = endTagData.start + bodyStart
            end = endTagData.end + bodyStart
        }

        let splittedAttrs = Regex("\\s+").matcher(data[(start + 1 + tagName.size)..(openTagEnd)]).split()
        let attrRegex = Regex(#"(\w+)\s*\=\s*"([^"]*)"\s*"#)

        let attrStart = start + 1 + tagName.size
        let attrs = attrRegex.matcher(data[attrStart..openTagEnd]).findAll() ?? Array<MatchData>()
        for (attrData in attrs) {
            let attr = data[(attrStart + attrData.matchPosition().start)..(attrStart + attrData.matchPosition().end)]
            let matched = attrRegex.matcher(attr).find() ?? continue

            let keyPos = matched.matchPosition(1)
            let key = attr[keyPos.start..keyPos.end]

            let value = if (matched.groupNumber() == 2) {
                let valuePos = matched.matchPosition(2)
                attr[valuePos.start..valuePos.end]
            } else {
                ""
            }

            storage[key] = value
        }
    }

    func get(k: String): ?String {
        storage.get(k)
    }

    func parseBody<Entity>(parser: (String) -> Entity): Array<Entity> 
            where Entity <: XmlTagParser {
        let entities = ArrayList<Entity>()
        var shift = 0
        while (shift + start < end) {
            let entityStr = body?[shift..] ?? break
            if (entityStr.isAsciiBlank()) {
                break
            }
            let entity = parser(entityStr)
            entities.add(entity)
            shift += entity.end + 1
        }
        entities.toArray()
    }
}

public class TestSuitesXml <: XmlTagParser {
    public prop name: String {
        get() {
            get("name").getOrThrow()
        }
    }

    public prop tests: Int64 {
        get() {
            get("tests").getOrThrow() |> Int64.parse
        }
    }

    public prop failures: Int64 {
        get() {
            get("failures").getOrThrow() |> Int64.parse
        }
    }

    public prop errors: Int64 {
        get() {
            get("errors").getOrThrow() |> Int64.parse
        }
    }

    public prop skipped: Int64 {
        get() {
            get("skipped").getOrThrow() |> Int64.parse
        }
    }

    public prop time: Float64 {
        get() {
            get("time").getOrThrow() |> Float64.parse
        }
    }

    public prop timestamp: DateTime {
        get() {
            get("timestamp").getOrThrow() |> DateTime.parse
        }
    }

    public prop testsuites: Array<TestSuiteXml> {
        get() {
            parseBody { str => TestSuiteXml(str) }
        }
    }

    TestSuitesXml(suites: String) {
        super(suites)
        if (tagName != "testsuites") {
            throw Exception("Expected testsuites tag name but was ${tagName}")
        }
    }

    public static func readFromFile(path: Path) {
        validateXml(path)
        let suites = File.readFrom(path) |> String.fromUtf8
        TestSuitesXml(suites)
    }
}

public class TestSuiteXml <: XmlTagParser {
    public prop name: String {
        get() {
            get("name").getOrThrow()
        }
    }

    public prop tests: Int64 {
        get() {
            get("tests").getOrThrow() |> Int64.parse
        }
    }

    public prop failures: Int64 {
        get() {
            get("failures").getOrThrow() |> Int64.parse
        }
    }

    public prop errors: Int64 {
        get() {
            get("errors").getOrThrow() |> Int64.parse
        }
    }

    public prop skipped: Int64 {
        get() {
            get("skipped").getOrThrow() |> Int64.parse
        }
    }

    public prop time: Float64 {
        get() {
            get("time").getOrThrow() |> Float64.parse
        }
    }

    public prop timestamp: DateTime {
        get() {
            get("timestamp").getOrThrow() |> DateTime.parse
        }
    }

    public prop testcases: Array<TestCaseXml> {
        get() {
            parseBody { str => TestCaseXml(str) }
        }
    }

    TestSuiteXml(suite: String) {
        super(suite)
        if (tagName != "testsuite") {
            throw Exception("Expected testuite tag name but was ${tagName}")
        }
        if (testcases.size != tests) {
            println(suite)
            throw Exception("${name}: attributed tests (${tests}) != parsed testcases (${testcases.size})")
        }
    }

    public static func readFromFile(filepath: Path) {
        validateXml(filepath)
        let suite = File.readFrom(filepath) |> String.fromUtf8
        TestSuiteXml(suite)
    }
}

public class TestCaseXml <: XmlTagParser {
    public prop name: String {
        get() {
            get("name").getOrThrow()
        }
    }

    public prop classname: String {
        get() {
            get("classname").getOrThrow()
        }
    }

    public prop assertions: Int64 {
        get() {
            get("assertions").getOrThrow() |> Int64.parse
        }
    }

    public prop time: Float64 {
        get() {
            get("time").getOrThrow() |> Float64.parse
        }
    }

    public prop isPassed: Bool {
        get() {
            body.isNone()
        }
    }

    public prop data: TestCaseData {
        get() {
            TestCaseData(body)
        }
    }

    TestCaseXml(testcase: String) {
        super(testcase)
        if (tagName != "testcase") {
            throw Exception("Expected testcase tag name but was ${tagName}")
        }
    }
}

public class TestCaseData {
    private var _isPassed: Bool = false
    private var _isFailed: Bool = false
    private var _isError: Bool = false
    private var _isSkipped: Bool = false

    private var _message: ?String = None
    private var _body: ?String = None

    public prop isPassed: Bool {
        get() {
            _isPassed
        }
    }

    public prop isFailed: Bool {
        get() {
            _isFailed
        }
    }

    public prop isError: Bool {
        get() {
            _isError
        }
    }

    public prop isSkipped: Bool {
        get() {
            _isSkipped
        }
    }

    public prop message: ?String {
        get() {
            _message
        }
    }

    public prop body: ?String {
        get() {
            _body
        }
    }

    public TestCaseData(data: ?String) {
        match (data) {
            case None => _isPassed = true
            case Some(d) =>
                let dataParser = XmlTagParser(d)
                _body = dataParser.body
                _message = dataParser.get("message")
                match (dataParser.tagName) {
                    case "failure" => _isFailed = true
                    case "error" => _isError = true
                    case "skipped" => _isSkipped = true
                    case unknown => throw Exception("Unexpected status: ${unknown}")
                }
        }

        var singleStatusCheck = false
        if (isPassed) {
            singleStatusCheck = true
        }

        if (isFailed) {
            if (singleStatusCheck) {
                throw IllegalStateException()
            }
            singleStatusCheck = true
        }

        if (isError) {
            if (singleStatusCheck) {
                throw IllegalStateException()
            }
            singleStatusCheck = true
        }

        if (isSkipped) {
            if (singleStatusCheck) {
                throw IllegalStateException()
            }
            singleStatusCheck = true
        }
    }
}


public func validateXml(filepath: Path): Unit { 
    let timeout = Duration.second * 3

    // This line expects testcases being called from the parent directory
    let scriptpath = Process.current.workingDirectory.join("xmlparser/parse_xml_file.py")

    let subprocess = launch("python", [scriptpath.toString(), filepath.toString()])
    let returnCode = subprocess.wait(timeout: timeout)
    if (returnCode != 0) {
        let stderr = StringReader(subprocess.stdErrPipe).readToEnd()
        throw Exception(stderr)
    }
}

main() {}