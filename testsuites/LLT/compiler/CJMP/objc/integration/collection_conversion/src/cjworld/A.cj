// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package cjworld

import std.collection.*
import std.runtime.*
import objc.lang.*

@ObjCImpl
public class A <: NSObject {
    static let markerList = ArrayList<GCMarker>()

    @ForeignName["testWithDict:"]
    public static func testWithDict(nsDict: ?NSDictionary): ?NSDictionary {
        println("cj: A.testWithDict()")
        let marker = GCMarker()
        markerList.add(marker)

        let nsDictUnwrapped = nsDict.getOrThrow()
        println("cj: initial NSDictionary ${nsDictUnwrapped.toString()}")

        let hs = toHashMap(nsDictUnwrapped, {k: ObjCId => (k as NSString).getOrThrow().toString()},
        {v: ObjCId => (v as NSNumber).getOrThrow().longLongValue()})
        println("cj: converted to HashMap ${hs}")

        let nsBack = toNSDictionary(hs, {s => NSString(s)}, {v => NSNumber.initWithLongLong(v)})
        println("cj: converted back to NSDictionary ${nsBack.toString()}")

        markerList.remove(at: 0)
        gc()
    
        nsBack
    }

    public static func testHashMap(): NSDictionary {
        println("cj: A.testHashMap()")
        let marker = GCMarker()
        markerList.add(marker)

        let hs = HashMap([("first", 1), ("asdsad", 0), ("", -100500)])
        println("cj: initial HashMap ${hs}")
        
        let ns = toNSDictionary(hs, {s => NSString(s)}, {v => NSNumber.initWithLongLong(v)})
        println("cj: converted to NSDictionary ${ns.toString()}")
        
        let hsBack = toHashMap(ns, {k: ObjCId => (k as NSString).getOrThrow().toString()},
        {v: ObjCId => (v as NSNumber).getOrThrow().longLongValue()})
        println("cj: converted back to HashMap ${hsBack}")

        markerList.remove(at: 0)
        gc()

        ns
    }
}

func toHashMap<K, V>(nsDict: NSDictionary, keyConverter: (ObjCId) -> K,
    valueConverter: (ObjCId) -> V): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let res = HashMap<K, V>(Int64(nsDict.count()))
    let block = ObjCBlock<(ObjCId, ObjCId, ObjCPointer<Bool>) -> Unit>({
        k, v, _ => 
        let cjK = keyConverter(k)
        let cjV = valueConverter(v)
        res.add(cjK, cjV);
    })
    nsDict.enumerateKeysAndObjectsUsingBlock(block)
    res
}

func toNSDictionary<K, V, C, MirrorK, MirrorV>(collection: C, keyConverter: (K) -> MirrorK,
    valueConverter: (V) -> MirrorV): NSDictionary where C <: Collection<(K, V)>, MirrorK <: NSString, MirrorV <: ObjCId {
    let res = NSMutableDictionary(UInt64(collection.size))

    for ((k, v) in collection) {
        let nsK = keyConverter(k)
        let nsV = valueConverter(v)
        res.setValueForKey(nsV, nsK)
    }

    res
}