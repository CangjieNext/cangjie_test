/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:0
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public func calledSeveralArgsMethodMultilineMacros(e: Example_LN): VerifyStatement {
    @Called(
        e.severalArgs(
            ofType<String>(),
            argThat<String> {
                s => s.contains("ab")
            },
            argThat {
                num: Int64 => num + 3 == 5
            },
            argThat {
                num: Int64 => num < 5
            }
        )
    )
}

public func calledSeveralArgsMethod(e: Example_LN): VerifyStatement {
    @Called(e.severalArgs(ofType<String>(), "abc", _, argThat { num: Int64 => num < 5 }))
}

public func calledOverloadedInt(e: Example_LN): VerifyStatement {
    return @Called(e.overloaded(ofType<Int64>()))
}

public func calledA(e: Example_LN): VerifyStatement {
    return @Called(e.a())
}

public func calledB(e: Example_LN): VerifyStatement {
    return @Called(e.b())
}

public func calledC(e: Example_LN): VerifyStatement {
    return @Called(e.c())
}

public func calledA2(e: Example_LN): VerifyStatement {
    return @Called(e.a())
}

public func calledC2(e: Example_LN): VerifyStatement {
    return @Called(e.c())
}

@Test
public class VerificationFailedReportTest {
    public override func beforeAll(): Unit {
        @On(e.a()).returns("").anyTimes()
        @On(e.b()).returns("").anyTimes()
        @On(e.c()).returns("").anyTimes()
        @On(e.overloaded(ofType<String>())).returns(()).anyTimes()
        @On(e.overloaded(ofType<Int64>())).returns(()).anyTimes()
        @On(e.severalArgs(_, _, _, _)).returns(()).anyTimes()
    }

    private let e = mock<Example_LN>()

    @TestCase func tooManyInvocations(): Unit {
        verificationFailureReport("TooManyInvocations",
            [
                "Required: exactly 2 times",
	            "Actual: 3",
	            "line_numbers.cj",
	            "line_numbers.cj",
	            "line_numbers.cj"
            ]
        ) {
            callA(e, 2)
            callA2(e, 1)
            
            Verify.unordered(
                calledA(e).times(2)
            )
        }
    }    
    
    @TestCase func tooFewInvocations(): Unit {
        verificationFailureReport("TooFewInvocations",
            [
                "Required: exactly 4 times", 
                "Actual: 3", 
                "line_numbers.cj", 
                "line_numbers.cj",
                "line_numbers.cj"
            ]
        ) {
            callA(e, 2)
            callA2(e, 1)
            
            Verify.unordered(
                calledA(e).times(4)
            )
        }
    }    
    
    @TestCase func unmatchedInvocations(): Unit {
        verificationFailureReport("UnmatchedInvocations",
            [
                "e.b() at line_numbers.cj",
                "e.b() at line_numbers.cj",
                "e.c() at line_numbers.cj"
            ]
        ) {
            callA(e, 2)
            callA(e, 1)
            callB(e, 1)
            callB2(e, 1)
            callC(e, 1)

            Verify.unordered(
                calledA(e)
            )
        }
    }    

    @TestCase func unmatchedStatements(): Unit {
        verificationFailureReport("UnmatchedStatements",
            [
                "e.b() declared at verification_failed_report_test.cj:54",
                "e.c() declared at verification_failed_report_test.cj:66"
            ]
        ) {
            callA(e, 2)
            callA(e, 1)
            
            Verify.unordered(
                calledA(e),
                calledB(e),
                calledC2(e)
            )
        }
    }

    @TestCase func nonDisjointStatements(): Unit {
        verificationFailureReport("NonDisjointStatements",
            [
                "e.a() declared at verification_failed_report_test.cj",
                "e.a() declared at verification_failed_report_test.cj",
                "e.a() at line_numbers.cj"
            ]
        ) {
            callA(e, 2)
            callA2(e, 1)
            
            Verify.ordered(
                calledA(e).times(min: 2, max: 3),
                calledA2(e).once()
            )
        }
    }

    @TestCase func unexpectedInvocationWrongFunction(): Unit {
        verificationFailureReport("UnexpectedInvocation",
            [
                "Unexpected invocation",
                "Expected: e.c() expected by statement at verification_failed_report_test.cj",
                "Actual: e.b() invoked at line_numbers.cj"
            ]
        ) {
            callA(e, 1)
            callB(e, 1)
            
            Verify.ordered(
                calledA(e),
                calledC(e)
            )
        }
    }    

    @TestCase func unexpectedInvocationWrongFunctionWithSameName(): Unit {
        verificationFailureReport("UnexpectedInvocation",
            [
                "Unexpected invocation",
                "Expected: e.overloaded(ofType<Int64>()) expected by statement at verification_failed_report_test.cj",
                "Actual: e.overloaded(...) invoked at line_numbers.cj",
                "Wrong overloaded version of method overloaded was invoked"
            ]
        ) {
            callOverloadedStr(e)
            
            Verify.ordered(
                calledOverloadedInt(e)
            )
        }
    }    
    
    @TestCase func unexpectedInvocationWrongArguments(): Unit {
        // sadly this is the best way to test matcher and stub descriptions, so we test it here 
        verificationFailureReport("UnexpectedInvocation",
            [
                "Unexpected invocation",
                "Actual: e.severalArgs(...) invoked at line_numbers.cj",
                "Argument mismatch:",
                "Expected: e.severalArgs(ofType<String>(), \"abc\", _, argThat { num: Int64 =>",
                "num < 5",
                "[+] string1 <~> ofType<String>()",
                "[-] string2 <~> eq(\"abc\")",
                "[+] int1    <~> any()",
                "[-] int2    <~> argThat { num: Int64 =>",
                "num < 5",
            ]
        ) {
            callA(e, 1)
            callSeveralArgsMethod(e)
            
            Verify.ordered(
                calledA(e),
                calledSeveralArgsMethod(e)
            )
        }
    }    
    
    @TestCase func unexpectedInvocationWrongArgumentsMultilineMacro(): Unit {
        // sadly this is the best way to test matcher and stub descriptions, so we test it here 
        verificationFailureReport("UnexpectedInvocation",
            [
                "Actual: e.severalArgs(...) invoked at line_numbers.cj",
                "Argument mismatch:",
                "Expected: e.severalArgs( ofType<String>(), argThat<String> { s => s.contains(\"ab\") },",
                " argThat { num: Int64 => num + 3 == 5 }, argThat { num: Int64 => num < 5 } )", 
                " at line_numbers.cj",
                "[+] string1 <~> ofType<String>()",
                "[-] string2 <~> argThat<String> { s => s.contains(\"ab\") }",
                "[-] int1    <~> argThat { num: Int64 => num + 3 == 5 }",
                "[-] int2    <~> argThat { num: Int64 => num < 5 }"
            ]
        ) {
            callA(e, 1)
            callSeveralArgsMethod(e)
            
            Verify.ordered(
                calledA(e),
                calledSeveralArgsMethodMultilineMacros(e)
            )
        }
    }    
    
    @TestCase func unmatchedInvocationsSeveralReceivers(): Unit {
        // sadly this is the best way to test matcher and stub descriptions, so we test it here 
        verificationFailureReport("UnmatchedInvocations",
            [
                "e2.a() at line_numbers.cj",
                "e2.c() at line_numbers.cj",
                "e.a() at line_numbers.cj"
            ]
        ) {
            let e2 = mock<Example_LN>()
            @On(e2.a()).returns("").anyTimes()
            @On(e2.b()).returns("").anyTimes()
            @On(e2.c()).returns("").anyTimes()
            callA(e2, 1)
            callB(e2, 2)
            callC(e2, 1)
            callA(e, 1)
            callB(e, 1)
            
            Verify.unordered(
                @Called(e2.b()),
                @Called(e.b())
            )
        }
    }    
    
    @TestCase func operatorFuncs(): Unit {
        verificationFailureReport("UnmatchedInvocations",
            [
                "e.+(...)",
                "e.-(...)",
                "e.[](...)"
            ]
        ) {
            @On(e + "a").returns("")
            @On(e - "b").returns("")
            @On(e[""]).returns("")
            @On(e[""] = "").returns(())
            e.a()
            // TODO: maybe unstubbed test as well?
            e + "a"
            e - "b"
            e[""]
            e[""] = ""
            Verify.unordered(
                @Called(e.a())
            )
        }
    }    
    
    @TestCase func noInteractions(): Unit {
        // TODO: we don't have information about mock object names atm, so reporting here is poor
        success {
            Verify.noInteractions(e)
            let e2 = mock<Example_LN>()
            @On(e2.a()).returns("").anyTimes()
            Verify.noInteractions(e, e2)
            e.a()
            Verify.noInteractions(e2)
            Verify.clearInvocationLog()
            e2.a()
            Verify.noInteractions(e)
        }

        verificationFailureReport("UnwantedInteractions",
            [
                "<?>.a() at line_numbers.cj"
            ]
        ) {
            callA(e, 1)
            Verify.noInteractions(e)
        }

        verificationFailureReport("UnwantedInteractions",
            [
                "<?>.a() at line_numbers.cj",
                "<?>.b() at line_numbers.cj"
            ]
        ) {
            let e2 = mock<Example_LN>()
            @On(e2.b()).returns("").anyTimes()
            callA2(e, 1)
            callB(e2, 1)
            Verify.noInteractions(e, e2)
        }
    }

    @TestCase func renderingFieldsAndProps(): Unit {
        verificationFailureReport("UnwantedInteractions",
            [
                "<?>.i1 = ...",
                "<?>.i1",
                "<?>.i2 = ...",
                "<?>.i2"
            ]
        ) {
            let spy = spy(FieldsAndProps())
            spy.i1 = 1
            @Assert(spy.i1, 1)
            spy.i2 = 2
            @Assert(spy.i2, 2)
            Verify.noInteractions(spy)
        }
    }
}

class FieldsAndProps {
    var i1: Int64 = 0
    mut prop i2: Int64 {
        get() { i1 }
        set(v) { i1 = v }
    }
}