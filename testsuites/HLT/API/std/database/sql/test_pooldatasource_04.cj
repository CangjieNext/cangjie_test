/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.database.sql.*
import std.time.*
import std.collection.*
import std.sync.*
import std.math.*

public class MyDriver <: Driver {
    private var scheme = "postgres"
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
        return MyDatasource()
    }
}

public class MyDatasource <: Datasource {
    let closed = AtomicBool(false)
    public func close(): Unit {
        if (isClosed()) {
            return
        }
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }

    public func setOption(_: String, _: String): Unit {}

    public func connect(): Connection {
        return MyConnection()
    }
}

public class MyConnection <: Connection {
    let closed = AtomicBool(false)
    public func close(): Unit {
        if (isClosed()) {
            return
        }
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public prop state: ConnectionState {
        get() {
            return ConnectionState.Connected
        }
    }
    public func prepareStatement(_: String): Statement {
        return MyStmt()
    }
    public func createTransaction(): Transaction {
        throw UnsupportedException()
    }
    public func getMetaData(): Map<String, String> {
        return HashMap([("k", "v")])
    }
}

public class MyStmt <: Statement {
    let closed = AtomicBool(false)
    public func close(): Unit {
        if (isClosed()) {
            return
        }
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public func setOption(_: String, _: String): Unit {}
    public prop parameterColumnInfos: Array<ColumnInfo> {
        get() {
            []
        }
    }
    public func update(_: Array<SqlDbType>): UpdateResult {
        return MySqlUpdateResult()
    }
    public func query(_: Array<SqlDbType>): QueryResult {
        return MyRows()
    }

    @When[backend == "cjnative"]
    public func set<T>(index: Int, value: T): Unit {}

    public func setNull(index: Int): Unit {}
    public func update(): UpdateResult {
        return MySqlUpdateResult()
    }
    public func query(): QueryResult {
        return MyRows()
    }
}

public class MySqlUpdateResult <: UpdateResult {
    public prop rowCount: Int64 {
        get() {
            10
        }
    }
    public prop lastInsertId: Int64 {
        get() {
            -127
        }
    }
}

public class MyRows <: QueryResult {
    let closed = AtomicBool(false)
    public func close(): Unit {
        if (isClosed()) {
            return
        }
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public prop columnInfos: Array<ColumnInfo> {
        get() {
            []
        }
    }
    public func next(_: Array<SqlDbType>): Bool {
        close()
        true
    }
    public func next(): Bool {
        close()
        true
    }

    @When[backend == "cjnative"]
    public func get<T>(index: Int): T {
        var valueList = ArrayList<T>()
        return valueList[index]
    }

    @When[backend == "cjnative"]
    public func getOrNull<T>(index: Int): ?T {
        return None
    }
}

@Test
class Test_PooledDatasource_03 {
    /*
     * Test description:
     *     test time of the class PooledDatasource
     * Test API:
     *     public mut prop idleTimeout: Duration
     *     public mut prop maxLifeTime: Duration
     *     public mut prop connectionTimeout: Duration
     *     public mut prop keepaliveTime: Duration
     */
    @TestCase
    func test_pooldatasource_time_01(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest", driver1)
        let driver = DriverManager.getDriver("datasourcetest") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)

        pool.idleTimeout = Duration.Zero
        @Expect(pool.idleTimeout, Duration.Zero)
        pool.maxLifeTime = Duration.Max
        @Expect(pool.maxLifeTime, Duration.Max)
        try {
            pool.connectionTimeout = Duration.Min
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in millisecond exceeds the range of 'Int64'.")
        }
        pool.keepaliveTime = Duration.nanosecond
        @Expect(pool.keepaliveTime, Duration.nanosecond)
        ds.close()
    }

    /*
     * Test description:
     *     test time of the class PooledDatasource
     * Test API:
     *     public mut prop maxSize: Int32
     *     public mut prop maxIdleSize: Int32
     */
    @TestCase
    func test_pooldatasource_size_02(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest1", driver1)
        let driver = DriverManager.getDriver("datasourcetest1") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)

        pool.maxSize = -1
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 0
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 100
        @Expect(pool.maxSize, 100)
        pool.maxIdleSize = -1
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 0
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 1000
        @Expect(pool.maxIdleSize, 1000)
        ds.close()
    }

    /*
     * Test description:
     *     test connect of the class PooledDatasource
     * Test API:
     *     public func connect(): Connection
     */
    @TestCase
    func test_pooldatasource_size_03(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest2", driver1)
        let driver = DriverManager.getDriver("datasourcetest2") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)
        pool.connect()

        pool.maxSize = -2147483648
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 0
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 2147483646
        @Expect(pool.maxSize, 2147483646)
        pool.maxIdleSize = -2147483648
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 0
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 2147483646
        @Expect(pool.maxIdleSize, 2147483646)
    }

    /*
     * Test description:
     *     test connect of the class PooledDatasource
     * Test API:
     *     public func connect(): Connection
     */
    @TestCase
    func test_pooldatasource_connect_04(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest3", driver1)
        let driver = DriverManager.getDriver("datasourcetest3") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)
        pool.setOption("datasourcekey", "datasourcevalue")
        var conn = pool.connect()

        pool.maxSize = -2147483648
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 0
        @Expect(pool.maxSize, 2147483647)
        pool.maxSize = 2147483646
        @Expect(pool.maxSize, 2147483646)
        pool.maxIdleSize = -2147483648
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 0
        @Expect(pool.maxIdleSize, 2147483647)
        pool.maxIdleSize = 2147483646
        @Expect(pool.maxIdleSize, 2147483646)
        @Expect(conn.state == Connected, true)
        @Expect(conn.getMetaData().get("k"), "v")
    }

    /*
     * Test description:
     *     test close and isClosed of the class PooledDatasource
     * Test API:
     *     public func isClosed(): Bool
     *     public func close(): Unit
     */
    @TestCase
    func test_pooldatasource_close_05(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest4", driver1)
        let driver = DriverManager.getDriver("datasourcetest4") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)
        @Expect(pool.isClosed(), false)
        pool.close()
        @Expect(pool.isClosed(), true)
    }

    /*
     * Test description:
     *     test connect of the class PooledDatasource using the timeout
     * Test API:
     *     public func connect(): Connection
     */
    @TestCase
    func test_pooldatasource_connect_timeout_06(): Unit {
        let driver1 = MyDriver("dr1")
        DriverManager.register("datasourcetest5", driver1)
        let driver = DriverManager.getDriver("datasourcetest5") ?? return
        let ds = driver.open("")
        let pool = PooledDatasource(ds)
        pool.connectionTimeout = Duration.second * 3
        spawn {
            let conn = pool.connect()
            sleep(Duration.second * 5)
            conn.close()
        }
        pool.close()
        ds.close()
    }
}
