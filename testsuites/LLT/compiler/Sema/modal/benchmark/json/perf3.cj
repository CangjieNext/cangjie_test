import std.fs.*
import std.core.*
import std.runtime.*

const TARGET_JSON_PATH: String = "ori.json"
const ITERATIONS: Int64 = 1

/** Parse from heap only (no local/region). */
func run(): JsonValue {
    let bytes: Array<Byte> = File.readFrom(TARGET_JSON_PATH)
    let s: String = String.fromUtf8(bytes)
    println(s.getSize())
    let v: JsonValue = JsonValue.fromStrNoLocal(s)
    return v
}

const TOSTRING_OUT_PATH: String = "tostring_perf3.txt"

main() {
    var i: Int64 = 0
    let baseline = getAllocatedHeapSize()
    let arr: Array<Int64> = Array(ITERATIONS) {_: Int64 => 0}
    var lastV: JsonValue = JsonNull()
    while (i < ITERATIONS) {
        lastV = run()
        arr[i] = getAllocatedHeapSize()
        i += 1
    }
    File.writeTo(TOSTRING_OUT_PATH, lastV.toString().toArray())
    println(arr)
    println(arr.iterator().max().getOrThrow())
}
