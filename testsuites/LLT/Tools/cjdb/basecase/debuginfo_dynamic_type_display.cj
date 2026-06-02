// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

public type Properties = HashMap<String, MetaValue>

public interface MetaValue <: ToString {
    func equals(that: MetaValue): Bool
}

extend String <: MetaValue {
    public func equals(that: MetaValue): Bool {
        match (that) {
            case that: String => (this == that)
            case _ => false
        }
    }
}

extend Byte <: MetaValue {
    public func equals(that: MetaValue): Bool {
        match (that) {
            case that: Byte => (this == that)
            case _ => false
        }
    }
}

extend<T> ArrayList<T> <: MetaValue where T <: MetaValue {
    public func equals(that: MetaValue): Bool {
        return true
    }
}

extend<K, V> HashMap<K, V> <: MetaValue where K <: MetaValue, V <: MetaValue {
    public func equals(that: MetaValue): Bool {
        return true
    }
}

extend<T> HashSet<T> <: MetaValue where T <: MetaValue {
    public func equals(that: MetaValue): Bool {
        return true
    }
}

extend<T> Array<T> <: MetaValue where T <: MetaValue {
    public func equals(that: MetaValue): Bool {
        return true
    }
}


public class MetaList<T> <: Collection<T> & MetaValue where T <: MetaValue {
    private let _list: ArrayList<T>

    public MetaList(list!: ArrayList<T>) {
        this._list = list
    }

    public init() {
        this(list: ArrayList<T>())
    }
    public prop size: Int64 {
        get() {
            _list.size
        }
    }
    public func isEmpty(): Bool {
        _list.isEmpty()
    }
    public func iterator(): Iterator<T> {
        _list.iterator()
    }
    public func equals(that: MetaValue): Bool {
        return true
    }
    public func toString(): String {
        "MetaList"
    }
}

extend<T> MetaList<T> where T <: Comparable<T> {

}

public abstract class MetaObjectImpl<T>
{
    public let properties: Properties
    public init() {
        this(Properties())
    }
    public init(properties: Properties) {
        this.properties = properties
    }
    public func getProperties(): Properties {
        properties
    }
    public func setProperty(name: String, value: MetaValue): Unit {
        properties.add(name, value)
    }
}

public class Detail <: MetaObjectImpl<Detail> {
    protected init(properties: Properties) {
        super(properties)
    }

    public init() {
        this(Properties())
    }

    public mut prop employeeNumber: String {
        get () { properties["employeeNumber"].toString() }
        set(value) { setProperty("employeeNumber", value) }
    }

    public mut prop mlist: ArrayList < String > {
        get() { ArrayList < String >(["l1", "l2"]) }
        set(value) { setProperty("mlist", value) }
    }
    public mut prop mBlob: ArrayList < Byte > {
        get() { ArrayList < Byte >([0, 1]) }
        set(value) { setProperty("mBlob", value) }
    }
    public mut prop mMap: HashMap<String, String>{
        get() { HashMap<String, String>([("m1", "m2")]) }
        set(value) { setProperty("mMap", value) }
    }
    public mut prop mSet: HashSet<String>{
        get() { HashSet<String>(["m1", "m2"]) }
        set(value) { setProperty("mSet", value) }
    }
    public mut prop mMetaList: MetaList<String> {
        get() { MetaList<String>() }
        set(value) { setProperty("mMetaList", value) }
    }
}

main() {
    var detail = Detail()
    var l =  ArrayList < String >(["l1", "l2"])
    detail.mlist = ArrayList < String >(["l1", "l2"])
    let ml = detail.mlist
    detail.mBlob = ArrayList < Byte >([0, 1])
    let mm = detail.mMap
    detail.mMap = HashMap<String, String>([("m1", "m2")])
    detail.mSet = HashSet<String>(["m1", "m2"])
    detail.mMetaList = MetaList< String >(list: l)
    detail.employeeNumber = "prop"
    var b = detail.properties["employeeNumber"];
    return 0;
}
