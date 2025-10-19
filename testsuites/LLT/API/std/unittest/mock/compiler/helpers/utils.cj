/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package std.mock_test_util

import std.collection.*
import std.unittest.mock.internal.*

public import std.unittest.mock.internal.{
    createMock, createSpy, HasDefaultValueForStub, CallHandler, Mocked,
    NoDefaultValueForMockException, IllegalMockCallException, MockReturnValueTypeMismatchException
}

public class NoMockMatchersFoundException <: Exception {
    public init(message: String) {
        super(message)
    }

    protected override func getClassName(): String {
        return "NoMockMatchersFoundException"
    }
}

public class NotAMockObjectException <: Exception {
    public init(message: String) {
        super(message)
    }

    protected override func getClassName(): String {
        return "NotAMockObjectException"
    }
}

class DummyCallHandler <: CallHandler {
    private var matchers = Option<HashMap<String, Any>>.None
    private var shouldReturnZeroValue = false
    private var shouldBeSpy = false
    private var shouldReturnDefault = false

    public redef static func recordStatic(callHandler: CallHandler) {
        CallHandler.recordStatic(callHandler)
    }

    public redef static func clearStatic() {
        CallHandler.clearStatic()
    }

    public redef static func currentStatic() {
        CallHandler.currentStatic()
    }

    public func setReturnZero() {
        this.shouldReturnZeroValue = true
    }

    public func setSpyMode() {
        this.shouldBeSpy = true
    }

    public func setReturnDefaultMode() {
        this.shouldReturnDefault = true
    }

    private func getBackendIndependentMangledName(mangledName: String) {
        return mangledName.replace("record.", "")
    }

    private func printCallInfo(call: Call) {
        print("Actual call: ${call.funcInfo.id.shortName}")

        if (call.typeArgs.size > 0) {
            print("<")
        }
        for ((i, typeArg) in call.typeArgs |> enumerate) {
            print(typeArg)
            if (i != call.typeArgs.size - 1) {
                print(", ")
            }
        }
        if (call.typeArgs.size > 0) {
            print(">")
        }

        print("(")

        for ((i, arg) in call.args |> enumerate) {
            match (arg) {
                case x: ToString => print("\"${x}\"")
                case _ => print("[not ToString]")
            }
            if (i != call.args.size - 1) {
                print(", ")
            }
        }
        println(")")

        let hasImplementation = if (call.funcInfo.hasImplementation) { "NA" } else { "A" }
        let isReturnTypeDefaultible = if (call.funcInfo.hasDefaultValue) { "D" } else { "ND" }
        let isAccessible = if (call.funcInfo.isAccessible) { "AC" } else { "NAC" }
        let returnTypeName = call.funcInfo.returnTypeName
        let location = "${call.funcInfo.location[0]}:${call.funcInfo.location[1]}:${call.funcInfo.location[2]}"

        let (kindName, shortName, hasSetter) = match (call.funcInfo.kind) {
            case DeclKind.Method(name) => ("method", name, Option<Bool>.None)
            case DeclKind.FieldGetter(name, hasSetter) => ("field getter", name, Option<Bool>.Some(hasSetter))
            case DeclKind.FieldSetter(name) => ("field setter", name, Option<Bool>.None)
            case DeclKind.PropertyGetter(name, hasSetter) => ("prop getter", name, Option<Bool>.Some(hasSetter))
            case DeclKind.PropertySetter(name) => ("prop setter", name, Option<Bool>.None)
            case DeclKind.TopLevelFunction(name) => ("top-level function", name, Option<Bool>.None)
            case DeclKind.StaticMethod(name) => ("static method", name, Option<Bool>.None)
            case DeclKind.StaticPropertyGetter(name) => ("static property getter", name, Option<Bool>.None)
            case DeclKind.StaticPropertySetter(name) => ("static property setter", name, Option<Bool>.None)
            case DeclKind.StaticFieldGetter(name) => ("static field getter", name, Option<Bool>.None)
            case DeclKind.StaticFieldSetter(name) => ("static field setter", name, Option<Bool>.None)
            case DeclKind.TopLevelVariableGetter(name) => ("top-level variable getter", name, Option<Bool>.None)
            case DeclKind.TopLevelVariableSetter(name) => ("top-level variable setter", name, Option<Bool>.None)
        }

        print("Declared ${kindName}: ${shortName}")

        if (call.funcInfo.typeParams.size > 0) {
            print("<")
        }
        for ((i, typeParam) in call.funcInfo.typeParams |> enumerate) {
            print(typeParam)
            if (i != call.funcInfo.typeParams.size - 1) {
                print(", ")
            }
        }
        if (call.funcInfo.typeParams.size > 0) {
            print(">")
        }

        print("(")

        for ((i, param) in call.funcInfo.params |> enumerate) {
            let namedOrPositional = if (param.isNamed) { "N" } else { "P" }
            let hasDefaultValue = if (param.hasDefaultValue) { "D" } else { "ND" }
            print("${param.name}[${param.position}, ${namedOrPositional}, ${hasDefaultValue}]")
            if (i != call.funcInfo.params.size - 1) {
                print(", ")
            }
        }

        let setterPresenseDescription = match (hasSetter) {
            case Some(true) => "HS"
            case Some(false) => "DHS"
            case None => "NA"
        }

        println(")[${hasImplementation}, ${isReturnTypeDefaultible}, ${isAccessible}, ${setterPresenseDescription}, ${location}]: ${returnTypeName}")

        println("Declared function name: ${call.funcInfo.id.shortName} -> ${getBackendIndependentMangledName(call.funcInfo.id.mangledName)}")
        match (call.funcInfo.outerDeclId) {
            case Some(outerDeclId) =>
                print("Outer decl name: ${outerDeclId.shortName}")
                match(call.receiver) {
                    case Some(r) => if (r[1].size > 0) {
                        print("<")
                        for ((i, receiverTypeArg) in r[1] |> enumerate) {
                            print(receiverTypeArg)
                            if (i != r[1].size - 1) {
                                print(", ")
                            }
                        }
                        print(">")
                    } else { () }
                    case _ => ()
                }
                println(" -> ${getBackendIndependentMangledName(outerDeclId.mangledName)}")
            case _ =>
                println("Top-level declaration")
        }

        match(call.receiver) {
            case Some(receiver) =>
                match(receiver[0]) {
                    case x: ToString => println("Receiver: ${x}")
                    case _ => println("Receiver: [doesn't implement ToString]")
                }
            case _ => println("No receiver (top-level declaration)")
        }

        println("------------------------------")
    }

    public func onCall(call: Call): OnCall {
        let mangledName = getBackendIndependentMangledName(call.funcInfo.id.mangledName)
        if (shouldReturnZeroValue) {
            println("-------- Called with ReturnZero --------")
            return OnCall.ReturnZero
        }
        if (shouldBeSpy) {
            println("-------- Called with CallBase --------")
            printCallInfo(call)
            return OnCall.CallBase
        }
        if (shouldReturnDefault) {
            println("-------- Called with ReturnDefault --------")
            printCallInfo(call)
            return OnCall.ReturnDefault
        }
        let throwNoMatchers = { =>
            OnCall.Throw(NoMockMatchersFoundException("There are no any matchers for method ${mangledName}"))
        }
        let m = matchers ?? return throwNoMatchers()
        if (!m.contains(mangledName)) {
            return throwNoMatchers()
        }

        printCallInfo(call)

        return OnCall.Return(m[mangledName])
    }

    public func addMatcher(rawFuncId: String, args: Array<Any>, returnValue: Any): Unit {
        if (matchers.isNone()) {
            matchers = HashMap<String, Any>()
        }
        let m = matchers ?? throw Exception()
        m[rawFuncId] = returnValue
    }

    public func clearMatchers(): Unit {
        let m = (matchers ?? return)
        m.clear()
    }

    public func throwNotAMockObject(): Nothing {
        throw NotAMockObjectException("Receiver of the function to stub is not a mock object")
    }
}

public let dummyMockingCallHandler: CallHandler = DummyCallHandler()

public func addMatcher(rawFuncId: String, args: Array<Any>, returnValue: Any) {
    let mockingSupport = dummyMockingCallHandler as DummyCallHandler ?? throw Exception("Mocking support should be `DummyCallHandler`");
    mockingSupport.addMatcher(rawFuncId, args, returnValue)
}

public func clearMatchers(): Unit {
    let mockingSupport = dummyMockingCallHandler as DummyCallHandler ?? throw Exception("Mocking support should be `DummyCallHandler`");
    mockingSupport.clearMatchers()
}

public func setReturnZero() {
    let mockingSupport = dummyMockingCallHandler as DummyCallHandler ?? throw Exception("Mocking support should be `DummyCallHandler`");
    mockingSupport.setReturnZero()
}

public func setSpyMode() {
    let mockingSupport = dummyMockingCallHandler as DummyCallHandler ?? throw Exception("Mocking support should be `DummyCallHandler`");
    mockingSupport.setSpyMode()
}

public func setReturnDefaultMode() {
    let mockingSupport = dummyMockingCallHandler as DummyCallHandler ?? throw Exception("Mocking support should be `DummyCallHandler`");
    mockingSupport.setReturnDefaultMode()
}
