/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit

@When[os == "Windows"]
let message_str = "The socket is already bound"
@When[os != "Windows"]
let message_str = "Address already in use"

@Test
public class Test_servicePoolConfig {
    @TestCase
    func capacity(): Unit {
        var cnt = 0

        try {
            let _ = ServerBuilder().addr("127.0.0.1").port(0).servicePoolConfig(ServicePoolConfig(capacity: 0)).build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "capacity should greater than 0, but got 0")
        }
        @Expect(cnt, 1)

        try {
            let _ = ServerBuilder()
                .addr("127.0.0.1")
                .port(0)
                .servicePoolConfig(ServicePoolConfig(capacity: -1))
                .build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "capacity should greater than 0, but got -1")
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func queueCapacity(): Unit {
        var cnt = 0

        try {
            let _ = ServerBuilder()
                .addr("127.0.0.1")
                .port(0)
                .servicePoolConfig(ServicePoolConfig(queueCapacity: 0))
                .build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "queue capacity should greater than 0, but got 0")
        }
        @Expect(cnt, 1)

        try {
            let _ = ServerBuilder()
                .addr("127.0.0.1")
                .port(0)
                .servicePoolConfig(ServicePoolConfig(queueCapacity: -1))
                .build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "queue capacity should greater than 0, but got -1")
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func preheat(): Unit {
        var cnt = 0

        try {
            let _ = ServerBuilder()
                .addr("127.0.0.1")
                .port(0)
                .servicePoolConfig(ServicePoolConfig(capacity: 1, preheat: 2))
                .build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "preheat size should between 0 and 1, but got 2")
        }
        @Expect(cnt, 1)

        try {
            let _ = ServerBuilder().addr("127.0.0.1").port(0).servicePoolConfig(ServicePoolConfig(preheat: -1)).build()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "preheat size should between 0 and 10000, but got -1")
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func get_servicePoolConfig(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .servicePoolConfig(ServicePoolConfig(capacity: 1000, queueCapacity: 1000, preheat: 1000))
            .build()
        let cfg = server.servicePoolConfig
        @Expect(cfg.capacity, 1000)
        @Expect(cfg.queueCapacity, 1000)
        @Expect(cfg.preheat, 1000)
        server.close()
    }

    @TestCase
    func over_size(): Unit {
        let ready = AtomicInt64(0)
        let start = AtomicBool(false)
        let done = AtomicInt64(0)
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .servicePoolConfig(ServicePoolConfig(capacity: 1, queueCapacity: 1))
            .build()
        server.distributor.register("/hello", {
            _ => sleep(Duration.second)
        })

        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client1 = ClientBuilder().build()
        let client2 = ClientBuilder().build()
        let client3 = ClientBuilder().build()
        spawn {
            ready.fetchAdd(1)
            while (!start.load()) {
                sleep(Duration.millisecond)
            }
            try {
                client1.get("http://127.0.0.1:${server.port}/hello")
            } catch (_) {
            } finally {
                done.fetchAdd(1)
            }
        }
        spawn {
            ready.fetchAdd(1)
            while (!start.load()) {
                sleep(Duration.millisecond)
            }
            try {
                client2.get("http://127.0.0.1:${server.port}/hello")
            } catch (_) {
            } finally {
                done.fetchAdd(1)
            }
        }
        spawn {
            ready.fetchAdd(1)
            while (!start.load()) {
                sleep(Duration.millisecond)
            }
            try {
                client3.get("http://127.0.0.1:${server.port}/hello")
            } catch (_) {
            } finally {
                done.fetchAdd(1)
            }
        }
        while (ready.load() < 3) {
            sleep(Duration.millisecond)
        }
        try {
            start.store(true)
            sleep(Duration.millisecond * 1100)
            if (done.load() <= 2) {
                return
            }
        } finally {
            server.close()
            client1.close()
            client2.close()
            client3.close()
        }
        throw Exception("not limited")
    }
}
