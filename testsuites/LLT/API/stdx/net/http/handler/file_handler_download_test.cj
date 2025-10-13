/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 

/*
 * Test description:
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.fs.*
import stdx.log.*
import std.sync.*
import std.time.*
import asan.*

@Test
class TestDownload {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func download(): Unit {
        startServer()
        let client = ClientBuilder().build()
        try {
            createFile()
            let respJson = client.get("http://127.0.0.1:${server.port}/json")
            println(respJson)
            // read data
            let buf = Array<UInt8>(200, repeat: 0)
            var len = respJson.body.read(buf)
            var fileData = File.readFrom("test.json")
            @Assert(fileData, buf[..len])
            let respXml = client.get("http://127.0.0.1:${server.port}/xml")
            len = respXml.body.read(buf)
            fileData = File.readFrom("test.xml")
            @Assert(fileData, buf[..len])
        } finally {
            deleteFile()
        }

        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/json", FileHandler("test.json"))
        server.distributor.register("/xml", FileHandler("test.xml"))
        server.logger.level = LogLevel.TRACE

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }

    func createFile(): Unit {
        let filejson = File("./test.json", Write)
        filejson.write(
            "[{\r\n\"test\": \"this is a json file\"\r\n}, {\r\n\"test\": \"this is a json file\"\r\n}]\r\n".toArray())
        filejson.close()
        let fileXml = File("./test.xml", Write)
        fileXml.write(
            "<note>\r\n<to>Tove</to>\r\n<from>Jani</from>\r\n<heading>Reminder</heading>\r\n<body>this is a xml file</body>\r\n</note>"
                .toArray())
        fileXml.close()
    }

    func deleteFile(): Unit {
        if (exists("./test.json")) {
            remove("./test.json")
        }
        if (exists("./test.xml")) {
            remove("./test.xml")
        }
    }
}
