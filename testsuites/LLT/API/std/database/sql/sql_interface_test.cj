/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description:  Test the interface for sql package
 * Test API: public interface Connection
 *           public interface UpdateResult
 */

internal import std.database.sql.*
internal import std.collection.*
internal import std.sync.*

let _ = {
    =>
    DriverManager.register("postgres", MyDriver("postgres"))
    DriverManager.register("opengauss", MyDriver("opengauss"))
}()

public class MyDriver <: Driver {
    private var scheme = "postgres"
    public init(scheme: String) {
        this.scheme = scheme.toAsciiLower()
    }
    public prop name: String {
        get() {
            return "opengauss"
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
    public func open(connstr: String, opts: Array<(String, String)>): Datasource {
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

    public func setOption(key: String, value: String): Unit {}

    public func connect(): Connection {
        return MySqlConnection()
    }
}

public class MySqlConnection <: Connection {
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
    public func prepareStatement(sql: String): Statement {
        return MyStmt()
    }
    public func createTransaction(): Transaction {
        throw Exception("The function is not implemented temporarily.")
    }
    public func getMetaData(): Map<String, String> {
        return HashMap([])
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
    public func setOption(key: String, value: String): Unit {}
    public prop parameterColumnInfos: Array<ColumnInfo> {
        get() {
            []
        }
    }
    public func update(params: Array<SqlDbType>): UpdateResult {
        return MySqlUpdateResult()
    }
    public func query(params: Array<SqlDbType>): QueryResult {
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
    public func next(values: Array<SqlDbType>): Bool {
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

main(): Int64 {
    try {
        throw SqlException("test ex", "00000", 0)
    } catch (e: SqlException) {
        if (e.toString() != "SqlException: test ex, SqlState: 00000, errorCode: 0") {
            eprintln("err")
            return -1
        }
    }

    let drv = DriverManager.getDriver("opengauss") ?? return -1
    let ds = drv.open("")
    let conn = ds.connect()
    let stmt = conn.prepareStatement("select 1")

    var a = stmt.update()
    if (a.rowCount != 10 || a.lastInsertId != -127) {
        return 1
    }
    var b = stmt.query()
    if (b.isClosed()) {
        return 2
    }
    b.next()
    stmt.close()
    conn.close()
    ds.close()
    return 0
}
