/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

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
class Test_driverManager_03 {
    /*
     * Test description:
     *     test register exception of the class driverManager
     * Test API:
     *     public static func register(driverName: String, driver: Driver): Unit
     */
    @TestCase
    func test_drivermanager_register_01(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("cangjietest", driver1)
        try {
            DriverManager.register("cangjietest", driver1)
        } catch (e: SqlException) {
            @Expect(e.message.contains("Duplicate database driver"))
            @Expect(e.errorCode, 0)
        }
    }

    /*
     * Test description:
     *     test register of the class driverManager
     * Test API:
     *     public static func register(driverName: String, driver: Driver): Unit
     */
    @TestCase
    func test_drivermanager_register_02(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("cangjietest1", driver1)
        try {
            DriverManager.register("cangjietest2", driver1)
            @Expect(true)
        } catch (e: SqlException) {
            @Expect(e.message.contains("Duplicate database driver"))
            @Expect(e.errorCode, 0)
        }
    }

    /*
     * Test description:
     *     test register of the class driverManager
     * Test API:
     *     public static func register(driverName: String, driver: Driver): Unit
     */
    @TestCase
    func test_drivermanager_register_03(): Unit {
        let driver1 = MyDriver("dr1")
        let driver2 = MyDriver("dr2")
        DriverManager.register("cangjietest3", driver1)
        try {
            DriverManager.register("cangjietest3", driver2)
            @Expect(false)
        } catch (e: SqlException) {
            @Expect(e.message.contains("Duplicate database driver"))
            @Expect(e.errorCode, 0)
        }
    }

    /*
     * Test description:
     *     test register of the class driverManager
     * Test API:
     *     public static func register(driverName: String, driver: Driver): Unit
     */
    @TestCase
    func test_drivermanager_register_04(): Unit {
        let driver1 = MyDriver("dr1")
        let driver2 = MyDriver("dr2")
        let string = StringBuilder(r'a', 10000).toString()
        DriverManager.register("", driver1)
        @Expect(DriverManager.getDriver("")?.name, "dr1")
        DriverManager.register("\0", driver2)
        @Expect(DriverManager.getDriver("\0")?.name, "dr2")
        DriverManager.register("#$%^&******", driver1)
        @Expect(DriverManager.getDriver("#$%^&******")?.name, "dr1")
        DriverManager.register("仓颉", driver2)
        @Expect(DriverManager.getDriver("仓颉")?.name, "dr2")
        DriverManager.register(string, driver2)
        @Expect(DriverManager.getDriver(string)?.name, "dr2")
    }

    /*
     * Test description:
     *     test deregister of the class driverManager
     * Test API:
     *     public static func deregister(driverName: String): Unit
     */
    @TestCase
    func test_drivermanager_deregister_05(): Unit {
        DriverManager.deregister("cangjie")
        @Expect(DriverManager.getDriver("cangjie")?.name, None)
    }

    /*
     * Test description:
     *     test deregister of the class driverManager
     * Test API:
     *     public static func deregister(driverName: String): Unit
     */
    @TestCase
    func test_drivermanager_deregister_06(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("cangjie", driver1)
        DriverManager.deregister("cangjie")
        @Expect(DriverManager.getDriver("cangjie")?.name, None)
    }

    /*
     * Test description:
     *     test deregister and getDriver of the class driverManager
     * Test API:
     *     public static func deregister(driverName: String): Unit
     *     public static func getDriver(driverName: String): Option<Driver>
     */
    @TestCase
    func test_drivermanager_deregister_07(): Unit {
        let string = StringBuilder(r'a', 10000).toString()
        DriverManager.deregister("")
        @Expect(DriverManager.getDriver("")?.name, None)
        DriverManager.deregister("\0")
        @Expect(DriverManager.getDriver("\0")?.name, None)
        DriverManager.deregister(string)
        @Expect(DriverManager.getDriver(string)?.name, None)
    }

    /*
     * Test description:
     *     test  drivers of the class driverManager
     * Test API:
     *     public static func drivers(): Array<String>
     */
    @TestCase
    func test_drivermanager_getdrivers_drivers_08(): Unit {
        let string = StringBuilder(r'a', 10000).toString()
        DriverManager.deregister("")
        @Expect(DriverManager.drivers().size, 6)
        DriverManager.deregister("\0")
        @Expect(DriverManager.drivers().size, 6)
        DriverManager.deregister(string)
        @Expect(DriverManager.drivers(),["#$%^&******", "cangjietest", "cangjietest1", "cangjietest2", "cangjietest3", "仓颉"])
    }
}
