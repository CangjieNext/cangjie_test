/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*
import std.collection.*
import std.random.*

@Test
class TestStdSymbols {
    @TestCase
    func testArrayListByReflect() {
        let typeInfo = ClassTypeInfo.of<ArrayList<String>>()
        let constructor = typeInfo.getConstructor()
        let instance: ArrayList<String> = (constructor.apply() as ArrayList<String>).getOrThrow()
        instance.add("Hello, world")
        @Expect(instance.size, 1)
        @Expect(instance.toString(), "[Hello, world]")
    }

    func foo(): Any {
        if (Random().nextBool()) {
            // return ArrayList<Any>
            let list = ArrayList<Any>()
            list.add("hello")
            list.add("world")
            list.add(2012)
            return list
        } else {
            // return String
            return "hello world 2012"
        }
    }

    @TestCase
    func testAnyByReflect() {
        let data = foo()
        let dataInfo = TypeInfo.of(data)
        if (dataInfo.name.indexOf("ArrayList<") == 0) { // if data is ArrayList
            let sizeProp = dataInfo.getInstanceProperty("size")
            let indexGetFunc = dataInfo.getInstanceFunction("[]", TypeInfo.of<Int64>())
            if (let Some(size) <- (sizeProp.getValue(data) as Int64)) {
                let sb = StringBuilder()
                for (index in 0..size) {
                    let elem = indexGetFunc.apply(data, index)
                    let elemInfo = TypeInfo.of(elem)
                    match(elemInfo.name) {
                        case "String" => sb.append((elem as String).getOrThrow())
                        case "Int64" => sb.append((elem as Int64).getOrThrow())
                        case _ => sb.append("unknown")
                    }
                }
                @Expect(sb.toString(), "helloworld2012")
            }
        } else if (dataInfo.name == "String") { // if data is String
            @Expect(data as String, "hello world 2012")
        }
    }
}