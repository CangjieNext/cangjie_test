/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not MAC and not OHOS) EXEC: %compiler %cmp_opt %f -o %output



import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.reflect.*
import std.core.*

// debug: true release: false
let inDebug = false
func log(str: String) {
    if (inDebug) {
        print(str)
    }
}


class HashMap {
    let DEFAULT_SIZE = 16

    func calculateCapacity(x: Int64): Int64 {
        if (x >= 1 << 30) {
            return 1 << 30
        }
        if (x == 0) {
            return 16
        }
        var result = x - 1
        result |= result >> 1
        result |= result >> 2
        result |= result >> 4
        result |= result >> 8
        result |= result >> 16
        return result + 1
    }
    
    func computeHashCode(key: Any): Int64 {
        match(key) {
            case bool: Bool => 
                if (bool) {
                    return 1
                } else {
                    return 0
                }
            case number: Int64 => return number
            case double: Float64 => return double.toString().hashCode()
            case string: String =>
                var h = 0
                for (char in string) {
                    h = ((h * 31) + char.hashCode())
                }
                return h
            case _ => return 0
        }

    }
    
    func equals(a: ?Any, b: ?Any): Bool {
        if (TypeInfo.of(a.getOrThrow()) != TypeInfo.of(b.getOrThrow())) {
            return false
        }
        if ((a.getOrThrow() as Int64).isSome()) {
            let aa = a.getOrThrow() as Int64
            let bb = b.getOrThrow() as Int64
            return aa == bb
        } else if (a is Any) {
            if (a.isNone()) {
                return b.isNone()
            } 
        } else {
            return TypeInfo.of(a as Any) == TypeInfo.of(b as Any)

        }
        return false
    }
    
    var capacity:Int64 = 16
    var elementCount:Int64 = 0
    var elementData:ArrayList<?Entry> = ArrayList<?Entry>()
    var loadFactor:Float64 = 0.75
    var modCount:Int64 = 0
    var threshold:Float64 = 0.0
    
    init(capacity!: Int64 = 16, loadFactor!: Float64 = 0.75) {
        this.capacity = calculateCapacity(capacity)
        this.elementCount = 0
        this.elementData  = ArrayList<?Entry>([Option<Entry>.None])
        this.loadFactor = loadFactor
        this.modCount = 0
        computeThreshold()
    }
    
    func computeThreshold() {
        this.threshold = floor(Float64(this.elementData.size) * this.loadFactor)
    }
    
    func clear() {
        if (this.elementCount <= 0) {
            return;
        }
        this.elementCount = 0
        for (i in 0..this.elementData.size) {
            this.elementData[i] = Option<Entry>.None
        }
        this.modCount+=1
    }
    
    func clone():HashMap {
        let result = HashMap(capacity: this.elementData.size, loadFactor: this.loadFactor)
        result.add(all: this)
        return result
    }
    
    func containsValue(value: Any): Bool {
        for (entry in this.elementData) {
            var currentEntry:?Entry = entry
            while (let entry <- currentEntry) {
                if (equals(value, entry.getOrThrow().value)) {
                    return true
                }
                currentEntry = entry.getOrThrow().next
            }
        }
        return false
    }
    
    func entrySet(): EntrySet {
        return EntrySet(this)
    }
    
    func get(key:Any): ?Any {
        let entry = this.getEntry(key)
        
        if (entry.isSome()) {
            return entry.getOrThrow().value
        }
        return Option<Any>.None
    }
    
    func getEntry(key:Any): ?Entry {
        let hash = this.computeHashCode(key)
        let index = hash & (this.elementData.size - 1)
        return this.findKeyEntry(key, index, hash)
    }
    
    func findKeyEntry(key:Any, index:Int64, keyHash: Int64): ?Entry {
        var entry:?Entry 
        if (this.elementData.size == 0) { 
            entry = Option<Entry>.None
        } else {
            entry = this.elementData[index]
        }
        while (entry.isSome() && (entry.getOrThrow().origKeyHash != keyHash || !this.equals(key, entry.getOrThrow().key))) {
            entry = entry.getOrThrow().next
        }
        return entry
    }
    
    func isEmpty(): Bool {
        return this.elementCount == 0
    }
    
    func add(key:Any, value:Any): ?Any {
        let hash = this.computeHashCode(key)
        let index = hash & Int64(this.elementData.size - 1)
        var entry = this.findKeyEntry(key, index, hash)
        if (entry.isNone()) {
            this.modCount += 1
            entry = this.createHashedEntry(key, index, hash)
            this.elementCount += 1
            if (Float64(this.elementCount) > this.threshold) {
                this.rehash(0)
            }
        }
       
        let result = entry.getOrThrow().value
        entry.getOrThrow().value = value
 
        return result
    }
    
    func createHashedEntry(key:Any, index:Int64, hash: Int64): Entry {
        let entry = Entry(key, hash, Option<Any>.None)
        entry.next = this.elementData[index];
        this.elementData[index] = entry;
        return entry
    }
    
    func add(all! :HashMap) {
        if (all.isEmpty()) {
            return
        }
        let iterator = all.entrySet().iterator()
        while (iterator.hasNext()) {
            let entry = iterator.next()
            this.add(entry.getOrThrow().key, entry.getOrThrow().value)
        }
    }
    
    func rehash(capacity: Int64) {
        var aCapacity = capacity
        if (aCapacity <= 0) {
            aCapacity = this.elementData.size
        }
        var length =0
        if (aCapacity != 0) {
            length = calculateCapacity(aCapacity << 1)
        } else { 
            length = calculateCapacity(1)
        }
        var newData = ArrayList<?Entry>(length, {x: Int64 => Option<Entry>.None})
        for (i in 0..this.elementData.size) {
            var entry = this.elementData[i]
            this.elementData[i] = Option<Entry>.None
            var currentEntry = entry
            while ( currentEntry.isSome()) {
                let index = currentEntry.getOrThrow().origKeyHash & (length - 1)
                let next = currentEntry.getOrThrow().next
                if (newData[index].isSome()){
                    currentEntry.getOrThrow().next = newData[index]
                }
                newData[index] = currentEntry
                entry = next
                currentEntry = entry
            }
            
        }
        this.elementData = newData
        this.computeThreshold()
    }
    
    func remove(key:Any): ?Any {
        let entry = this.removeEntryForKey(key)
        if (entry.isNone()) {
            return Option<Any>.None
        }
        return entry.getOrThrow().value
    }
    
    func removeEntry(entry: Entry) {
        let index = entry.origKeyHash & (this.elementData.size - 1)
        var current: ?Entry = this.elementData[index]
        if (current.getOrThrow() == entry) {
            this.elementData[index] = entry.next
        } else {
            while (current.getOrThrow().next.getOrThrow() != entry) {
                current = current.getOrThrow().next
            }
            current.getOrThrow().next = entry.next
        }
        this.modCount += 1
        this.elementCount -= 1
    }
    
    func removeEntryForKey(key: Any): ?Entry {
        let hash = computeHashCode(key)
        let index = hash & (this.elementData.size - 1)
        var entry = this.elementData[index]
        var last: ?Entry = Option<Entry>.None
        while (entry.isSome() && !(entry.getOrThrow().origKeyHash == hash && equals(key, entry.getOrThrow().key))) {
            last = entry
            entry = entry.getOrThrow().next
        }
        if (entry.isNone()) {
            return Option<Entry>.None
        }
        if (last.isNone()) {
            this.elementData[index] = entry.getOrThrow().next
        } else {
            last.getOrThrow().next = entry.getOrThrow().next
        }
        this.modCount += 1
        this.elementCount -= 1
        return entry
    }
    
    func size(): Int64 {
        return this.elementCount
    }
    
    func values(): ValueCollection {
        return ValueCollection(this)
    }
}

class Entry {
    var key:?Any
    var value:?Any
    var origKeyHash:Int64
    var next:?Entry = Option<Entry>.None
    
    init(key: Any, hash: Int64, value: ?Any) {
        this.key = key
        this.value = value
        this.origKeyHash = hash
    }
    
    func clone(): Entry {
        let result = Entry(this.key, this.origKeyHash, this.value)
        let nextEntry = this.next
        if (nextEntry.isSome()) {
            result.next = nextEntry.getOrThrow().clone()
        }
        return result
    }
    func toString(): String {
        return "${this.key.getOrThrow() as String} = ${this.value.getOrThrow() as String}"
        
    }
    func getKey(): Any {
        return this.key
    }
    func getValue(): Any {
        return this.value
    }

    operator func ==(another: Entry): Bool {
        match(this) {
            case another => return true
            case _ => return false
        }
    }
    
    operator func !=(another: Entry): Bool {
        match(this) {
            case another => return false
            case _ => return true
        }
    }


}

open class AbstractMapIterator {
    var associatedMap: ?HashMap = Option<HashMap>.None
    var expectedModCount: Int64 = 0
    var futureEntry: ?Entry = Option<Entry>.None
    var currentEntry: ?Entry = Option<Entry>.None
    var prevEntry: ?Entry = Option<Entry>.None
    var position: Int64 = 0
    
    init(map: HashMap) {
        this.associatedMap = map
        this.expectedModCount = map.modCount
    }
    
    func hasNext(): Bool {
        if (this.futureEntry.isSome()) {
            return true
        }
        var tmp_size = 0
        if (this.associatedMap.getOrThrow().elementData.size > 0){
            tmp_size = this.associatedMap.getOrThrow().elementData.size
        }
        while (this.position < tmp_size) {
            if (this.associatedMap.getOrThrow().elementData[this.position].isNone()) {
		this.position += 1
            } else {
	        return true
	    }
        }
        return false
    }
    
    func checkConcurrentMod() {
        if (this.expectedModCount != this.associatedMap.getOrThrow().modCount) {
            throw Exception("Concurrent HashMap modification detected")
        }
    }
    func makeNext() {
        this.checkConcurrentMod()
        if (!this.hasNext()) {
            throw Exception("No such element")
        }
        if (this.futureEntry.isNone()) {
            this.currentEntry = this.associatedMap.getOrThrow().elementData[this.position]
            this.position += 1
            this.futureEntry = this.currentEntry.getOrThrow().next
            this.prevEntry = Option<Entry>.None
            return
        }
        if (this.currentEntry.isSome()) {
            this.prevEntry = this.currentEntry
        }
        this.currentEntry = this.futureEntry
        this.futureEntry = this.futureEntry.getOrThrow().next
    }
    
    func remove() {
        this.checkConcurrentMod()
        if (this.currentEntry.isNone()) {
            throw Exception("Illegal state")
        }
        if (this.prevEntry.isNone())  {
            var index = 0
            if (this.associatedMap.getOrThrow().elementData.size > 1) {
                let index = this.currentEntry.getOrThrow().origKeyHash & ((this.associatedMap.getOrThrow().elementData.size) - 1)
            }
            var current = this.associatedMap.getOrThrow().elementData[index]
            current = current.getOrThrow().next
        } else {
            this.prevEntry.getOrThrow().next = this.currentEntry.getOrThrow().next
        }
        this.currentEntry = Option<Entry>.None
        this.expectedModCount += 1
        this.associatedMap.getOrThrow().modCount += 1
        this.associatedMap.getOrThrow().elementCount -= 1
    }
}


open class ValueIterator <: AbstractMapIterator {
     func next(): ?Entry {
        this.makeNext()
        return this.currentEntry
    }
    public ValueIterator(map : HashMap) {
        super(map)
    }
}

class EntrySet {
    var associatedMap:HashMap
    
    init(map:HashMap) {
        this.associatedMap = map
    }
    
    func size(): Int64 {
        return this.associatedMap.elementCount
    }
    
    func clear() {
        this.associatedMap.clear()
    }
    
    func iterator() : ValueIterator {
        return ValueIterator(this.associatedMap)
    }
}

class ValueCollection {
    var associatedMap:HashMap
    
    init(map:HashMap) {
        this.associatedMap = map
    }
    
    func contains(object: Any): Bool {
        return this.associatedMap.containsValue(object)
    }
    
    func size(): Int64 {
        return this.associatedMap.elementCount
    }
    
    func clear() {
        this.associatedMap.clear()
    }
    
    func iterator(): ValueIterator {
        return ValueIterator(this.associatedMap)
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    func run() {
        let map = HashMap()
        let COUNT = 90000
        for (i in 0..COUNT) {
            map.add(i, 42)
        }
        var result = 0
        for (_ in 0..5) {
            for (i in 0..COUNT) {
                result += (map.get(i).getOrThrow() as Int64).getOrThrow()
           
            }
        }
        
        var keySum:Int64 = 0
        var valueSum:Int64 = 0
        let iterator = map.entrySet().iterator()
        while (iterator.hasNext()) {
            let entry = iterator.next()
            keySum = keySum + (entry.getOrThrow().key.getOrThrow() as Int64).getOrThrow()
            valueSum = valueSum + (entry.getOrThrow().value.getOrThrow() as Int64).getOrThrow()
        }
    }
    
    /*
    * @Benchmark
    */
    func runIteration() {
        let startTime = Timer().getTime()
        for (_ in 0..20) {
            run()
        }
        let endTime = Timer().getTime()
        println("hash-map: ms =  ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
    }
}

main() {
    Benchmark().runIteration();
}


class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }

}


