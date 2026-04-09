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
 *       test ServerBuilder & ServicePoolConfig
 * Test API:
 *       ServerBuilder#servicePoolConfig
 */

package tests.hello

import stdx.net.http.*
import stdx.net.tls.*
import stdx.log.*
import std.time.*
import std.sync.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestReqLimitCtl {
    @TestCase
    func configTest(): Unit {
        let cfg = ServicePoolConfig(capacity: 1, queueCapacity: 1, preheat: 1)
        let server = ServerBuilder().addr("0.0.0.0").port(0).servicePoolConfig(cfg).build()
        @Assert(cfg.capacity == server.servicePoolConfig.capacity)
        @Assert(cfg.queueCapacity == server.servicePoolConfig.queueCapacity)
        @Assert(cfg.preheat == server.servicePoolConfig.preheat)
        server.close()
    }

    @TestCase
    func invalidCapacityConfigTest(): Unit {
        invalidConfigTest(ServicePoolConfig(capacity: -1, queueCapacity: 1, preheat: 1),
            "capacity should greater than 0, but got -1")
    }

    @TestCase
    func invalidQueueCapacityConfigTest(): Unit {
        invalidConfigTest(ServicePoolConfig(capacity: 1, queueCapacity: -1, preheat: 1),
            "queue capacity should greater than 0, but got -1")
    }

    @TestCase
    func invalidPreheatConfigTest(): Unit {
        invalidConfigTest(ServicePoolConfig(capacity: 1, queueCapacity: 1, preheat: -1),
            "preheat size should between 0 and 1, but got -1")
    }

    func invalidConfigTest(cfg: ServicePoolConfig, msg: String): Unit {
        try {
            let _ = ServerBuilder().addr("0.0.0.0").port(0).servicePoolConfig(cfg).build()
        } catch (e: IllegalArgumentException) {
            if (e.message == msg) {
                return
            }
        }
        throw Exception("Expected exception: ${msg}")
    }

    @TestCase
    func serverCtlTest(): Unit {
        let ready = AtomicInt64(0)
        let start = AtomicBool(false)
        let done = AtomicInt64(0)
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .servicePoolConfig(ServicePoolConfig(capacity: 1, queueCapacity: 1))
            .build()
        server.distributor.register("/hello", {
            _ => sleep(Duration.second) // block the worker
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
            asanGC()
        }
        throw Exception("not limited")
    }
}
