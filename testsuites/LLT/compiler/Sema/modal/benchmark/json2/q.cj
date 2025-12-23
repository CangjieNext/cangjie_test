import std.fs.*
import std.core.*
import std.collection.*
import std.convert.*
import stdx.encoding.json.*

const TARGET_JSON_PATH: String = "my.json"

/** Reads file to String, parses with json and returns it (heap JsonValue API). */
func readJson(): JsonValue {
    let bytes = File.readFrom(TARGET_JSON_PATH)
    let s = String.fromUtf8(bytes)
    JsonValue.fromStr(s)
}

/**
extract address data from a large json array.
The correct pattern is 
{
    "title": {
        "normalText": "{xxxx|text-style-21-0001}",
        "normalStyle": "text-style-21-0001"
    },
    "desc": {
        "normalText": "{yyyy|text-style-14-0003}",
        "normalStyle": "text-style-14-0003"
    }
}
Then we get Entry(Address("xxxx", 21, 0), Address("yyyy", 14, 3)) as the result.
*/
func extractBraceText(s: String): String {
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

/** After "text-style-", parses "num1-num2" by scanning bytes (no split). */
func parseIntsAfterSecondDash(s: String, num1Start: Int64): (Int64, Int64) {
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

func parseStyleInts(normalStyle: String): (Int64, Int64) {
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

func addressFromBlock(jv: JsonValue): Option<Address> {
    match (jv) {
        case obj: JsonObject =>
            let ntOpt = obj.get("normalText")
            let nsOpt = obj.get("normalStyle")
            match ((ntOpt, nsOpt)) {
                case (Some(ntv), Some(nsv)) =>
                    match ((ntv, nsv)) {
                        case (nts: JsonString, nss: JsonString) =>
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

func collectAddressesDeep(jv: JsonValue, addresses: ArrayList<Address>): Unit {
    match (addressFromBlock(jv)) {
        case Some(a) => addresses.add(a)
        case None => ()
    }
    match (jv) {
        case obj: JsonObject =>
            obj.getFields().forEach({_, ch => collectAddressesDeep(ch, addresses)})
        case arr: JsonArray =>
            let items = arr.getItems()
            var i: Int64 = 0
            while (i < items.size) {
                match (items.get(i)) {
                    case Some(elem) => collectAddressesDeep(elem, addresses)
                    case None => ()
                }
                i += 1
            }
        case _ => ()
    }
}

func getAddress(json: JsonValue): ArrayList<Address> {
    let addresses = ArrayList<Address>()
    collectAddressesDeep(json, addresses)
    addresses
}

class Address {
    let text: String
    let style0: Int
    let style1: Int
    init(text: String , style0: Int, style1: Int) {
        this.text = text
        this.style0 = style0
        this.style1 = style1
    }
}

main() {
    let json = readJson()
    let addresses = getAddress(json)
    println(addresses.size)
}
