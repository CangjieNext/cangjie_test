/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

/*
 * Test description: Test security fixes in connection pool
 * Test Cases:
 *   1. HIGH-01: Connection pool exhaustion fix - entryCount should decrement on createEntry failure
 *   2. HIGH-02: PooledDatasource.close() double-close fix - concurrent close should be safe
 *   3. MEDIUM-03: ProxyConnection.close() TOCTOU fix - concurrent connection close should be safe
 */

import std.database.sql.*
import std.collection.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

let _ = {
    =>
    DriverManager.register("test_security", FailingDriver())
    DriverManager.register("test_concurrent", ConcurrentDriver())
}()

class FailingDriver <: Driver {
    public prop name: String {
        get() { "test_security" }
    }
    public prop version: String {
        get() { "1.0.0" }
    }
    public prop preferredPooling: Bool {
        get() { true }
    }
    public func open(_: String, _: Array<(String, String)>): Datasource {
        return FailingDatasource()
    }
}

class FailingDatasource <: Datasource {
    let closed = AtomicBool(false)
    let failCount = AtomicInt32(0)
    
    public func close(): Unit {
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public func setOption(_: String, _: String): Unit {}
    public func connect(): Connection {
        failCount.fetchAdd(1)
        throw SqlException("Simulated connection failure")
    }
}

class ConcurrentDriver <: Driver {
    public prop name: String {
        get() { "test_concurrent" }
    }
    public prop version: String {
        get() { "1.0.0" }
    }
    public prop preferredPooling: Bool {
        get() { true }
    }
    public func open(_: String, _: Array<(String, String)>): Datasource {
        return ConcurrentDatasource()
    }
}

class ConcurrentDatasource <: Datasource {
    let closed = AtomicBool(false)
    let closeCount = AtomicInt32(0)
    
    public func close(): Unit {
        closeCount.fetchAdd(1)
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public func setOption(_: String, _: String): Unit {}
    public func connect(): Connection {
        return ConcurrentConnection()
    }
}

class ConcurrentConnection <: Connection {
    let closed = AtomicBool(false)
    let closeCount = AtomicInt32(0)
    
    public func close(): Unit {
        closeCount.fetchAdd(1)
        closed.store(true)
    }
    public func isClosed(): Bool {
        closed.load()
    }
    public prop state: ConnectionState {
        get() { ConnectionState.Connected }
    }
    public func prepareStatement(_: String): Statement {
        return DummyStatement()
    }
    public func createTransaction(): Transaction {
        throw UnsupportedException()
    }
    public func getMetaData(): Map<String, String> {
        return HashMap([("k", "v")])
    }
}

class DummyStatement <: Statement {
    let closed = AtomicBool(false)
    public func close(): Unit { closed.store(true) }
    public func isClosed(): Bool { closed.load() }
    public func setOption(_: String, _: String): Unit {}
    public prop parameterColumnInfos: Array<ColumnInfo> { get() { [] } }
    public func update(_: Array<SqlDbType>): UpdateResult { DummyUpdateResult() }
    public func query(_: Array<SqlDbType>): QueryResult { DummyQueryResult() }
    @When[backend == "cjnative"]
    public func set<T>(index: Int, value: T): Unit {}
    public func setNull(index: Int): Unit {}
    public func update(): UpdateResult { DummyUpdateResult() }
    public func query(): QueryResult { DummyQueryResult() }
}

class DummyUpdateResult <: UpdateResult {
    public prop rowCount: Int64 { get() { 0 } }
    public prop lastInsertId: Int64 { get() { 0 } }
}

class DummyQueryResult <: QueryResult {
    let closed = AtomicBool(false)
    public func close(): Unit { closed.store(true) }
    public func isClosed(): Bool { closed.load() }
    public prop columnInfos: Array<ColumnInfo> { get() { [] } }
    public func next(_: Array<SqlDbType>): Bool { false }
    public func next(): Bool { false }
    @When[backend == "cjnative"]
    public func get<T>(index: Int): T { ArrayList<T>()[0] }
    @When[backend == "cjnative"]
    public func getOrNull<T>(index: Int): ?T { None }
}

@Test
class TestConnectionPoolSecurityFixes {
    
    @TestCase
    func testPoolExhaustionOnCreateFailure(): Unit {
        let drv = DriverManager.getDriver("test_security") ?? return
        let ds = drv.open("") as FailingDatasource ?? return
        let pool = PooledDatasource(ds)
        pool.maxSize = 5
        
        var failureCount = 0
        for (i in 0..10) {
            try {
                pool.connect()
            } catch (e: SqlException) {
                failureCount++
            }
        }
        
        @Expect(failureCount, 10)
        
        pool.close()
        ds.close()
    }
    
    @TestCase
    func testConcurrentPooledDatasourceClose(): Unit {
        let drv = DriverManager.getDriver("test_concurrent") ?? return
        let ds = drv.open("") as ConcurrentDatasource ?? return
        let pool = PooledDatasource(ds)
        
        pool.maxSize = 5
        
        let connections = ArrayList<Connection>()
        for (i in 0..3) {
            connections.add(pool.connect())
        }
        
        for (conn in connections) {
            conn.close()
        }
        
        let counter = AtomicInt32(0)
        let barrier = Barrier(11)
        
        for (i in 0..10) {
            spawn {
                pool.close()
                counter.fetchAdd(1)
                barrier.wait()
            }
        }
        
        barrier.wait()
        
        @Expect(pool.isClosed(), true)
        @Expect(counter.load(), 10)
        
        ds.close()
    }
    
    @TestCase
    func testConcurrentProxyConnectionClose(): Unit {
        let drv = DriverManager.getDriver("test_concurrent") ?? return
        let ds = drv.open("")
        let pool = PooledDatasource(ds)
        
        pool.maxSize = 5
        let conn = pool.connect()
        
        let counter = AtomicInt32(0)
        let barrier = Barrier(11)
        
        for (i in 0..10) {
            spawn {
                conn.close()
                counter.fetchAdd(1)
                barrier.wait()
            }
        }
        
        barrier.wait()
        
        @Expect(conn.isClosed(), true)
        @Expect(counter.load(), 10)
        
        pool.close()
        ds.close()
    }
    
    @TestCase
    func testMultipleCloseSafe(): Unit {
        let drv = DriverManager.getDriver("test_concurrent") ?? return
        let ds = drv.open("")
        let pool = PooledDatasource(ds)
        
        pool.close()
        pool.close()
        pool.close()
        
        @Expect(pool.isClosed(), true)
        
        ds.close()
    }
}
