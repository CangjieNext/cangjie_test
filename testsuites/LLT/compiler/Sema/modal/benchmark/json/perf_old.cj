import std.fs.*
import std.core.*
import std.runtime.*
import stdx.encoding.json.*

const TARGET_JSON_PATH: String = "ori.json"
const ITERATIONS: Int64 = 1

/** Reads file to String, parses with json and returns it. */
func old(): JsonValue {
    let bytes = File.readFrom(TARGET_JSON_PATH)
    let s = String.fromUtf8(bytes)
    println(s.getSize())
    let v = JsonValue.fromStr(s)
    return v
}

const TOSTRING_OUT_PATH: String = "tostring_old.txt"

main() {
    var i: Int64 = 0
    let baseline = getAllocatedHeapSize()
    let arr: Array<Int64> = Array(ITERATIONS) {_: Int64 => 0}
    var lastV: JsonValue = JsonNull()
    while (i < ITERATIONS) {
        lastV = old()
        arr[i] = getAllocatedHeapSize()
        i += 1
    }
    File.writeTo(TOSTRING_OUT_PATH, lastV.toString().toArray())
    println(arr)
    println(arr.iterator().max().getOrThrow())
}
