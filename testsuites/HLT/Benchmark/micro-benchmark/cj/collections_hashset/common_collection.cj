/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*

var types: ArrayList<String> = ArrayList<String>(["String", "Int64", "Float64", "Class"])
var typesHashMap: ArrayList<String> = ArrayList<String>(["String_Int64", "Float64_Int64", "Class_Int64"])

public struct A <: Hashable & Equatable<A> &ToString {
    var name : String = ""
    var age : Int64 = 0

    public init(name: String, age: Int64) {
        this.name = name
        this.age = age
    }
    public func hashCode(): Int64 {
        var dfh: DefaultHasher = DefaultHasher()
        dfh.write(name)
        dfh.write(age)
        return dfh.finish()
    }
    public operator func ==(that: A): Bool {
        return age == that.age && name == that.name
    }
    public operator func !=(that: A): Bool {
        return ! (this == that)
    }
    public func toString() : String {
        return "[${name}:${age}:${hashCode()}]"
    }
}

//Generate a ArrayList<ArrayList<T>>. The ArrayList contains {$counts} ArrayList<T> ,T is determined based on the flag.
func generate_arraylist(counts: Int64, flag: String): ArrayList<ArrayList<String>> {
    var container = ArrayList<ArrayList<String>>()
    for (i in 0..counts) {
        container.add(ArrayList<String>())
    }
    return container
}
func addelementToArraylist(counts: Int64, targetArraylist: ArrayList<String>) {
    for (num in 0..counts) {
        targetArraylist.add(num.toString())
    }
}

//Generate a ArrayList<ArrayList<T>>. The ArrayList contains {$times} ArrayList<String> and each ArrayList<String> contains {$counts} elements.,T is determined based on the flag.
func generatArraylistTarget(counts: Int64, times: Int64, flag: String): ArrayList<ArrayList<String>> {
    var bufArraylists = generate_arraylist(times, flag)
    for (bufArraylist in bufArraylists) {
        addelementToArraylist(counts, bufArraylist)
    }
    return bufArraylists
}

//Generate a ArrayList<HashMap<k,v>>. The ArrayList contains {$counts} HashMap<k,v>,K is determined based on the keyFlag.v is determined based on the valueFlag
func generateHashMap(counts: Int64, keyFlag: String, valueFlag: Int64): ArrayList<HashMap<String, Int64>> {
    var container = ArrayList<HashMap<String, Int64>>()
    for (i in 0..counts) {
        container.add(HashMap<String, Int64>())
    }
    return container
}
func generateHashMap(counts: Int64, keyFlag: Float64, valueFlag: Int64): ArrayList<HashMap<Float64, Int64>> {
    var container = ArrayList<HashMap<Float64, Int64>>()
    for (i in 0..counts) {
        container.add(HashMap<Float64, Int64>())
    }
    return container
}
func generateHashMap(counts: Int64, keyFlag: A, valueFlag: Int64): ArrayList<HashMap<A, Int64>> {
    var container = ArrayList<HashMap<A, Int64>>()
    for (i in 0..counts) {
        container.add(HashMap<A, Int64>())
    }
    return container
}

//Add {$counts} elements(K*V) to a HashMap<K*V>
func addElementToHashMap(counts: Int64, target: HashMap<String, Int64>) {
    for (key in 0..counts) {
        target.add(key.toString(), key)
    }
}
func addElementToHashMap(counts: Int64, target: HashMap<Float64, Int64>) {
    for (key in 0..counts) {
        target.add(Float64(key), key)
    }
}
func addElementToHashMap(counts: Int64, target: HashMap<A, Int64>) {
    for (key in 0..counts) {
        target.add(A(key.toString(), key), key)
    }
}

//Generate a ArrayList<HashMap<K,V>>. The ArrayList contains {$times} HashMap<K,V> and each HashMap<K,V> contains {$counts} elements(K*V),K is determined based on the keyFlag.v is determined based on the valueFlag
func generatHashMapTarget(counts: Int64, times: Int64, keyFlag: String, valueFlag: Int64): ArrayList<HashMap<String,
    Int64>> {
    var containers = generateHashMap(times, keyFlag, valueFlag)
    for (container in containers) {
        addElementToHashMap(counts, container)
    }
    return containers
}
func generatHashMapTarget(counts: Int64, times: Int64, keyFlag: Float64, valueFlag: Int64): ArrayList<HashMap<Float64,
    Int64>> {
    var containers = generateHashMap(times, keyFlag, valueFlag)
    for (container in containers) {
        addElementToHashMap(counts, container)
    }
    return containers
}
func generatHashMapTarget(counts: Int64, times: Int64, keyFlag: A, valueFlag: Int64): ArrayList<HashMap<A, Int64>> {
    var containers = generateHashMap(times, keyFlag, valueFlag)
    for (container in containers) {
        addElementToHashMap(counts, container)
    }
    return containers
}


//Generate a HashSet<T> containing {$counts} elements, T is determined based on the flag.
//Also returns list, containint keys for testing, both belonging and not belonging to the set
func generatHashSetTarget(counts: Int64, flag: String): (HashSet<String>, ArrayList<String>) {
    var keys = ArrayList<String>()
    for (num in 0..counts) {
        keys.add(num.toString())
    }
    var hashSet = HashSet<String>()
    hashSet.add(all: keys)
    for (num in counts..counts*2) {
        keys.add(num.toString())
    }
    return (hashSet, keys)
}
func generatHashSetTarget(counts: Int64, flag: Int64): (HashSet<Int64>, ArrayList<Int64>) {
    var keys = ArrayList<Int64>()
    for (num in 0..counts) {
        keys.add(num)
    }
    var hashSet = HashSet<Int64>()
    hashSet.add(all: keys)
    for (num in counts..counts*2) {
        keys.add(num)
    }
    return (hashSet, keys)
}
func generatHashSetTarget(counts: Int64, flag: Float64): (HashSet<Float64>, ArrayList<Float64>) {
    var keys = ArrayList<Float64>()
    for (num in 0..counts) {
        keys.add(Float64(num))
    }
    var hashSet = HashSet<Float64>()
    hashSet.add(all: keys)
    for (num in counts..counts*2) {
        keys.add(Float64(num))
    }
    return (hashSet, keys)
}
func generatHashSetTarget(counts: Int64, flag: A): (HashSet<A>, ArrayList<A>) {
    var keys = ArrayList<A>()
    for (num in 0..counts) {
        keys.add(A(num.toString(), num))
    }
    var hashSet = HashSet<A>()
    hashSet.add(all: keys)
    for (num in counts..counts*2) {
        keys.add(A(num.toString(), num))
    }
    return (hashSet, keys)
}

//Generate a HashSet<T> containing {$counts} elements, T is determined based on the flag.
func generatHashSet(counts: Int64, flag: String): HashSet<String> {
    var hashSet = HashSet<String>()
    for (num in 0..counts) {
        hashSet.add(num.toString())
    }
    return hashSet
}
func generatHashSet(counts: Int64, flag: Int64): HashSet<Int64> {
    var hashSet = HashSet<Int64>()
    for (num in 0..counts) {
        hashSet.add(num)
    }
    return hashSet
}
func generatHashSet(counts: Int64, flag: Float64): HashSet<Float64> {
    var hashSet = HashSet<Float64>()
    for (num in 0..counts) {
        hashSet.add(Float64(num))
    }
    return hashSet
}
func generatHashSet(counts: Int64, flag: A): HashSet<A> {
    var hashSet = HashSet<A>()
    for (num in 0..counts) {
        hashSet.add(A(num.toString(), num))
    }
    return hashSet
}
