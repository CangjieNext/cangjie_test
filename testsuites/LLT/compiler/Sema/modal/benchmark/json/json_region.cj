/*
 * Single-file JSON lib: JsonValue.fromStr and toString.
 * Universal heap-only design: no modal on fields. fromStr(s: String @local?) does not copy input.
 * parseFromBytes(Array<Byte>) and parseFromBytesFromData(Array<Byte> @local?) both return heap JsonValue.
 */
import std.core.*
import std.convert.*

public class JsonException <: Exception {
    public init(message: String) { super(message) }
}

public enum JsonKind {
    JsNull |
    JsBool |
    JsInt |
    JsFloat |
    JsString |
    JsArray |
    JsObject
}

sealed abstract class JsonValue <: ToString {
    public init(this @local!) {
        exclave {}
    }
    public func toString(this @local!): String
    public func kind(this @local?): JsonKind
    public static func fromStr(s: String @local?): JsonValue @local! {
        exclave {
            let data: Array<Byte> @local! = unsafe { s.rawData() }
            parseFromBytesFromData(data)
        }
    }
}

public class JsonNull <: JsonValue {
    public init(this @local!) {
        exclave { super() }
    }
    public func kind(this @local?): JsonKind { return JsNull }
    public func toString(this @local!): String {
        "null"
    }
}

var g_placeholderNull: JsonNull = JsonNull()

public class JsonBool <: JsonValue {
    var value: Bool
    public init(this @local!, bv: Bool) {
        exclave {
            super()
            this.value = bv
        }
    }
    public func getValue(this @local?): Bool { return value }
    public func kind(this @local?): JsonKind { return JsBool }
    public func toString(this @local!): String { if (value) { "true" } else { "false" } }
}

public class JsonInt <: JsonValue {
    var value: Int64
    public init(this @local!, iv: Int64) {
        exclave {
            super()
            this.value = iv
        }
    }
    public func getValue(this @local?): Int64 { return value }
    public func kind(this @local?): JsonKind { return JsInt }
    public func toString(this @local?): String {
        value.toString()
    }
}

func formatFloatForJson(v: Float64): String @local! {
    let s: String = v.toString()
    match (s.indexOf(b'.')) {
        case None => return s
        case Some(dotIdx) =>
            let bytes: Array<Byte> = s.toArray()
            var end: Int64 = bytes.getSize()
            while (end > dotIdx + 1 && bytes[end - 1] == b'0') {
                end -= 1
            }
            if (end == dotIdx + 1) {
                end = dotIdx
            }
            if (end >= bytes.getSize()) {
                return s
            }
            let slice: Array<Byte> = bytes.slice(0, end)
            return String.fromUtf8(slice)
    }
}

public class JsonFloat <: JsonValue {
    var value: Float64
    public init(this @local!, fv: Float64) {
        exclave {
            super()
            this.value = fv
        }
    }
    public func getValue(this @local?): Float64 { return value }
    public func kind(this @local?): JsonKind { return JsFloat }
    public func toString(this @local?): String {
        formatFloatForJson(value)
    }
}

public class JsonString <: JsonValue {
    var value: String
    public func getValue(): String { return value }
    public func kind(this @local?): JsonKind { return JsString }
    public func toString(this @local?): String {
        var buf: Buf = Buf(2 + value.getSize() * 2)
        buf.appendByte(b'\"')
        let raw: Array<Byte> @local? = unsafe { value.rawData() }
        let n: Int64 = raw.getSize()
        let bytes: Array<Byte> = Array<Byte>(n, repeat: b' ')
        var i: Int64 = 0
        while (i < n) {
            bytes[i] = raw[i]
            i += 1
        }
        i = 0
        while (i < bytes.getSize()) {
            let b = bytes[i]
            match (b) {
                case b'\"' => buf.appendByte(b'\\'); buf.appendByte(b'\"')
                case b'\\' => buf.appendByte(b'\\'); buf.appendByte(b'\\')
                case b'\n' => buf.appendByte(b'\\'); buf.appendByte(b'n')
                case b'\r' => buf.appendByte(b'\\'); buf.appendByte(b'r')
                case b'\t' => buf.appendByte(b'\\'); buf.appendByte(b't')
                case _ => buf.appendByte(b)
            }
            i += 1
        }
        buf.appendByte(b'\"')
        buf.toStr()
    }
}

public struct JsonField {
    let key: String
    let value: JsonValue
    public init(key: String, value: JsonValue) {
        this.key = key
        this.value = value
    }
}

func jsonFieldHeap(key: String, value: JsonValue): JsonField {
    return JsonField(key, value)
}

public class JsonObject <: JsonValue {
    var fields: Array<JsonField>
    public init(fields: Array<JsonField>) {
        super()
        this.fields = fields
    }
    public func kind(this @local?): JsonKind { return JsObject }
    public func size(this @local?): Int64 { return fields.getSize() }
    public func toString(this @local?): String {
        var buf: Buf = Buf(64)
        buf.appendByte(b'{')
        var i: Int64 = 0
        while (i < fields.getSize()) {
            if (i > 0) { buf.appendByte(b',') }
            buf.appendByte(b'\"')
            let keyBytes: Array<Byte> = fields[i].key.toArray()
            var ki: Int64 = 0
            while (ki < keyBytes.getSize()) {
                let b = keyBytes[ki]
                match (b) {
                    case b'\"' => buf.appendByte(b'\\'); buf.appendByte(b'\"')
                    case b'\\' => buf.appendByte(b'\\'); buf.appendByte(b'\\')
                    case b'\n' => buf.appendByte(b'\\'); buf.appendByte(b'n')
                    case b'\r' => buf.appendByte(b'\\'); buf.appendByte(b'r')
                    case b'\t' => buf.appendByte(b'\\'); buf.appendByte(b't')
                    case _ => buf.appendByte(b)
                }
                ki += 1
            }
            buf.appendByte(b'\"')
            buf.appendByte(b':')
            buf.appendStr(fields[i].value.toString())
            i += 1
        }
        buf.appendByte(b'}')
        return buf.toStr()
    }
}

public class JsonArray <: JsonValue {
    var items: Array<JsonValue>
    public init(items: Array<JsonValue>) {
        super()
        this.items = items
    }
    public func kind(this @local?): JsonKind { return JsArray }
    public func size(this @local?): Int64 { return items.getSize() }
    public func toString(this @local?): String {
        var buf: Buf = Buf(64)
        buf.appendByte(b'[')
        var i: Int64 = 0
        while (i < items.getSize()) {
            if (i > 0) { buf.appendByte(b',') }
            buf.appendStr(items[i].toString())
            i += 1
        }
        buf.appendByte(b']')
        return buf.toStr()
    }
}

class Parser {
    let size: Int64
    var offset: Int64
    let data: Array<Byte>
    init(size: Int64, data: Array<Byte>) {
        this.size = size
        this.offset = 0
        this.data = data
    }
}

func parseFromBytes(data: Array<Byte>): JsonValue {
    let parser: Parser = Parser(data.getSize(), data)
    return parseValue(parser)
}

class ParserState {
    let size: Int64
    var offset: Int64
    init(size: Int64) {
        this.size = size
        this.offset = 0
    }
}

func skipWsFromData(p: ParserState, data: Array<Byte> @local?): Unit {
    while (p.offset < p.size) {
        let b = data[p.offset]
        if (b != b' ' && b != b'\t' && b != b'\n' && b != b'\r') {
            return
        }
        p.offset += 1
    }
}

func parseValueFromData(p: ParserState, data: Array<Byte> @local?): JsonValue {
    skipWsFromData(p, data)
    if (p.offset >= p.size) {
        throw JsonException("Unexpected end")
    }
    let b = data[p.offset]
    if (b == b'{') { return parseObjectFromData(p, data) }
    if (b == b'[') { return parseArrayFromData(p, data) }
    if (b == b'\"') { return parseStringFromData(p, data) }
    if (b == b'n') { return parseNullFromData(p, data) }
    if (b == b't') { return parseTrueFromData(p, data) }
    if (b == b'f') { return parseFalseFromData(p, data) }
    if (b == b'-' || (b >= b'0' && b <= b'9')) { return parseNumberFromData(p, data) }
    throw JsonException("Unexpected character")
}

func parseNullFromData(p: ParserState, data: Array<Byte> @local?): JsonValue {
    if (p.offset + 4 > p.size) { throw JsonException("Invalid null") }
    if (data[p.offset] != b'n' || data[p.offset + 1] != b'u' ||
        data[p.offset + 2] != b'l' || data[p.offset + 3] != b'l') {
        throw JsonException("Invalid null")
    }
    p.offset += 4
    return JsonNull()
}

func parseTrueFromData(p: ParserState, data: Array<Byte> @local?): JsonBool {
    if (p.offset + 4 > p.size) { throw JsonException("Invalid true") }
    if (data[p.offset] != b't' || data[p.offset + 1] != b'r' ||
        data[p.offset + 2] != b'u' || data[p.offset + 3] != b'e') {
        throw JsonException("Invalid true")
    }
    p.offset += 4
    return JsonBool(true)
}

func parseFalseFromData(p: ParserState, data: Array<Byte> @local?): JsonBool {
    if (p.offset + 5 > p.size) { throw JsonException("Invalid false") }
    if (data[p.offset] != b'f' || data[p.offset + 1] != b'a' ||
        data[p.offset + 2] != b'l' || data[p.offset + 3] != b's' || data[p.offset + 4] != b'e') {
        throw JsonException("Invalid false")
    }
    p.offset += 5
    return JsonBool(false)
}

func parseNumberFromData(p: ParserState, data: Array<Byte> @local?): JsonValue {
    let start = p.offset
    if (data[p.offset] == b'-') { p.offset += 1 }
    if (p.offset >= p.size) { throw JsonException("Invalid number") }
    var isFloat = false
    while (p.offset < p.size && data[p.offset] >= b'0' && data[p.offset] <= b'9') {
        p.offset += 1
    }
    if (p.offset < p.size && data[p.offset] == b'.') {
        isFloat = true
        p.offset += 1
        while (p.offset < p.size && data[p.offset] >= b'0' && data[p.offset] <= b'9') {
            p.offset += 1
        }
    }
    if (p.offset < p.size && (data[p.offset] == b'e' || data[p.offset] == b'E')) {
        isFloat = true
        p.offset += 1
        if (p.offset < p.size && (data[p.offset] == b'+' || data[p.offset] == b'-')) {
            p.offset += 1
        }
        while (p.offset < p.size && data[p.offset] >= b'0' && data[p.offset] <= b'9') {
            p.offset += 1
        }
    }
    let n: Int64 = p.offset - start
    let copy: Array<Byte> = Array<Byte>(n, repeat: b' ')
    var i: Int64 = 0
    while (i < n) {
        copy[i] = data[start + i]
        i += 1
    }
    let s: String = String.fromUtf8(copy)
    if (isFloat) {
        return JsonFloat(Float64.parse(s))
    }
    return JsonInt(Int64.parse(s))
}

func parseStringFromData(p: ParserState, data: Array<Byte> @local?): JsonString {
    if (data[p.offset] != b'\"') { throw JsonException("Expected string") }
    p.offset += 1
    var buf: Array<Byte> = Array<Byte>(32, repeat: b' ')
    var bufLen: Int64 = 0
    while (p.offset < p.size && data[p.offset] != b'\"') {
        if (data[p.offset] == b'\\') {
            p.offset += 1
            if (p.offset >= p.size) { throw JsonException("Bad escape") }
            let esc = data[p.offset]
            p.offset += 1
            if (bufLen >= buf.getSize()) {
                let newBuf: Array<Byte> = Array<Byte>(buf.getSize() * 2, repeat: b' ')
                var j: Int64 = 0
                while (j < bufLen) {
                    newBuf[j] = buf[j]
                    j += 1
                }
                buf = newBuf
            }
            match (esc) {
                case b'\"' => buf[bufLen] = b'\"'; bufLen += 1
                case b'\\' => buf[bufLen] = b'\\'; bufLen += 1
                case b'/' => buf[bufLen] = b'/'; bufLen += 1
                case b'b' => buf[bufLen] = b'\b'; bufLen += 1
                case b'f' => buf[bufLen] = b'\f'; bufLen += 1
                case b'n' => buf[bufLen] = b'\n'; bufLen += 1
                case b'r' => buf[bufLen] = b'\r'; bufLen += 1
                case b't' => buf[bufLen] = b'\t'; bufLen += 1
                case _ => throw JsonException("Unsupported escape")
            }
        } else {
            if (bufLen >= buf.getSize()) {
                let newBuf: Array<Byte> = Array<Byte>(buf.getSize() * 2, repeat: b' ')
                var j: Int64 = 0
                while (j < bufLen) {
                    newBuf[j] = buf[j]
                    j += 1
                }
                buf = newBuf
            }
            buf[bufLen] = data[p.offset]
            bufLen += 1
            p.offset += 1
        }
    }
    if (p.offset >= p.size) { throw JsonException("Unterminated string") }
    p.offset += 1
    let slice: Array<Byte> = buf.slice(0, bufLen)
    let s: String = String.fromUtf8(slice)
    return JsonString(s)
}

func parseObjectFromData(p: ParserState, data: Array<Byte> @local?): JsonObject {
    p.offset += 1
    var pairs: Array<JsonField> = Array<JsonField>(8, repeat: JsonField("", g_placeholderNull))
    var count: Int64 = 0
    var first = true
    while (p.offset < p.size && data[p.offset] != b'}') {
        skipWsFromData(p, data)
        if (p.offset >= p.size || data[p.offset] == b'}') {
            break
        }
        if (!first) {
            if (data[p.offset] != b',') {
                throw JsonException("Expected , in object")
            }
            p.offset += 1
            skipWsFromData(p, data)
        }
        first = false
        let keyJ = parseStringFromData(p, data)
        skipWsFromData(p, data)
        if (p.offset >= p.size || data[p.offset] != b':') {
            throw JsonException("Expected : in object")
        }
        p.offset += 1
        let value = parseValueFromData(p, data)
        if (count >= pairs.getSize()) {
            let newPairs: Array<JsonField> = Array<JsonField>(pairs.getSize() * 2, repeat: JsonField("", g_placeholderNull))
            var j: Int64 = 0
            while (j < count) {
                newPairs[j] = pairs[j]
                j += 1
            }
            pairs = newPairs
        }
        pairs[count] = JsonField(keyJ.getValue(), value)
        count += 1
    }
    if (p.offset >= p.size || data[p.offset] != b'}') {
        throw JsonException("Expected } in object")
    }
    p.offset += 1
    let out: Array<JsonField> = Array<JsonField>(count, repeat: JsonField("", g_placeholderNull))
    var j: Int64 = 0
    while (j < count) {
        out[j] = pairs[j]
        j += 1
    }
    return JsonObject(out)
}

func parseArrayFromData(p: ParserState, data: Array<Byte> @local?): JsonArray {
    p.offset += 1
    var arr: Array<JsonValue> = Array<JsonValue>(8, repeat: g_placeholderNull)
    var count: Int64 = 0
    var first = true
    while (p.offset < p.size && data[p.offset] != b']') {
        skipWsFromData(p, data)
        if (p.offset >= p.size || data[p.offset] == b']') {
            break
        }
        if (!first) {
            if (data[p.offset] != b',') {
                throw JsonException("Expected , in array")
            }
            p.offset += 1
            skipWsFromData(p, data)
        }
        first = false
        let item = parseValueFromData(p, data)
        if (count >= arr.getSize()) {
            let newArr: Array<JsonValue> = Array<JsonValue>(arr.getSize() * 2, repeat: g_placeholderNull)
            var j: Int64 = 0
            while (j < count) {
                newArr[j] = arr[j]
                j += 1
            }
            arr = newArr
        }
        arr[count] = item
        count += 1
    }
    if (p.offset >= p.size || data[p.offset] != b']') {
        throw JsonException("Expected ] in array")
    }
    p.offset += 1
    let out: Array<JsonValue> = Array<JsonValue>(count, repeat: g_placeholderNull)
    var j: Int64 = 0
    while (j < count) {
        out[j] = arr[j]
        j += 1
    }
    return JsonArray(out)
}

func parseFromBytesFromData(data: Array<Byte> @local?): JsonValue {
    let p: ParserState = ParserState(data.getSize())
    return parseValueFromData(p, data)
}

func skipWs(p: Parser): Unit {
    while (p.offset < p.size) {
        let b = p.data[p.offset]
        if (b != b' ' && b != b'\t' && b != b'\n' && b != b'\r') {
            return
        }
        p.offset += 1
    }
}

func parseValue(p: Parser): JsonValue {
    skipWs(p)
    if (p.offset >= p.size) {
        throw JsonException("Unexpected end")
    }
    let b = p.data[p.offset]
    if (b == b'{') { return parseObject(p) }
    if (b == b'[') { return parseArray(p) }
    if (b == b'\"') { return parseString(p) }
    if (b == b'n') { return parseNull(p) }
    if (b == b't') { return parseTrue(p) }
    if (b == b'f') { return parseFalse(p) }
    if (b == b'-' || (b >= b'0' && b <= b'9')) { return parseNumber(p) }
    throw JsonException("Unexpected character")
}

func parseNull(p: Parser): JsonValue {
    if (p.offset + 4 > p.size) { throw JsonException("Invalid null") }
    if (p.data[p.offset] != b'n' || p.data[p.offset + 1] != b'u' ||
        p.data[p.offset + 2] != b'l' || p.data[p.offset + 3] != b'l') {
        throw JsonException("Invalid null")
    }
    p.offset += 4
    return JsonNull()
}

func parseTrue(p: Parser): JsonBool {
    if (p.offset + 4 > p.size) { throw JsonException("Invalid true") }
    if (p.data[p.offset] != b't' || p.data[p.offset + 1] != b'r' ||
        p.data[p.offset + 2] != b'u' || p.data[p.offset + 3] != b'e') {
        throw JsonException("Invalid true")
    }
    p.offset += 4
    return JsonBool(true)
}

func parseFalse(p: Parser): JsonBool {
    if (p.offset + 5 > p.size) { throw JsonException("Invalid false") }
    if (p.data[p.offset] != b'f' || p.data[p.offset + 1] != b'a' ||
        p.data[p.offset + 2] != b'l' || p.data[p.offset + 3] != b's' || p.data[p.offset + 4] != b'e') {
        throw JsonException("Invalid false")
    }
    p.offset += 5
    return JsonBool(false)
}

func parseNumber(p: Parser): JsonValue {
    let start = p.offset
    if (p.data[p.offset] == b'-') { p.offset += 1 }
    if (p.offset >= p.size) { throw JsonException("Invalid number") }
    var isFloat = false
    while (p.offset < p.size && p.data[p.offset] >= b'0' && p.data[p.offset] <= b'9') {
        p.offset += 1
    }
    if (p.offset < p.size && p.data[p.offset] == b'.') {
        isFloat = true
        p.offset += 1
        while (p.offset < p.size && p.data[p.offset] >= b'0' && p.data[p.offset] <= b'9') {
            p.offset += 1
        }
    }
    if (p.offset < p.size && (p.data[p.offset] == b'e' || p.data[p.offset] == b'E')) {
        isFloat = true
        p.offset += 1
        if (p.offset < p.size && (p.data[p.offset] == b'+' || p.data[p.offset] == b'-')) {
            p.offset += 1
        }
        while (p.offset < p.size && p.data[p.offset] >= b'0' && p.data[p.offset] <= b'9') {
            p.offset += 1
        }
    }
    let slice: Array<Byte> = p.data.slice(start, p.offset - start)
    let s: String = String.fromUtf8(slice)
    if (isFloat) {
        return JsonFloat(Float64.parse(s))
    }
    return JsonInt(Int64.parse(s))
}

func parseString(p: Parser): JsonString {
    if (p.data[p.offset] != b'\"') { throw JsonException("Expected string") }
    p.offset += 1
    var buf: Array<Byte> = Array<Byte>(32, repeat: b' ')
    var bufLen: Int64 = 0
    while (p.offset < p.size && p.data[p.offset] != b'\"') {
        if (p.data[p.offset] == b'\\') {
            p.offset += 1
            if (p.offset >= p.size) { throw JsonException("Bad escape") }
            let esc = p.data[p.offset]
            p.offset += 1
            if (bufLen >= buf.getSize()) {
                let newBuf: Array<Byte> = Array<Byte>(buf.getSize() * 2, repeat: b' ')
                var j: Int64 = 0
                while (j < bufLen) {
                    newBuf[j] = buf[j]
                    j += 1
                }
                buf = newBuf
            }
            match (esc) {
                case b'\"' => buf[bufLen] = b'\"'; bufLen += 1
                case b'\\' => buf[bufLen] = b'\\'; bufLen += 1
                case b'/' => buf[bufLen] = b'/'; bufLen += 1
                case b'b' => buf[bufLen] = b'\b'; bufLen += 1
                case b'f' => buf[bufLen] = b'\f'; bufLen += 1
                case b'n' => buf[bufLen] = b'\n'; bufLen += 1
                case b'r' => buf[bufLen] = b'\r'; bufLen += 1
                case b't' => buf[bufLen] = b'\t'; bufLen += 1
                case _ => throw JsonException("Unsupported escape")
            }
        } else {
            if (bufLen >= buf.getSize()) {
                let newBuf: Array<Byte> = Array<Byte>(buf.getSize() * 2, repeat: b' ')
                var j: Int64 = 0
                while (j < bufLen) {
                    newBuf[j] = buf[j]
                    j += 1
                }
                buf = newBuf
            }
            buf[bufLen] = p.data[p.offset]
            bufLen += 1
            p.offset += 1
        }
    }
    if (p.offset >= p.size) { throw JsonException("Unterminated string") }
    p.offset += 1
    let slice: Array<Byte> = buf.slice(0, bufLen)
    let s: String = String.fromUtf8(slice)
    return JsonString(s)
}

func parseObject(p: Parser): JsonObject {
    p.offset += 1
    var pairs: Array<JsonField> = Array<JsonField>(8, repeat: jsonFieldHeap("", g_placeholderNull))
    var count: Int64 = 0
    var first = true
    while (p.offset < p.size && p.data[p.offset] != b'}') {
        skipWs(p)
        if (p.offset >= p.size || p.data[p.offset] == b'}') {
            break
        }
        if (!first) {
            if (p.data[p.offset] != b',') {
                throw JsonException("Expected , in object")
            }
            p.offset += 1
            skipWs(p)
        }
        first = false
        let keyJ = parseString(p)
        skipWs(p)
        if (p.offset >= p.size || p.data[p.offset] != b':') {
            throw JsonException("Expected : in object")
        }
        p.offset += 1
        let value = parseValue(p)
        if (count >= pairs.getSize()) {
            let newPairs: Array<JsonField> = Array<JsonField>(pairs.getSize() * 2, repeat: jsonFieldHeap("", g_placeholderNull))
            var j: Int64 = 0
            while (j < count) {
                newPairs[j] = pairs[j]
                j += 1
            }
            pairs = newPairs
        }
        pairs[count] = JsonField(keyJ.getValue(), value)
        count += 1
    }
    if (p.offset >= p.size || p.data[p.offset] != b'}') {
        throw JsonException("Expected } in object")
    }
    p.offset += 1
    let out: Array<JsonField> = Array<JsonField>(count, repeat: jsonFieldHeap("", g_placeholderNull))
    var j: Int64 = 0
    while (j < count) {
        out[j] = pairs[j]
        j += 1
    }
    return JsonObject(out)
}

func parseArray(p: Parser): JsonArray {
    p.offset += 1
    var arr: Array<JsonValue> = Array<JsonValue>(8, repeat: g_placeholderNull)
    var count: Int64 = 0
    var first = true
    while (p.offset < p.size && p.data[p.offset] != b']') {
        skipWs(p)
        if (p.offset >= p.size || p.data[p.offset] == b']') {
            break
        }
        if (!first) {
            if (p.data[p.offset] != b',') {
                throw JsonException("Expected , in array")
            }
            p.offset += 1
            skipWs(p)
        }
        first = false
        let item = parseValue(p)
        if (count >= arr.getSize()) {
            let newArr: Array<JsonValue> = Array<JsonValue>(arr.getSize() * 2, repeat: g_placeholderNull)
            var j: Int64 = 0
            while (j < count) {
                newArr[j] = arr[j]
                j += 1
            }
            arr = newArr
        }
        arr[count] = item
        count += 1
    }
    if (p.offset >= p.size || p.data[p.offset] != b']') {
        throw JsonException("Expected ] in array")
    }
    p.offset += 1
    let out: Array<JsonValue> = Array<JsonValue>(count, repeat: g_placeholderNull)
    var j: Int64 = 0
    while (j < count) {
        out[j] = arr[j]
        j += 1
    }
    return JsonArray(out)
}

struct Buf {
    var data: Array<Byte>
    var len: Int64
    init(cap: Int64) {
        this.data = Array<Byte>(cap, repeat: b' ')
        this.len = 0
    }
    mut func grow(): Unit {
        let newBuf: Array<Byte> = Array<Byte>(data.getSize() * 2, repeat: b' ')
        var j: Int64 = 0
        while (j < len) {
            newBuf[j] = data[j]
            j += 1
        }
        this.data = newBuf
    }
    mut func appendByte(b: Byte): Unit {
        if (len >= data.getSize()) { grow() }
        data[len] = b
        len += 1
    }
    mut func appendStr(s: String): Unit {
        let bytesRaw: Array<Byte> @local? = unsafe { s.rawData() }
        var i: Int64 = 0
        while (i < bytesRaw.getSize()) {
            if (len >= data.getSize()) { grow() }
            data[len] = bytesRaw[i]
            len += 1
            i += 1
        }
    }
    func toStr(): String {
        let slice: Array<Byte> = data.slice(0, len)
        let n: Int64 = slice.getSize()
        let copy: Array<Byte> = Array<Byte>(n, repeat: b' ')
        var i: Int64 = 0
        while (i < n) {
            copy[i] = slice[i]
            i += 1
        }
        return String.fromUtf8(copy)
    }
}

