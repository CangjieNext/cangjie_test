/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
import stdx.net.http.*
import std.fs.*
import std.collection.*
import stdx.log.*
import std.sync.*
import std.time.*

let boundary = "----WebKitFormBoundary7B8HS8VxGf4OHfS7"
let boundaryArr1 = "------WebKitFormBoundary7B8HS8VxGf4OHfS7".toArray()
let boundaryArr2 = "------WebKitFormBoundary7B8HS8VxGf4OHfS7--".toArray()
let CRLF = "\r\n".toArray()
let CRLF_CRLF = "\r\n\r\n".toArray()
let server = ServerBuilder().addr("0.0.0.0").port(0).build()

main(): Unit {
    startServer()
    let client = ClientBuilder().build()
    let req = HttpRequestBuilder()
        .post()
        .url("http://127.0.0.1:${server.port}/upload")
        .header("content-type", "multipart/form-data; boundary=${boundary}")
        .body(buildBodyData("upload.test"))
        .build()
    try {
        var resp = client.send(req)
        println(resp)
    } finally {
        remove("upload.test")
    }

    client.close()
    server.close()
}

func startServer(): Unit {
    server.distributor.register("/upload", FileHandler("./", handlerType: UpLoad))

    spawn {
        server.serve()
    }
    sleep(Duration.second)
}

func buildBodyData(fileName: String): String {
    let body = StringBuilder()
    body.appendFromUtf8(boundaryArr1)
    body.appendFromUtf8(CRLF)
    body.appendFromUtf8("Content-Disposition: form-data; name=\"myFile\"; filename=\"${fileName}\"".toArray())
    body.appendFromUtf8(CRLF_CRLF)
    body.appendFromUtf8(
        "[{\r\n\"test\": \"this is a json file\"\r\n}, {\r\n\"test\": \"this is a json file\"\r\n}]\r\n".toArray())
    body.appendFromUtf8(CRLF)
    body.appendFromUtf8(boundaryArr2)
    body.appendFromUtf8(CRLF)
    return body.toString()
}
