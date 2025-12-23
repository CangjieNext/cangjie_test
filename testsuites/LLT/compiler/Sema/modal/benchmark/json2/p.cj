import std.fs.*
import std.core.*
import std.collection.*
import std.convert.*
import stdx.encoding.json.*
import std.runtime.*
import std.env.*

let TARGET_JSON_PATH: String = "${getWorkingDirectory()}/ori.json"

let log2path = "${getWorkingDirectory()}/log2.txt"
let ffff = File(log2path, Write)

var ITERATIONS: Int64 = 50
var i = 0


/** Reads file to String @local!, parses with json and returns it. */
func readJson(): JsonValueLocal @local! {
    exclave {
        unsafe{ffff.write("${getAllocatedHeapSize()} ".rawData())}
        let bytes: Array<Byte> @local! = File.readFromModal(TARGET_JSON_PATH)
        let s: String @local! = unsafe{String.withRawData(bytes)}
        unsafe{ffff.write("${getAllocatedHeapSize()} ".rawData())}
        JsonValueLocal.fromStr(s)
    }
}

/**
 Walk the whole JSON tree; every object with string normalText + normalStyle yields one Address.
 */
func extractBraceText(s: String @local!): String {
    exclave {
        let n = s.getSize()
        var open: Int64 = -1
        var i: Int64 = 0
        while (i < n) {
            if (s[i] == b'{') {
                open = i
                break
            }
            i++
        }
        if (open < 0) {
            return ""
        }
        var bar: Int64 = -1
        var j: Int64 = open + 1
        while (j < n) {
            if (s[j] == b'|') {
                bar = j
                break
            }
            j++
        }
        if (bar < 0) {
            return ""
        }
        let slice = s[(open + 1)..bar]
        unsafe { String.fromUtf8Unchecked(slice.rawData()) }
    }
}

/** After "text-style-", parses "num1-num2" by scanning bytes (no split). */
func parseIntsAfterSecondDash(s: String @local!, num1Start: Int64): (Int64, Int64) {
    exclave {
        let n = s.getSize()
        var j: Int64 = num1Start
        while (j < n) {
            let c = s[j]
            if (c == b'-') {
                if (j == num1Start) {
                    return (0, 0)
                }
                let num2Start = j + 1
                if (num2Start >= n) {
                    return (0, 0)
                }
                return (
                    Int64.parse(s[num1Start..j]),
                    Int64.parse(s[num2Start..n]))
            }
            j++
        }
        (0, 0)
    }
}

func parseStyleInts(normalStyle: String @local!): (Int64, Int64) {
    exclave {
        let n = normalStyle.getSize()
        var dashCount: Int64 = 0
        var i: Int64 = 0
        while (i < n) {
            let ch = normalStyle[i]
            if (ch == b'-') {
                dashCount++
                if (dashCount == 2) {
                    return parseIntsAfterSecondDash(normalStyle, i + 1)
                }
            }
            i++
        }
        (0, 0)
    }
}

func addressFromBlock(jv: JsonValueLocal @local!): Option<Address> {
    exclave {
        match (jv) {
            case obj: JsonObjectLocal =>
                let ntOpt = obj.get(unsafe { String.fromUtf8UncheckedLocal("normalText".rawData()) })
                let nsOpt = obj.get(unsafe { String.fromUtf8UncheckedLocal("normalStyle".rawData()) })
                match ((ntOpt, nsOpt)) {
                    case (Some(ntv), Some(nsv)) =>
                        match ((ntv, nsv)) {
                            case (nts: JsonStringLocal, nss: JsonStringLocal) =>
                                let nt = nts.getValue()
                                let ns = nss.getValue()
                                let text = extractBraceText(nt)
                                let (a, b) = parseStyleInts(ns)
                                Option<Address>.Some(Address(text, a, b))
                            case _ => None
                        }
                    case _ => None
                }
            case _ => None
        }
    }
}

func collectAddressesDeep(jv: JsonValueLocal @local!, addresses: ArrayList<Address>): Unit {
    exclave {
        match (addressFromBlock(jv)) {
            case Some(a) => addresses.add(a)
                return
            case None => ()
        }
        match (jv) {
            case obj: JsonObjectLocal =>
                let fld = obj.getFields()
                let ks = fld.myiterate()
                var ki: Int64 = 0
                while (ki < ks.size) {
                    let kk = ks[ki]
                    match (fld.get(kk)) {
                        case Some(ch) => collectAddressesDeep(ch, addresses)
                        case None => ()
                    }
                    ki++
                }
            case arr: JsonArrayLocal =>
                let items = arr.getItems()
                var ai: Int64 = 0
                while (ai < items.size) {
                    match (items.get(ai)) {
                        case Some(el) => collectAddressesDeep(el, addresses)
                        case None => ()
                    }
                    ai++
                }
            case _ => ()
        }
    }
}

func getAddress(json: JsonValueLocal @local!): ArrayList<Address> {
    exclave {
        let addresses = ArrayList<Address>()
        collectAddressesDeep(json, addresses)
        addresses
    }
}

class Address <: ToString {
    let text: String
    let style0: Int
    let style1: Int
    init(text: String , style0: Int, style1: Int) {
        this.text = text
        this.style0 = style0
        this.style1 = style1
    }
    public func toString() {
        "${text} ${style0} ${style1}"
    }
}

func dd() {
    let json = readJson()
    unsafe{ffff.write("${getAllocatedHeapSize()} ".rawData())}
    let addresses = getAddress(json)
    unsafe{ffff.write("${getAllocatedHeapSize()} ".rawData())}
    addresses
}

main() {
    ITERATIONS = if (let Some(v) <- getVariable("ITERATIONS")) {
        Int64.parse(v)
    } else {
        ITERATIONS
    }
    let baseline = getAllocatedHeapSize()
    unsafe{ffff.write("baseline=${baseline}\n".rawData())}
    let after: Array<Int64> = Array(ITERATIONS) {_: Int64 => 0}
    while (i < ITERATIONS) {
        let addresses = dd()
        unsafe{ffff.write("${getAllocatedHeapSize()} ".rawData())}
        i += 1
        blackBox(addresses)
    }
}
