/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --ip=0.0.0.0 --port=8080

import std.process.*
import std.argopt.*
import std.collection.*

@UnittestOption[String](ip)

@UnittestOption[Int64](port)
/*
 * Test description: Test the funcs for ArgOpt
 * Test class:
 * public class ArgOpt
 */
@Test
class ArgOptTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message.contains(expectMessage)) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }
    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(shortArgFormat: String)
     */
    @TestCase
    func testInitShortArgFormat(): Unit {
        ArgOpt("a")
        ArgOpt("ab:c:d:k:u:x")
        @Expect(true)
    }
    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(shortArgFormat: String)
     */
    @TestCase
    func testInvalidInitShortArgFormat(): Unit {
        var exception: ?Exception = None
        try {
            ArgOpt("2")
        } catch (e: IllegalArgumentException) {
            exception = Some(e)
        }
        anomalyAssert("testInvalidInitShortArgFormat", exception, "Invalid string, please check the parameter: 2\n")
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(longArgList: Array<String>)
     */
    @TestCase
    func testInitLongArgList(): Unit {
        ArgOpt(["", "testing", "condition=", "output-file="]);
        ArgOpt(Array<String>());
        @Expect(true)
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(longArgList: Array<String>)
     */
    @TestCase
    func testInvalidInitLongArgList(): Unit {
        var caseException01: ?Exception = None
        try {
            ArgOpt(["123abc"]);
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidInitLongArgList_01",
            caseException01,
            "Invalid string, please check the parameter: 123abc\n"
        )

        var caseException02: ?Exception = None
        try {
            ArgOpt(["=="]);
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidInitLongArgList_02",
            caseException02,
            "Invalid string, please check the parameter: ==\n"
        )
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(shortArgFormat: String, longArgList: Array<String>)
     */
    @TestCase
    func testInitShortArgFormatAndLongArgList(): Unit {
        ArgOpt("a:b:c:d:e", ["condition=", "output-file=", "testing", "testing"]);
        @Expect(true)
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(shortArgFormat: String, longArgList: Array<String>)
     */
    @TestCase
    func testInValidInitShortArgFormatAndLongArgList(): Unit {
        var caseException: ?Exception = None
        try {
            ArgOpt("!", Array<String>())
        } catch (e: IllegalArgumentException) {
            caseException = e
        }
        anomalyAssert(
            "testInValidInitShortArgFormatAndLongArgList",
            caseException,
            "Invalid string, please check the parameter: !\n"
        )
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(args: Array<String>, shortArgFormat: String, longArgList: Array<String>)
     */
    @TestCase
    func testInitArgsShortArgFormatAndLongArgList(): Unit {
        var longList = [
            "-a123",
            "-bofo",
            "-cfoo",
            "-d789",
            "bar",
            "--condition=foo",
            "--testing=456",
            "--output-file",
            "--abc.def",
            "-p",
            "-k123",
            "bbb",
            "a1",
            "a2"
        ];
        var arr = ["condition=", "output-file=", "testing", "testing"]
        var str = "a:b:c:d:e"
        ArgOpt(arr, str, longList);
        @Expect(true)
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public init(shortArgFormat: String, longArgList: Array<String>)
     */
    @TestCase
    func testInvalidInitArgsShortArgFormatAndLongArgList(): Unit {
        var caseException: ?Exception = None
        try {
            let args: Array<String> = ["-a1", "--condition=foo"]
            let shortArgFormat = "a:b:c"
            let longArgs: Array<String> = ["??condition="]
            ArgOpt(args, shortArgFormat, longArgs)
        } catch (e: IllegalArgumentException) {
            caseException = e
        }
        anomalyAssert(
            "testInvalidInitArgsShortArgFormatAndLongArgList",
            caseException,
            "Invalid string, please check the parameter: ??condition=\n"
        )
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public func getArg(arg: String): Option<String>
     */
    @TestCase
    func testGetArg(): Unit {
        @Expect(ArgOpt("a").getArg("-a"),None)

        @Expect(ArgOpt("ab").getArg("-b"),None)
        @Expect(ArgOpt("ab:::").getArg("-"),None)

        @Expect(ArgOpt("ab:").getArg("-c"),None)

        @Expect(ArgOpt("ab:").getArg(""),None)

        @Expect(ArgOpt(["-o"], "o:", []).getArg("-o"),None)
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public func getArg(arg: String): Option<String>
     */
    @TestCase
    func testInValidGetArg(): Unit {
        var caseException: ?Exception = None

        try {
            ArgOpt("ab:-~").getArg("-b")
        } catch (e: IllegalArgumentException) {
            caseException = e
        }
        anomalyAssert("testInValidGetArg", caseException, "Invalid string, please check the parameter: ab:-~\n")
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public func getUnparseArgs(): Array<String>
     */
    @TestCase
    func testGetUnparseArgs(): Unit {
        var a = [
            "-a123",
            "-bofo",
            "-cfoo",
            "-d789",
            "bar",
            "--condition=foo",
            "--testing=456",
            "--output-file",
            "--abc.def",
            "-p",
            "-k123",
            "bbb",
            "a1",
            "a2"
        ];
        var lof = ["condition=", "output-file=", "testing", "testing"];
        var str = "ab:c:d:k:u:x";
        var ao = ArgOpt(a, str, lof);
        a = ao.getUnparseArgs()
        var expectList = ["-a123", "bar", "--testing=456", "-p", "bbb", "a1", "a2"]
        @Expect(a,expectList)

        var longStr = ["a", "-b", "--a", "bar", "--cond=foo", "--out-file", "--abc.def"];
        str = "ab:c:d:k:u:x"
        @Expect(ArgOpt(str,longStr).getUnparseArgs(),Array<String>())

        @Expect(ArgOpt(["-o"], "o:", []).getUnparseArgs(),["-o"])
        @Expect(ArgOpt(["-a1", "--condition"], "a:b:c", ["condition="]).getUnparseArgs(),["--condition"])
        @Expect(ArgOpt(["-a", "arg1", "-b", "arg2", "-c", "arg3"], "a:b:cd", []).getUnparseArgs(),["arg3"])
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test API:
     * public func getArgumentsMap(): HashMap<String, String>
     */
    @TestCase
    func testGetArgumentsMap(): Unit {
        var ao01 = ArgOpt(
            [
                "-a123",
                "-bofo",
                "-cfoo",
                "-d789",
                "bar",
                "--condition=foo",
                "--testing=456",
                "--output-file",
                "--abc.def",
                "-p",
                "-k123",
                "bbb",
                "a1",
                "a2"
            ],
            "a:b:c:d:e",
            ["condition=", "output-file=", "testing", "testing"]
        )
        var map01 = ao01.getArgumentsMap()
        @Expect(map01.get("--condition"),Some("foo"))

        var ao02 = ArgOpt(
            [
                "-a123",
                "-bofo",
                "-cfoo",
                "-d789",
                "bar",
                "--condition=foo",
                "--testing=456",
                "--output-file",
                "abc.def",
                "-p",
                "-k123",
                "bbb",
                "a1",
                "a2"
            ],
            "a:b:c:d:e",
            ["condition=", "output-file=", "testing", "testing"]
        )
        var map02 = ao02.getArgumentsMap()
        @Expect(map02.get("condition"),None)

        let map03 = ArgOpt(["-a", "arg1", "-b", "arg2", "-c", "arg3"], "a:b:cd", []).getArgumentsMap()
        @Expect(map03.get("-a"),"arg1")
        @Expect(map03.get("-c"),"")
        @Expect(map03.get("-b"),"arg2")
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test index verification
     */
    @TestCase
    func testArgsIndexVerification(): Unit {
        var parser01 = ArgOpt(["--arg1", "bar", "--arg2", "--arg3=2"], "", ["arg1=", "arg2=", "arg4="])

        @Expect(parser01.getArg("--arg1"),Some("bar"))
        @Expect(parser01.getArg("--arg2"),Some("--arg3=2"))
        @Expect(parser01.getArg("--arg3"),None)
        @Expect(parser01.getUnparseArgs().size,0)
        var argsMap = parser01.getArgumentsMap()
        @Expect(argsMap.get("--arg1"),"bar")
        @Expect(argsMap.get("--arg2"),"--arg3=2")
        @Expect(argsMap.get("--arg3"),None)
        @Expect(argsMap.get("--arg4"),None)

        var parser02 = ArgOpt(["-"], "a:", [])
        @Expect(parser02.getArg("-a"),None)

        var parser03 = ArgOpt(["--arg1=long", "ashort", "--arg2", "long", "b2"], "a:b:", [""])
        @Expect(parser03.getArg("--arg1"),None)
        @Expect(parser03.getArg("--arg2"),None)
        @Expect(parser03.getArg("a"),None)
        @Expect(parser03.getArg("b"),None)
        @Expect(parser03.getArgumentsMap().toString(),"[]")
        @Expect(parser03.getUnparseArgs(),["--arg1=long", "ashort", "--arg2", "long", "b2"])
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test analysis of pointSymbols
     */
    @TestCase
    func testAnalysisOfPointSymbols(): Unit {
        let args = Process.current.arguments
        let parsedArgs = ArgOpt(args.toArray(), "", ["ip=", "port="])
        @Expect(parsedArgs.getArgumentsMap().get("--ip"),Some("0.0.0.0"))
    }

    /*
     * Test description: Test argOpt ::ArgOpt
     * Test The params contains special symbols
     */
    @TestCase
    func testTheParamsContainsSpecialSymbols(): Unit {
        @Expect(paramsContainsSpecialSymbols(["--url=\'https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'"],"",["url="],"--url",["\'https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'"]))
        @Expect(paramsContainsSpecialSymbols(["--url=https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\""],"",["url="],"--url",["https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\""]))
        @Expect(paramsContainsSpecialSymbols(["--url=https://login.example.com/login/?@!"],"",["url="],"--url",["https://login.example.com/login/?@!"]))
        @Expect(paramsContainsSpecialSymbols(["--url=https://login.example.com/login/?#$%^*()_+=-[]=;{}?.,<>;:"],"",["url="],"--url",["https://login.example.com/login/?#$%^*()_+=-[]=;{}?.,<>;:"]))
        @Expect(paramsContainsSpecialSymbols(["--url=https://login.example.com/login/?#$%^*()_+=-[]={}?.,"],"",["url="],"--url",["https://login.example.com/login/?#$%^*()_+=-[]={}?.,"]))
        @Expect(paramsContainsSpecialSymbols(["--url=https://login.example.com/login/?#$%^*()_+=-[]={}?.,<k>:"],"",["url="],"--url",["https://login.example.com/login/?#$%^*()_+=-[]={}?.,<k>:"]))
    }

    func paramsContainsSpecialSymbols(
        args: Array<String>,
        shortArgFormat: String,
        longArgList: Array<String>,
        arg: String,
        expectValues: Array<String>
    ): Bool {
        let parsedArgs = ArgOpt(args, shortArgFormat, longArgList)
        var url = parsedArgs.getArg(arg).getOrThrow()
        // Unresolved
        var allnot = parsedArgs.getUnparseArgs()
        if (allnot.size != 0) {
            println("allnot.size=" + allnot.size.toString())
            return false
        }
        //Parsed hashset
        var allmap = parsedArgs.getArgumentsMap()
        var keys = allmap.keys()
        var expect_keys = HashSet<String>([arg])
        for (i in keys) {
            for (j in expect_keys) {
                if (!(expect_keys.contains(i) && keys.contains(j))) {
                    println("keys is" + keys.toArray().toString())
                    return false
                }
            }
        }
        var values = allmap.values()
        var act_values = HashSet<String>(values)
        var expect_values = HashSet<String>(expectValues)
        if (!(act_values.contains(all: expect_values) && expect_values.contains(all: act_values))) {
            println(act_values)
            println(expect_values)
            return false
        }
        return true
    }
}

@Test
public class TestArgParser {
    let argSpecs = [
        Short(r'a', NoValue) {_ => println("Got a")},
        Short(r'b', OptionalValue) {v => println("Got b: `${v}`")},
        Short(r'c', RequiredValue) {v => println("Got c: `${v}`")},
        Long("test1", NoValue) {_ => println("Got test1")},
        Long("test2", OptionalValue) {v => println("Got test2: `${v}`")},
        Long("test3", RequiredValue) {v => println("Got test3: `${v}`")},
        Full("test4", r'd', NoValue) {_ => println("Got test4")},
        NonOptions {v => println("Got NonOptions: ${v}")}
    ]
    
    var callbackExecutionOrder = ArrayList<String>()
    var callbackExecuted = false
    var callbackNonOptions: ?Array<String> = None
    var callbackShortKey: ?String = None
    var callbackLongKey: ?String = None
    var fullSpecExecuted = ArrayList<String>()
    
    func printArguments(arguments: ParsedArguments) {
        let options: HashMap<String, String> = HashMap<String, String>(arguments.options)
        let nonOptions = arguments.nonOptions
        println("Options:")
        for ((k, v) in options) {
            println("  key: ${k}, val: ${if (v.size != 0) { v } else { Option<String>.None }}")
        }
        println("NonOptions:")
        for (val in nonOptions) {
            println("  ${val}")
        }
        println("")
    }

    @TestCase
    func test_input(): Unit {
        let prefix = "Got"
        let argSpecs = [
            Long("ip", RequiredValue) {v => println("${prefix} ip: ${v}")},
            Long("port", RequiredValue) {v => println("${prefix} port: ${v}")},
            Long("no-progress", OptionalValue)
        ]
        println("Current arguments: ${Process.current.arguments}")
        let arguments = parseArguments(Process.current.arguments, argSpecs)
        @Expect(arguments.options.get("ip"), "0.0.0.0")
        @Expect(arguments.options.get("port"), "8080")
    }

    @TestCase
    func test_parse_normal(): Unit {
        // required value
        let args1 = ["-c", "cval", "--test3", "t3val"]
        let arguments1 = parseArguments(args1, argSpecs)
        @Expect(arguments1.options.size, 2)
        @Expect(arguments1.options["c"] == "cval")
        @Expect(arguments1.options["test3"] == "t3val")

        let args2 = ["-ccval", "--test3=t3val"]
        let arguments2 = parseArguments(args2, argSpecs)
        @Expect(arguments2.options.size, 2)
        @Expect(arguments2.options["c"] == "cval")
        @Expect(arguments2.options["test3"] == "t3val")

        // optional value
        let args3 = ["-b", "--test2"]
        let arguments3 = parseArguments(args3, argSpecs)
        @Expect(arguments3.options.size, 2)
        @Expect(arguments3.options["b"] == "")
        @Expect(arguments3.options["test2"] == "")

        let args4 = ["-bbval", "--test2=t2val"]
        let arguments4 = parseArguments(args4, argSpecs)
        @Expect(arguments4.options.size, 2)
        @Expect(arguments4.options["b"] == "bval")
        @Expect(arguments4.options["test2"] == "t2val")

        // noValue
        var args5 = ["-a", "--test1"]
        var arguments5 = parseArguments(args5, argSpecs)
        @Expect(arguments5.options.size, 2)
        @Expect(arguments5.options["a"].size, 0)
        @Expect(arguments5.options["test1"].size, 0)

        args5 = ["-a", "noOption"]
        arguments5 = parseArguments(args5, argSpecs)
        @Expect(arguments5.options.size, 1)
        @Expect(arguments5.options["a"].size, 0)
        @Expect(arguments5.nonOptions, ["noOption"])

        // nonOption
        let args6 = ["--", "nonOption1", "nonOption2"]
        let arguments6 = parseArguments(args6, argSpecs)
        @Expect(arguments6.nonOptions.size, 2)
        @Expect(arguments6.nonOptions[0], "nonOption1")
        @Expect(arguments6.nonOptions[1], "nonOption2")

        // mixed
        let args7 = ["foo", "--test1", "-b", "bbval", "--test2=t2val", "-c", "cval", "nonOption1", "--", "nonOption2",
            "--", "nonOption3"]
        let arguments = parseArguments(args7, argSpecs)
        @Expect(arguments.nonOptions, ["foo", "bbval", "nonOption1", "nonOption2", "--", "nonOption3"])
        @Expect(arguments.options.get("test1"), "")
        @Expect(arguments.options.get("b"), "")
        @Expect(arguments.options.get("test2"), Some("t2val"))
        @Expect(arguments.options.get("c"), Some("cval"))
    }

    @TestCase
    func test_parse_required_value_without_val(): Unit {
        println("test_parse_required_value_without_val")
        let args1 = ["-c"]
        try {
            parseArguments(args1, argSpecs)
            @Assert(false)
        } catch (e: ArgumentParseException) {
            @Expect(e.message.contains('Missing option value'))
        }

        let args2 = ["--test3"]
        try {
            parseArguments(args2, argSpecs)
            @Assert(false)
        } catch (e: ArgumentParseException) {
            @Expect(e.message.contains('Missing option value'))
        }
    }

    @TestCase
    func test_parse_wrong_optional_value_format(): Unit {
        println("test_parse_wrong_optional_value_format")
        let args1 = ["-b", "bval"]
        try {
            let argument = parseArguments(args1, argSpecs)
            @Expect(argument.options.size, 1)
            @Expect(argument.options.get('b'), '')
            @Expect(argument.nonOptions, ['bval'])
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        let args2 = ["--test2", "t2val"]
        try {
            let arguments = parseArguments(args2, argSpecs)
            @Expect(arguments.nonOptions, ["t2val"])
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func test_parse_wrong_novalue_format(): Unit {
        println("test_parse_wrong_novalue_format")
        var args1 = ["-a123"]
        try {
            parseArguments(args1, argSpecs)
            @Assert(false)
        } catch (e: ArgumentParseException) {
            @Expect(e.message.contains('Unknown option'))
        }

        args1 = ["-a", "123"]
        try {
            let argument = parseArguments(args1, argSpecs)
            @Expect(argument.nonOptions == ['123'])
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        var args2 = ["--test1=123"]
        try {
            parseArguments(args2, argSpecs)
            @Assert(false)
        } catch (e: ArgumentParseException) {
            @Expect(e.message.contains('Unexcepted value'))
        }

        args2 = ["--test1", "123"]
        try {
            let argument = parseArguments(args2, argSpecs)
            @Expect(argument.nonOptions == ['123'])
            @Expect(argument.options.get("test1"), "")
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }
    }
    @TestCase
    func test_parse_combined_short_options(): Unit {
        let argSpecs = [
            Short(r'a', NoValue) {_ => println("Got a")},
            Short(r'b', NoValue) {_ => println("Got b")},
            Short(r'c', NoValue) {_ => println("Got c")},
            Short(r'd', OptionalValue) {v => println("Got d: `${v}`")},
            Short(r'e', OptionalValue) {v => println("Got e: `${v}`")},
            Short(r'f', OptionalValue) {v => println("Got f: `${v}`")},
            Short(r'g', RequiredValue) {v => println("Got g: `${v}`")},
            Short(r'h', RequiredValue) {v => println("Got h: `${v}`")},
            Short(r'i', RequiredValue) {v => println("Got i: `${v}`")}
        ]
        var args1 = ["-abcd"]
        try {
            parseArguments(args1, argSpecs) // novalue+optiontalValue(novalue)
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        try {
            args1 = ["-abcz"]
            parseArguments(args1, argSpecs) // `z` not exist
        } catch (e: ArgumentParseException) {
            @Expect(e.message.contains('Unknown option'))
        }

        try {
            args1 = ["-abcddval"] // last rune is a optinal option and value exist
            parseArguments(args1, argSpecs)
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        try {
            args1 = ["-abcdefg=gval"]
            let arguments = parseArguments(args1, argSpecs)
            @Expect(arguments.options.get("d"), "efg=gval")
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        args1 = ["-abcg=gval"]
        var arguments = parseArguments(args1, argSpecs)
        @Expect(arguments.options.get("g"), "=gval")
        args1 = ["-abg=gval", "-c"]
        parseArguments(args1, argSpecs)

        args1 = ["-abcg", "gval"]
        parseArguments(args1, argSpecs)

        args1 = ["-abg", "gval", "-c"]
        parseArguments(args1, argSpecs)
    }

    @TestCase
    func test_parse_duplicated_option(): Unit {
        var argSpecs = [
            Short(r'a', NoValue) {_ => println("Got a")},
            Short(r'a', NoValue) {_ => println("Got another a")},
            Short(r'b', NoValue) {_ => println("Got b")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }
        argSpecs = [
            Short(r'd', OptionalValue) {v => println("Got d: `${v}`")},
            Short(r'd', OptionalValue) {v => println("Got another d: `${v}`")},
            Short(r'e', OptionalValue) {v => println("Got e: `${v}`")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }
        argSpecs = [
            Short(r'g', RequiredValue) {v => println("Got g: `${v}`")},
            Short(r'g', RequiredValue) {v => println("Got another g: `${v}`")},
            Short(r'h', RequiredValue) {v => println("Got h: `${v}`")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }

        argSpecs = [
            Long("test1", NoValue) {_ => println("Got test1")},
            Long("test1", NoValue) {_ => println("Got another test1")},
            Long("test2", NoValue) {_ => println("Got test2")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }

        argSpecs = [
            Long("test1", OptionalValue) {_ => println("Got test1")},
            Long("test1", OptionalValue) {_ => println("Got another test1")},
            Long("test2", OptionalValue) {_ => println("Got test2")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }

        argSpecs = [
            Long("test1", RequiredValue) {_ => println("Got test1")},
            Long("test1", RequiredValue) {_ => println("Got another test1")},
            Long("test2", RequiredValue) {_ => println("Got test2")}
        ]
        try {
            parseArguments([], argSpecs)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains('Duplicated option'))
        }
    }

    @TestCase
    func test_not_ascii_letter(): Unit {
        var argSpecs = [Short(r'测', NoValue)]
        try {
            parseArguments(["-测"], argSpecs)
        } catch (e: IllegalArgumentException) {
            @Assert(false)
        }
        argSpecs = [Long('测试', NoValue)]
        try {
            let arguments = parseArguments(["--测试"], argSpecs)
            @Expect(arguments.options.get("测试").isSome())
        } catch (e: IllegalArgumentException) {
            @Assert(false)
        }
        argSpecs = [Full("测试", r'测', NoValue)]
        try {
            parseArguments([], argSpecs)
        } catch (e: IllegalArgumentException) {
            @Assert(false)
        }
    }
    @TestCase
    func testTheParamsContainsSpecialSymbols(): Unit {
        var argSpecs = [Long("url", RequiredValue)]
        var arguments = parseArguments(
            ["--url=\'https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'"], argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "\'https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'") // cjlint-ignore !G.OTH.03

        arguments = parseArguments(["--url=https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\""],
            argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "https://login.example.com/login/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"") // cjlint-ignore !G.OTH.03

        arguments = parseArguments(["--url=https://login.example.com/login/?#$%^*()_+=-[]=;{}?.,<>;:"], argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "https://login.example.com/login/?#$%^*()_+=-[]=;{}?.,<>;:") // cjlint-ignore !G.OTH.03

        arguments = parseArguments(["--url=https://login.example.com/login/?@!"], argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "https://login.example.com/login/?@!") // cjlint-ignore !G.OTH.03

        arguments = parseArguments(["--url=https://login.example.com/login/?#$%^*()_+=-[]={}?.,"], argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "https://login.example.com/login/?#$%^*()_+=-[]={}?.,") // cjlint-ignore !G.OTH.03

        arguments = parseArguments(["--url=https://login.example.com/login/?#$%^*()_+=-[]={}?.,<k>:"], argSpecs) // cjlint-ignore !G.OTH.03
        @Expect(arguments.options.get("url"), "https://login.example.com/login/?#$%^*()_+=-[]={}?.,<k>:") // cjlint-ignore !G.OTH.03

        try {
            arguments = parseArguments(["=="], argSpecs)
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }

        try {
            arguments = parseArguments(["!"], argSpecs)
            @Expect(arguments.nonOptions, ["!"])
        } catch (e: ArgumentParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func test_long_dash_but_shortoption(): Unit {
        var argSpecs = [Short(r"a", NoValue)]
        @ExpectThrows[ArgumentParseException](parseArguments(["--a"], argSpecs))
    }

    @TestCase
    func test_empty_string_argument(): Unit {
        let argSpecs = [Short(r'a', NoValue)]
        let arguments = parseArguments(["", "-a", "value"], argSpecs)
        @Expect(arguments.nonOptions, ["", "value"])
        @Expect(arguments.options.get("a").isSome())
    }

    @TestCase
    func test_empty_string_in_middle(): Unit {
        let argSpecs = [Short(r'a', RequiredValue)]
        let arguments = parseArguments(["-a", "", "nonopt"], argSpecs)
        @Expect(arguments.options.get("a"), "")
        @Expect(arguments.nonOptions, ["nonopt"])
    }

    @TestCase
    func test_callback_execution_order(): Unit {
        callbackExecutionOrder.clear()
        let argSpecs = [
            Short(r'a', NoValue) { _ => callbackExecutionOrder.add("a") },
            Short(r'b', RequiredValue) { _ => callbackExecutionOrder.add("b") },
            Long("test", NoValue) { _ => callbackExecutionOrder.add("test") }
        ]
        let arguments = parseArguments(["-a", "-b", "value", "--test"], argSpecs)
        @Expect(arguments.options.size, 3)
        @Expect(callbackExecutionOrder.toArray(), ["a", "b", "test"])
    }

    @TestCase
    func test_non_option_callback_delayed(): Unit {
        callbackExecuted = false
        callbackNonOptions = None
        let argSpecs = [
            Short(r'a', NoValue),
            NonOptions { args =>
                callbackExecuted = true
                callbackNonOptions = Some(args)
            }
        ]
        let arguments = parseArguments(["-a", "file1", "file2"], argSpecs)
        @Expect(callbackExecuted)
        if (let Some(opts) <- callbackNonOptions) {
            @Expect(opts, ["file1", "file2"])
        } else {
            @Assert(false)
        }
    }

    @TestCase
    func test_full_spec_option_key_unified(): Unit {
        callbackShortKey = None
        callbackLongKey = None
        let argSpecs = [
            Full("verbose", r'v', NoValue) { _ =>
                callbackShortKey = Some("verbose")
            },
            Full("output", r'o', RequiredValue) { _ =>
                callbackLongKey = Some("output")
            }
        ]
        let arguments1 = parseArguments(["-v", "-o", "file"], argSpecs)
        @Expect(arguments1.options.get("verbose").isSome())
        @Expect(arguments1.options.get("output"), "file")
        @Expect(callbackShortKey, "verbose")

        callbackShortKey = None
        callbackLongKey = None
        let arguments2 = parseArguments(["--verbose", "--output=file2"], argSpecs)
        @Expect(arguments2.options.get("verbose").isSome())
        @Expect(arguments2.options.get("output"), "file2")
        @Expect(callbackLongKey, "output")
    }

    @TestCase
    func test_full_spec_with_both_forms(): Unit {
        let argSpecs = [
            Full("help", r'h', NoValue),
            Full("file", r'f', RequiredValue)
        ]
        let arguments = parseArguments(["-h", "-f", "test.txt", "--file=another.txt"], argSpecs)
        @Expect(arguments.options.get("help").isSome())
        @Expect(arguments.options.get("file"), "another.txt")
    }

    @TestCase
    func test_combined_short_options_with_full_spec(): Unit {
        fullSpecExecuted.clear()
        let argSpecs = [
            Full("verbose", r'v', NoValue) { _ => fullSpecExecuted.add("v") },
            Full("all", r'a', NoValue) { _ => fullSpecExecuted.add("a") },
            Full("list", r'l', NoValue) { _ => fullSpecExecuted.add("l") }
        ]
        let arguments = parseArguments(["-val"], argSpecs)
        @Expect(arguments.options.get("verbose").isSome())
        @Expect(arguments.options.get("all").isSome())
        @Expect(arguments.options.get("list").isSome())
        @Expect(fullSpecExecuted.toArray(), ["v", "a", "l"])
    }

    @TestCase
    func test_full_spec_with_optional_value(): Unit {
        let argSpecs = [
            Full("color", r'c', OptionalValue)
        ]
        let arguments1 = parseArguments(["-c"], argSpecs)
        @Expect(arguments1.options.get("color"), "")

        let arguments2 = parseArguments(["-cblue"], argSpecs)
        @Expect(arguments2.options.get("color"), "blue")

        let arguments3 = parseArguments(["--color"], argSpecs)
        @Expect(arguments3.options.get("color"), "")

        let arguments4 = parseArguments(["--color=red"], argSpecs)
        @Expect(arguments4.options.get("color"), "red")
    }

    @TestCase
    func test_multiple_empty_strings(): Unit {
        let argSpecs = [Short(r'a', NoValue)]
        let arguments = parseArguments(["", "", "-a", "", ""], argSpecs)
        @Expect(arguments.nonOptions, ["", "", "", ""])
        @Expect(arguments.options.get("a").isSome())
    }

    @TestCase
    func test_deprecated_api_empty_string(): Unit {
        let parser = ArgOpt(["", "-a", "value"], "a:", [])
        @Expect(parser.getArg("-a"), Some("value"))
        @Expect(parser.getUnparseArgs(), [""])
    }

    @TestCase
    func test_full_spec_short_and_long_consistency(): Unit {
        let argSpecs = [
            Full("verbose", r'v', NoValue),
            Full("output", r'o', RequiredValue)
        ]
        let arguments1 = parseArguments(["-v", "-o", "file.txt"], argSpecs)
        @Expect(arguments1.options.get("verbose").isSome())
        @Expect(arguments1.options.get("output"), "file.txt")

        let arguments2 = parseArguments(["--verbose", "--output", "file.txt"], argSpecs)
        @Expect(arguments2.options.get("verbose").isSome())
        @Expect(arguments2.options.get("output"), "file.txt")

        let arguments3 = parseArguments(["-v", "--output=file.txt"], argSpecs)
        @Expect(arguments3.options.get("verbose").isSome())
        @Expect(arguments3.options.get("output"), "file.txt")

        let arguments4 = parseArguments(["--verbose", "-o", "file.txt"], argSpecs)
        @Expect(arguments4.options.get("verbose").isSome())
        @Expect(arguments4.options.get("output"), "file.txt")
    }

    @TestCase
    func test_full_spec_combined_short_options(): Unit {
        let argSpecs = [
            Full("verbose", r'v', NoValue),
            Full("all", r'a', NoValue),
            Full("list", r'l', NoValue),
            Full("file", r'f', RequiredValue)
        ]
        let arguments = parseArguments(["-val", "-f", "test.txt"], argSpecs)
        @Expect(arguments.options.get("verbose").isSome())
        @Expect(arguments.options.get("all").isSome())
        @Expect(arguments.options.get("list").isSome())
        @Expect(arguments.options.get("file"), "test.txt")
    }

    @TestCase
    func test_full_spec_with_value_attached(): Unit {
        let argSpecs = [
            Full("output", r'o', RequiredValue)
        ]
        let arguments = parseArguments(["-ofile.txt"], argSpecs)
        @Expect(arguments.options.get("output"), "file.txt")
    }

    @TestCase
    func test_full_spec_optional_value_attached(): Unit {
        let argSpecs = [
            Full("color", r'c', OptionalValue)
        ]
        let arguments = parseArguments(["-cblue"], argSpecs)
        @Expect(arguments.options.get("color"), "blue")
    }

    @TestCase
    func fullSpecShortOptionShouldKeepShortKey() {
        let specs = [ArgumentSpec.Full("test2", r'c', ArgumentMode.OptionalValue)]

        let parsed = parseArguments(["-ct2val"], specs)

        @Expect(parsed.options.get("c"), Some("t2val"))
        @Expect(parsed.options.get("test2"), Some("t2val"))
    }
}
