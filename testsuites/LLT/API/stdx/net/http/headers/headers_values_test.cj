/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/**
 * Test description:
 *      Test HttpHeaders
 * Test API:
 *          public func add(name: String, value: String): Unit
 *          public func set(name: String, values: ArrayList<String>): Unit
 */

package tests.headers

import stdx.net.http.HttpHeaders
import std.collection.ArrayList

@Test
class TestHttpHeadersValue {
    @TestCase
    func httpHeaders(): Unit {
        let headers = HttpHeaders()

        headers.add("Field1", "foo")
        headers.add("field1", "foo")
        headers.add("FIelD1", "foo")

        headers.add("Field2", "")
        headers.add("Field2", " ")
        headers.add("Field2", " , ")

        headers.add("Field3", "")

        headers.add("Field4", "foo")
        headers.add("Field4", " foo")
        headers.add("Field4", "foo ")
        headers.add("Field4", " foo ")

        headers.add("Field5", "foo,bar")
        headers.add("Field5", "foo, bar")
        headers.add("Field5", " foo, bar")
        headers.add("Field5", "foo, bar ")

        headers.set("Field6", "")
        headers.add("Field6", " ")
        headers.add("Field6", "value1")
        headers.add("Field6", "value2,value3")

        headers.add("Field7", "foo")
        headers.set("Field7", "")
        headers.add("Field7", " ")

        headers.add("Field8", "hacker1\r\n")
        headers.add("Field8", "pass")

        headers.set("Field9", "hacker2\r\n")
        headers.add("Field9", "pass")

        for ((k, v) in headers) {
            println("key: ${k}, values size: ${v.size}")
        }
    }
}
/* SCAN-IN
key: field1, values size: 3
key: field2, values size: 1
key: field4, values size: 4
key: field5, values size: 4
key: field6, values size: 2
key: field7, values size: 1
key: field8, values size: 2
key: field9, values size: 2
 */
