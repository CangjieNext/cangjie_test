/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*
import std.convert.*

public struct A <: Hashable & Equatable<A> {
    var name: String = ""
    var age: Int64 = 0
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
        return true
    }
    public operator func !=(that: A): Bool {
        return true
    }
}
func addElementToHashset(counts: Int64, originHashset: HashSet<A>, targetHashset: HashSet<A>): HashSet<A> {
    for (ele in originHashset) {
        targetHashset.put(ele)
    }
    return originHashset
}
func generateHashset(counts: Int64, flag: A): ArrayList<HashSet<A>> {
    var container = ArrayList<HashSet<A>>()
    for (i in 0..counts) {
        container.add(HashSet<A>())
    }
    return container
}
func generatHashSetTarget(counts: Int64, times: Int64, flag: A): (ArrayList<HashSet<A>>, HashSet<A>) {
    var ArrayListSets = generateHashset(times, flag)
    var originHashset = HashSet<A>()
    for (num in 0..counts) {
        originHashset.put(A(num.toString(), num))
    }
    for (ArrayListSet in ArrayListSets) {
        addElementToHashset(counts, originHashset, ArrayListSet)
    }
    return (ArrayListSets, originHashset)
}

let reps = 10
var counts: ArrayList<Int64> = ArrayList<Int64>([2 * 1024, 16 * 1024, 128 * 1024])
func benchmarkRemoveFromHashset(ArrayListSets: ArrayList<HashSet<A>>, target: HashSet<A>, nums: Int64) {
    for (ArrayListSet in ArrayListSets) {
        for (i in target) {
            ArrayListSet.remove(i)
        }
    }
}

func timeBenchmarkRemoveFromHashset(num: Int64) {
    var (containers, data) = generatHashSetTarget(num, reps, A("", 1))
    var startTime = DateTime.now()
    benchmarkRemoveFromHashset(containers, data, num)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toMilliseconds()) / Float64(reps)
    println("BenchmarkRemoveFromHashset_Class_${num.toString()}: ms = ${perTime}")
}

main(): Int64 {
    for (count in counts) {
        timeBenchmarkRemoveFromHashset(count)
    }
    return 0
}
