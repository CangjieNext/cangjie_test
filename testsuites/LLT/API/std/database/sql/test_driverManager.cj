/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.database.sql.*
import std.unittest.*
import std.unittest.testmacro.*

public class MyDriver <: Driver {
    private var scheme: String
    public init(scheme: String) {
        this.scheme = scheme.toAsciiLower()
    }
    public prop name: String {
        get() {
            return scheme
        }
    }
    public prop version: String {
        get() {
            return "0.1.0"
        }
    }
    public prop preferredPooling: Bool {
        get() {
            return true
        }
    }
    public func open(_: String, _: Array<(String, String)>): Datasource {
        throw UnsupportedException()
    }
}

@Test
class TestDriverManager {
    @TestCase
    func PooledDatasourceTest(): Unit {
        let driver1 = MyDriver("dr1")
        let driver2 = MyDriver("dr2")
        DriverManager.register("driver1", driver1)
        try {
            DriverManager.register("driver1", driver1)
        } catch (e: SqlException) {
            @Expect(e.message.startsWith("Duplicate database driver (driver1)"), true)
        }

        DriverManager.register("driver2", driver2)

        @Expect(DriverManager.getDriver("driver1")?.name, "dr1")
        @Expect(DriverManager.drivers(), ["driver1","driver2"])

        DriverManager.deregister("driver2")
        if (let Some(_) <- DriverManager.getDriver("driver2")) {
            @Assert(false)
        }

        DriverManager.deregister("driver1")
        @Expect(DriverManager.drivers(), [])
    }
}
