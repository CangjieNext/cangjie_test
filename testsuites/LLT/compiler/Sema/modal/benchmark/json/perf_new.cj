import std.fs.*
import std.core.*
import std.runtime.*

const TARGET_JSON_PATH: String = "ori.json"
const ITERATIONS: Int64 = 1

/** Reads file to String @local!, parses with json and returns it. */
func new(): JsonValue {
    let bytes: Array<Byte> @local! = File.readFromModal(TARGET_JSON_PATH)
    let s: String @local! = String.fromUtf8(bytes)
    println(s.getSize())
    let v = JsonValue.fromStr(s)
    return v
}

const TOSTRING_OUT_PATH: String = "tostring_new.txt"

main() {
    var i: Int64 = 0
    let baseline = getAllocatedHeapSize()
    let arr: Array<Int64> = Array(ITERATIONS) {_: Int64 => 0}
    var lastV: JsonValue = JsonNull()
    while (i < ITERATIONS) {
        lastV = new()
        arr[i] = getAllocatedHeapSize()
        i += 1
    }
    File.writeTo(TOSTRING_OUT_PATH, lastV.toString().toArray())
    println(arr)
    println(arr.iterator().max().getOrThrow())
}
