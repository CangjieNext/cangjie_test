/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.time.*
import std.collection.*
import std.regex.*
import std.random.*

class RegexKey <: Hashable & Equatable<RegexKey> {
    RegexKey(let regexStr: String) {}

    @OverflowWrapping
    public func hashCode(): Int64 {
        regexStr.hashCode()
    }

    public operator func ==(rhs: RegexKey): Bool {
        this.regexStr == rhs.regexStr
    }

    public operator func !=(rhs: RegexKey): Bool {
        !(this == rhs)
    }
}

class RegexNode<T> {
    var key: ?RegexKey = None
    var value: ?T = None
    var prev: ?RegexNode<T> = None
    var next: ?RegexNode<T> = None

    init() {}

    init(key: RegexKey, value: T) {
        this.key = key
        this.value = value
    }

    operator func ==(rhs: RegexNode<T>): Bool {
        return match((this.key, rhs.key)) {
            case (Some(x), Some(y)) => x == y
            case (None, None) => true
            case _ => false
        }
    }

    operator func !=(rhs: RegexNode<T>): Bool {
        !(this == rhs)
    }
}

class RegexCache<T> {
    var size = 0
    let capacity: Int64
    let map = HashMap<RegexKey, RegexNode<T>>()
    let head = RegexNode<T>()
    let tail = RegexNode<T>()

    init(capacity: Int64) {
        if (capacity <= 0) {
            throw Exception("cache capacity must be larger than 0")
        }
        this.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(key: RegexKey): ?T {
        return match (map.get(key)) {
            case None => None
            case Some(node) =>
                insertToHead(node)
                node.value
        }
    }

    func put(key: RegexKey, value: T): Unit {
        match (map.get(key)) {
            case Some(node) =>
                map[key].value = value
                return
            case None =>
                if (size >= capacity) {
                    shrink()
                }
                let cur = RegexNode<T>(key, value)
                insertToHead(cur)
                map.add(key, cur)
        }
    }

    private func insertToHead(cur: RegexNode<T>): Unit {
        if (cur.prev.isNone() && cur.next.isNone()) {
            cur.prev = head
            cur.next = head.next
            head.next?.prev = cur
            head.next = cur
            size++
            return
        }
        let first = head.next ?? throw Exception("cache error, head next lost")
        if (first == cur) {
            return
        }
        cur.prev?.next = cur.next
        cur.next?.prev = cur.prev
        cur.next = first
        cur.prev = head
        head.next = cur
        first.prev = cur
    }

    func shrink(): Unit {
        let last = tail.prev ?? throw Exception("cache error, tail prev lost")
        map.remove(last.key ?? throw Exception("cache error, tail prev is empty"))
        last.prev?.next = tail
        tail.prev = last.prev
        size--
    }
}

func tryGetFromCache<T>(cache: RegexCache<T>, key: RegexKey): ?T {
    cache.get(key)
}

func putToCache<T>(cache: RegexCache<T>, key: RegexKey, value: T): Unit {
    cache.put(key, value)
}

let validateRexCache = RegexCache<Regex>(10)

func regexInitWithCache(regexStr: String): Regex {
    let key = RegexKey(regexStr)
    match (tryGetFromCache(validateRexCache, key)) {
        case Some(v) => v
        case None =>
            let regex = Regex(regexStr)
            putToCache(validateRexCache, key, regex)
            regex
    }
}

let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var endResult = StringBuilder("")

func doTest() {
    endResult = StringBuilder("")

    // make up email address
    for (k in 0..4000) {
        let username = makeName(6)
        var email: String = ""
        if ((k%2) == 1) {
            email = username + "@mac.com"
        } else {
            email = username + "(at)mac.com"
        }

        // validate the email address
        let pattern = regexInitWithCache("^[a-zA-Z0-9\\-_.]+@[a-zA-Z0-9\\-_]+(\\.?[a-zA-Z0-9\\-_]*)\\.[a-zA-Z]{2,3}$")

        if (pattern.matcher(email).fullMatch().isSome()) {
            let r = email + " appears to be a valid email address."
            addResult(r)
        } else {
            let r = email + " does NOT appear to be a valid email address."
            addResult(r)
        }
    }

    // make up ZIP codes
    for (s in 0..4000) {
        var zipGood:Bool = true
        var zip:String = makeNumber(4)

        if ((s%2) == 1) {
            zip = zip + "xyz"
        } else {
            zip = zip + "7"
        }

        // validate the zip code
        for (i in 0..zip.size) {
            let ch = zip[i..i+1]
            let cArr: Array<String> = ["0","1","2","3","4","5","6","7","8","9"]
            if (!cArr.contains(ch)) {
                zipGood = false
                let r = zip + " contains letters."
                addResult(r)
            }
        }
        
        if (zipGood && zip.size > 5) {
            zipGood = false
            let r = zip + " is longer than five characters."
            addResult(r)
        }
        
        if (zipGood) {
            let r = zip + " appears to be a valid ZIP code."
            addResult(r)
        }
    }
}
var rand = Random()

func makeName(n: Int): String {
    var tmp = StringBuilder("")
    for (_ in 0..n) {
        let l = rand.nextInt64(26)
        tmp.append(letters[l])
    }
   return tmp.toString()
}

func makeNumber(n: Int): String {
   var tmp = StringBuilder("")
   for (_ in 0..n) {
        let l = rand.nextInt64(10)
        tmp.append(l)
   }
   return tmp.toString()
}

func addResult(r: String) {
    endResult.append("\n")
    endResult.append(r)
}

/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    /*
     *  @Benchmark
     */
    func runIteration() {
        doTest()
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    let start = Timer().getTime()
    Benchmark().runIteration()
    let end = Timer().getTime()
    println("string-validate-input-with-cache: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}
