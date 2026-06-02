/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *       Test HttpRequestBuilder
 * Test API:
 *       public func setHeaders(headers: HttpHeaders): HttpRequestBuilder
 *       public func addHeaders(headers: HttpHeaders): HttpRequestBuilder
 *       public func header(name: String, value: String): HttpRequestBuilder
 */

package tests.request

import std.collection.*
import stdx.net.http.*

@Test
class TestHeader {
    @TestCase
    func headerCorrect(): Unit {
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("h1", " v1,  \tv2 ")
            .header("h2", "")
            .header("h3", "   ")
            .build()
        @Assert(collectionToArrayList(request.headers.get("h1")), ArrayList<String>(["v1,  \tv2"]))
        @Assert(request.headers.getFirst("h2"), None)
        @Assert(request.headers.getFirst("h3"), None)
    }

    @TestCase
    func addHeadersCorrect(): Unit {
        let headers = HttpHeaders()
        headers.set("h1", "v, 2")
        headers.add("h1", " v3 ")
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("h1", "v1")
            .addHeaders(headers)
            .build()
        @Assert(collectionToArrayList(request.headers.get("h1")), ArrayList<String>(["v1", "v, 2", "v3"]))
    }

    @TestCase
    func setHeadersCorrect(): Unit {
        let headers = HttpHeaders()
        headers.set("h1", "v, 2")
        headers.add("h1", " v3 ")
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("h1", "v1")
            .setHeaders(headers)
            .build()
        @Assert(collectionToArrayList(request.headers.get("h1")), ArrayList<String>(["v, 2", "v3"]))
    }

    @TestCase
    func headerValueWrong(): Unit {
        let expectException = "HttpException: illegal field value of h1, value should consist of vchar (visible US-ASCII octet), SP or HTAB"
        try {
            let _ = HttpRequestBuilder()
                .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
                .header("h1", "v1你好")
                .build()
        } catch (e: HttpException) {
            @Assert(e.toString(), expectException)
        }
    }

    @TestCase
    func headerNameWrong(): Unit {
        let expectException = "Invalid header name"
        try {
            let _ = HttpRequestBuilder()
                .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
                .header("h1你好", "v1")
                .build()
        } catch (e: HttpException) {
            @Assert(e.toString().contains(expectException))
        }
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}
