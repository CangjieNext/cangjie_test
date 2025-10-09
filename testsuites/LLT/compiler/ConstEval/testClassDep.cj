// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: depClass.cj
// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %compile_lib_opt depClass.cj -o depClass.%middle
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt depClass.%middle %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_numberAsNumber`
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_numberFirst` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_numberSecond` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_numberAsObject`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_objectAsObject`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_objectAsOptionalNumber`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_callAsNumber`
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_callFirst` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_callSecond` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_callAsObject`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_callObjectAsObject`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_callObjectAsOptionalNumber`
// ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_wrappedInt` not evaluated successfully
// ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_wrappedString` not evaluated successfully
// ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_wrappedNumbers` not evaluated successfully
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation with classes from dependencies.

internal import classy.*

const numberAsNumber = depNumber
const numberFirst = depNumber.first
const numberSecond = depNumber.second
const numberAsObject: Object = depNumber

const objectAsObject = depObject
const objectAsOptionalNumber = depObject as Numbers

const callAsNumber = makeNumber(654)
const callFirst = makeNumber(654).first
const callSecond = makeNumber(654).second
const callAsObject: Object = makeNumber(654)

const callObjectAsObject = makeObject(987)
const callObjectAsOptionalNumber = makeObject(987) as Numbers

const wrappedInt = makeWrapped<Int64>(1234)
const wrappedString = makeWrapped<String>("abcd")
const wrappedNumbers = makeWrapped<Numbers>(makeNumber(234))

main() {
    println(numberAsNumber)
    println(numberFirst)
    println(numberSecond)
    println((numberAsObject as Numbers).getOrThrow())

    println((objectAsObject as Numbers).getOrThrow())
    println(objectAsOptionalNumber.getOrThrow())

    println(callAsNumber)
    println(callFirst)
    println(callSecond)
    println((callAsObject as Numbers).getOrThrow())

    println((callObjectAsObject as Numbers).getOrThrow())
    println(callObjectAsOptionalNumber.getOrThrow())

    println(wrappedInt)
    println(wrappedString)
    println(wrappedNumbers)
}
