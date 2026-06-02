/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.posix.*
import std.process.*
import std.sync.*
import std.time.*
import std.math.*

@Test
class Test_terminate {
    @TestCase
    func test_default(): Unit {
        let subprocess = Process.start("sleep", "1s")
        subprocess.terminate()
        let res = subprocess.wait()
        @Expect(res, 15)
    }

    @TestCase
    func test_false(): Unit {
        let subprocess = Process.start("sleep", "1s")
        subprocess.terminate(force: false)
        let res = subprocess.wait()
        @Expect(res, 15)
    }

    @TestCase
    func test_true(): Unit {
        let subprocess = Process.start("sleep", "1s")
        subprocess.terminate(force: true)
        let res = subprocess.wait()
        @Expect(res, 1)
    }

    @TestCase
    func test_process_already_closed(): Unit {
        var cnt = 0
        let subprocess = Process.start("sleep", "1s")
        subprocess.wait()
        try {
            subprocess.terminate()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Process pid \"${subprocess.pid}\" not exist, not allow kill process.")
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func Test_terminate_twice(): Unit {
        var cnt = 0
        let subprocess = Process.start("sleep", "1s")
        subprocess.terminate()
        sleep(Duration.second * 2)
        try {
            subprocess.terminate()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Process pid \"${subprocess.pid}\" not exist, not allow kill process.")
        }
        @Expect(cnt, 1)
    }
}
