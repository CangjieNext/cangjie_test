/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package stub_utils

import std.collection.*

public class PreviewManager {
    public PreviewManager(private let bookDB: BookDB) {}

    public func getPreview(id: BookId): String {
        let extractBegin = bookDB.getText(id).indexOf("Chapter 1") ?? return "Preview not available"
        let extractEnd = bookDB.getText(id).indexOf("Chapter 2") ?? return "Preview not available"
        return bookDB.getText(id)[extractBegin..(extractEnd - extractBegin)]
    }
}

public struct MyStruct <: ToString & Equatable<MyStruct> {
    private let x: String
    public init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is MyStruct (${x})"
    }

    public operator func ==(other: MyStruct) {
        return this.x == other.x
    }

    public operator func !=(other: MyStruct) {
        return this.x != other.x
    }
}

public open class ReturnTypes {
    public open func getStruct(): MyStruct {
        return MyStruct("")
    }

    public open func getInt(): Int64 {
        return 42
    }

    public open func getIntByInt(arg: Int64): Int64 {
        return arg
    }

    public open func getClass(): Base {
        return Base()
    }
}

public open class BookId {}

public open class BookDB {
    public open func getText(BookId: BookId): String {
        // access DB, download from storage, load file, etc...
        return ""
    }

    public open func x(): String {
        return "5"
    }

    public open func get(b: Base): String {
        return ""
    }

    public open func getA(a: A): String {
        return ""
    }

    public open func y(a: Base, b: Base): String {
        return ""
    }

    public open func processList(listOfStrings: ArrayList<String>): String {
        return ""
    }

    public open func byStruct(arg: MyStruct): String {
        return ""
    }

    public open func byInt(i: Int64): String {
        return ""
    }

    public open func byInt(i: Int64, j: Int64, k: Int64): String {
        return ""
    }

    public open func getClass(b: Base): Base {
        return Base()
    }
}

public open class Base <: ToString {
    public open func toString(): String {
        return "Just base"
    }
}

public open class B <: Base {}

public open class A <: Base & Equatable<A> & ToString {
    public A(public let n: Int64) {}

    public open operator func ==(other: A) {
        return this.n == other.n
    }

    public open operator func !=(other: A) {
        return this.n != other.n
    }

    public open func toString(): String {
        return "n = ${n}"
    }
}
