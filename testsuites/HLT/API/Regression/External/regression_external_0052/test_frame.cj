/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.convert.*

class TestFrame {
    private var case_count = 0
    private var assert_count = 0

    private func assertCount() {
        assert_count++
        print(".")
    }

    func ASSERT_TRUE(result: Bool) {
        if (!result) {
            throw Exception("Got FALSE")
        }
        assertCount()
    }

    func ASSERT_FALSE(result: Bool) {
        if (result) {
            throw Exception("Got TRUE")
        }
        assertCount()
    }

    private func str<T>(o: T): String {
        let x = o as ToString
        return (x ?? "").toString()
    }

    func ASSERT_EQ<T>(a: T, b: T) where T <: Equatable<T> {
        if (a != b) {
            throw Exception("Not EQUAL ('${str(a)}' vs '${str(b)}')")
        }
        assertCount()
    }

    func ASSERT_EQ<T>(a: Option<T>, b: Option<T>) where T <: Equatable<T> {
        var msg = ""
        let eq = match ((a, b)) {
            case (None, None) => true
            case (Some(x), Some(y)) =>
                msg = "'${str(x)}' vs '${str(y)}'"
                x == y
            case (None, Some(y)) =>
                msg = "'' vs '${str(y)}'"
                false
            case (Some(x), None) =>
                msg = "'${str(x)}' vs ''"
                false
        }
        if (!eq) {
            throw Exception("Not EQUAL (${msg})")
        }
        assertCount()
    }

    func ASSERT_NONE<T>(o: Option<T>) {
        match (o) {
            case Some(v) => throw Exception("Got SOME ('${str(v)}')")
            case None => ()
        }
        assertCount()
    }

    func ASSERT_SOME<T>(o: Option<T>) {
        match (o) {
            case Some(v) => ()
            case None => throw Exception("Got NONE")
        }
        assertCount()
    }

    func Run(name: String, testcase: (TestFrame) -> Unit) {
        case_count++
        assert_count = 0
        println("[ CASE ${case_count.format("3")} ]  ${name}")
        try {
            print("[  RUN     ] ")
            testcase(this)
            println("")
            println("[  PASSED  ]\n")
        } catch (e: Exception) {
            println("\n[  FAILED  ] ${e}")
            throw (e)
        }
    }
}
