/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=1024mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
// TIMEOUT: 1800

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

let jsonStr = """

"""

enum JsonTokenType {
    | objBegin // {
    | objEnd   // }
    | arrBegin // [
    | arrEnd   // ]
    | nullValue_Token    // null
    | num   
    | str_Token  
    | bool_Token    
    | sepColon // :
    | sepComma // ,

    public operator func ==(another: JsonTokenType): Bool {
        match(this) {
            case objBegin =>
            match(another) {
                case objBegin => true
                case _ => false  
            }
            case objEnd =>
            match(another) {
                case objEnd => true
                case _ => false
            }
            case arrBegin =>
            match(another) {
                case arrBegin => true
                case _ => false
            }
            case arrEnd =>
            match(another) {
                case arrEnd => true
                case _ => false
            }
            case nullValue_Token =>
            match(another) {
                case nullValue_Token => true
                case _ => false
            }
            case num =>
            match(another) {
                case num => true
                case _ => false
            }
            case str_Token =>
            match(another) {
                case str_Token => true
                case _ => false
            }
            case bool_Token =>
            match(another) {
                case bool_Token => true
                case _ => false
            }
            case sepColon =>
            match(another) {
                case sepColon => true
                case _ => false
            }
            case sepComma =>
            match(another) {
                case sepComma => true
                case _ => false
            }
        }
    }

    public operator func !=(another: JsonTokenType): Bool {
        match(this) {
            case objBegin =>
            match(another) {
                case objBegin => false
                case _ => true
            }
            case objEnd =>
            match(another) {
                case objEnd => false
                case _ => true
            }
            case arrBegin =>
            match(another) {
                case arrBegin => false
                case _ => true
            }
            case arrEnd =>
            match(another) {
                case arrEnd => false
                case _ => true
            }
            case nullValue_Token =>
            match(another) {
                case nullValue_Token => false
                case _ => true
            }
            case num =>
            match(another) {
                case num => false
                case _ => true
            }
            case str_Token =>
            match(another) {
                case str_Token => false
                case _ => true
            }
            case bool_Token =>
            match(another) {
                case bool_Token => false
                case _ => true
            }
            case sepColon =>
            match(another) {
                case sepColon => false
                case _ => true
            }
            case sepComma =>
            match(another) {
                case sepComma => false
                case _ => true
            }
        }    
    }
}

class JsonToken { 
    var type1: JsonTokenType;
    var value: String = ""
    init(type1: JsonTokenType , value:String) {
        this.type1 = type1
        this.value = value
    }
}

public enum JsonType{
    | obj
    | arr
    | str
    | double
    | int
    | bool
    | nullValue
}

public class Json {
    var type1: ?JsonType = Option<JsonType>.None
    var objectValue: ?HashMap<String,Json> = Option<HashMap<String,Json>>.None
    var arrayValue: ?ArrayList<Json> = Option<ArrayList<Json>>.None
    var stringValue: ?String = Option<String>.None
    var doubleValue: ?Float64 = Option<Float64>.None
    var intValue: ?Int64 = Option<Int64>.None
    var boolValue: ?Bool = Option<Bool>.None
    var nullValue: ?String = Option<String>.None
    
    public init(type1:?JsonType, value:?Any){
        if (type1.isSome()) {
            this.type1 = type1.getOrThrow();
        }
        if (value.isSome()) {
            setValue(value.getOrThrow())
        }
        
    }
    
    public func getDescription(): String {
        match (this.type1.getOrThrow()) {
          case nullValue =>
            return "null"
          case str =>
            return "String(${this.stringValue.getOrThrow()})"
          case int =>
            return "int(${this.intValue})"
          case double =>
            return "int(${this.doubleValue})"
          case bool =>
            return "Bool(${this.boolValue.getOrThrow()})"
          case obj =>
            var objDesc = StringBuilder("Object(")
            let objSize = objectValue.getOrThrow().keys().size
            var keyCount = 0
            //objectValue.getOrThrow().forEach { k: String ,v: Json =>
            for ( (k, v) in objectValue.getOrThrow()) {
                keyCount += 1
                objDesc.append(k)
                objDesc.append(":")
                objDesc.append(v.getDescription())
                if (keyCount < objSize) {
                    objDesc.append(", ")
                }
            }
            objDesc.append(")")
            return objDesc.toString()
          case arr =>
            var arrDesc = StringBuilder("Array(")
            var arrCount = 0
            let length = arrayValue.getOrThrow().size
            for (item in arrayValue.getOrThrow()) {
                arrCount += 1
                arrDesc.append(item.getDescription())
                if (arrCount < length) {
                    arrDesc.append(", ")
                }
            }
            arrDesc.append(")")
            return arrDesc.toString()
          case _ =>
            throw Exception("ParserError: json value type is undefined.")

        }
    }

    func setValue(value: Any) {
        match (this.type1.getOrThrow()) {
          case str =>
            this.stringValue = (value as String).getOrThrow()
            return
          case int =>
            this.intValue = (value as Int64)
            return
          case double =>
            this.doubleValue = (value as Float64)
            return
          case bool =>
            this.boolValue = (value as Bool).getOrThrow()
            return
          case nullValue =>
            this.nullValue = (value as String).getOrThrow()
            return
          case obj =>
            this.objectValue = (value as HashMap<String,Json>).getOrThrow()
            return
          case arr =>
            this.arrayValue = (value as ArrayList<Json>)
            return
          case _ => 
            throw Exception("ParserError: json value type is undefined.")
        }
      }
    
}


class JsonTokenizer {
    
    var input: String
    
    var currentIndex: Int64
    
    
    init(string: String) {
        this.input = string
        this.currentIndex = 0
    }
    
   
    private func current(): ?Rune {
        if (currentIndex >= input.size) {
            return Option<Rune>.None
        }
        return Rune(input[currentIndex])
    }
    
    
    private func peekNext(): ?Rune {
        advance()
        return current()
    }
    
    
    private func advance() {
        currentIndex = currentIndex + 1
    }
    
    private func back() {
        currentIndex = currentIndex - 1
    }
    
    func nextToken(): ?JsonToken {
        scanSpaces()
        let ch = current()
        if (ch.isNone()) {
            return Option<JsonToken>.None
        }

        match (ch.getOrThrow()) {
        case '{' =>
            advance()
            return JsonToken(objBegin, "{")
        case '}' =>
            advance()
            return JsonToken(objEnd, "}")
        case '[' =>
            advance()
            return JsonToken(arrBegin, "[")
        case ']' =>
            advance()
            return JsonToken(arrEnd, "]")
        case ',' =>
            advance()
            return JsonToken(sepComma, ",")
        case ':' =>
            advance()
            return JsonToken(sepColon, ":")
        case 'n' =>
            let strnull = scanMatch("null")
            return JsonToken(nullValue_Token, strnull)
        case 't' =>
            let strTrue = scanMatch("true")
            return JsonToken(bool_Token, strTrue)
        case 'f' =>
            let strFalse = scanMatch("false")
            return JsonToken(bool_Token, strFalse)
        case '\"' =>
            let str = scanString()
            advance()
            return JsonToken(str_Token, str)
        case _ =>
            if (isNumber(ch.getOrThrow())) {
                let strNum = scanNumbers()
                return JsonToken(num, strNum)
            }
            throw Exception("ParserError: Unparsable character :${ch} - ${currentIndex}")
        }
    }
    
    func scanString(): String {
        var ret = ArrayList<Rune>()
        
        do {
            let ch = peekNext()
            if (ch.isNone()) {
                throw Exception("ParserError: scanString Error,${currentIndex} ")
            }
            
            match (ch.getOrThrow()) {
            case r'\\' =>
                let cn = peekNext()
                if (cn.isNone()) {
                    throw Exception("ParserError: Invalid special type character")
                }
                
                ret.add(r'\\')
                ret.add(cn.getOrThrow())
                if (cn == r'u') {
                    ret.add(all: scanUnicode())
                }
                // break
            case r'\"' =>
                return ret.toString()
            case r'\r' =>
                throw Exception("ParserError: Invalid character${ch}")
            case _ =>
                ret.add(ch.getOrThrow())
            }
        } while (true)
        return ""
    }
    
    func scanUnicode() : ArrayList<Rune> {
        var ret = ArrayList<Rune>()
        for (_ in 0..4) {
            let ch = peekNext()
            if (ch.isSome() && isHex(ch.getOrThrow())){
                ret.add(ch.getOrThrow())
            } else {
                throw Exception("ParserError: unicode Character irregularities${currentIndex}")
            }
        }
        return ret
    }
    
    func scanNumbers(): String {
        let ind = currentIndex
        while (current().isSome() && isNumber(current().getOrThrow())) {
            advance()
        }
        if (currentIndex != ind) {
            return input[ind..currentIndex]
        }
        throw Exception("ParserError: scanNumbers Error:${ind}")
    }
    
    func scanSpaces() {
        var ch = current()
        while (ch.isSome() && ch.getOrThrow().toString() == " ") {
            ch = peekNext()
        }
    }

    func scanMatch(str: String): String {
        return  scanMatchArr(stringToCharArray(str))
    }
    func stringToCharArray(str: String): Array<Rune> {
       var arr = ArrayList<Rune>()
       for (i in 0..str.size) {
           arr.add(Rune(str[i]))  
       }
       return arr.toArray()
    }


    func scanMatchArr(characters: Array<Rune>) : String {
        let ind = currentIndex
        var isMatch = true
        for (index in (0..characters.size)) {
            if (characters[index] != current().getOrThrow()) {
                isMatch = false
                break
            }
            advance()
        }
        if (isMatch) {
            return input[ind..currentIndex]
        }
        throw Exception("ParserError: scanUntil dissatisfy ${characters}")
    }
    
    func isEscape(c: Rune): Bool {
        // \" \\ \u \r \\n \b \t \f
        return ["\"", "\\", "u", "r", "n", "b", "t", "f"].contains(c.toString())
    }
    
    func isNumber(c: Rune): Bool {
        let chars = HashMap<Rune , Bool>([
            (r'-', true),
            (r'+', true),
            (r'e', true),
            (r'E', true),
            (r'.', true)
        ])
        let b: ?Bool = chars.get(c)
        if (b.isSome()) {
            return true
        }
        
        if(c >= r'0' && c <= r'9') {
            return true
        }
        
        return false;
    }

    
    func isHex(c: Rune): Bool {
        return (c >= r'0' && c <= r'9') || (c >= r'a' && c <= r'f') || (c >= r'A' && c <= r'F')
    }
}

class JsonParser {
    private var tokenizer: JsonTokenizer
    
    private init(text: String) {
        tokenizer = JsonTokenizer(text)
    }
    
    static func parse_ALL(text: String) : ?Json {
        var parser = JsonParser(text)
        return parser.parse()
    }
    
    
    private func parseElement() : ?Json {
        let nextToken = tokenizer.nextToken()
        if (nextToken.isNone()) {
            return Option<Json>.None
        }
        match (nextToken.getOrThrow().type1) {
        case arrBegin =>
            return Json(arr, parserArr())
        case arrEnd =>
            return Json(str ,"]")
        case objBegin =>
            return Json(obj ,parserObj())
        case bool_Token =>
            return Json(bool, nextToken.getOrThrow().value == "true")
        case nullValue_Token =>
            return Json(nullValue, "null")
        case str_Token =>
            return Json(str, nextToken.getOrThrow().value)
        case num =>
            if (nextToken.getOrThrow().value.contains("."))  {
                return Json(double, nextToken.getOrThrow().value)
            } else {  
                return Json(int, nextToken.getOrThrow().value)
            }
        case _ =>
            throw Exception("unknown element: nextToken.getOrThrow().type1")
        }
    }
    
    private func parserArr(): ArrayList<Json> {
        var arr = ArrayList<Json>()
        
        do {

            let ele = parseElement()
            
            if (ele.isNone()) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
            if  (ele.getOrThrow().getDescription() == "String(])") {
                break;
            }else{
                arr.add(ele.getOrThrow())
            }

            let next = tokenizer.nextToken()
            if (next.isNone()) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
            if (next.getOrThrow().type1 == arrEnd) {
                break
            }
            
            if (next.getOrThrow().type1 != sepComma) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
        } while (true)

        return arr
    }
    
    private func parserObj(): HashMap<String, Json> {
        var obj = HashMap<String, Json>()

        do {
            let next = tokenizer.nextToken()
            
            if (next.isNone()) {
                throw Exception("ParserError: parserObj error, does not exist key");
            }
            
            let key = next.getOrThrow().value
            
            if (next.getOrThrow().value == "}")  {
                return obj
            }

            if (obj.contains(key)) {
                throw Exception("ParserError: parserObj error, exist key: ${key}")
            }

            let comma = tokenizer.nextToken()
            if (comma.isNone() || JsonTokenType.sepColon != comma.getOrThrow().type1) {
                throw Exception("ParserError: parserObj error:inexistence")
            }
            
            let value = parseElement()
            if (value.isNone()) {
                throw Exception("ParserError: parserObj error:inexistence")
            }

            obj[key] = value.getOrThrow()
            
            let nex = tokenizer.nextToken()
            if (nex.isNone()) {
                throw Exception("ParserError: parserObj error, the next value does not exist")
            }
            
            if (JsonTokenType.objEnd == nex.getOrThrow().type1) {
                break
            }
            if (JsonTokenType.sepComma != nex.getOrThrow().type1) {
                throw Exception("ParserError: parserObj error, does not exist")
            }
        } while (true)

        return obj
    }
    
    private func parse() : ?Json {
        let token = tokenizer.nextToken()
        if (token.isNone()) {
            return Option<Json>.None
        }

        match (token.getOrThrow().type1) {
        case arrBegin =>
            return Json(arr, parserArr())
        case objBegin =>
            return Json(obj, parserObj())
        case _ =>
            return Option<Json>.None
        }
    }
    
}
public func prettyJson(jsonObj: Json): String {

    match (jsonObj.type1.getOrThrow()) {
    case str =>
        return refString(jsonObj.stringValue.getOrThrow());
    case double => return "${jsonObj.doubleValue}"
    case int => 
        return "${jsonObj.intValue}"
    case bool =>
        return "${jsonObj.boolValue.getOrThrow()}"
    case nullValue =>
        return "null"
    case obj =>
        let obj = jsonObj.objectValue
        if (obj is HashMap<String, Any> && obj.getOrThrow().isEmpty()) {
            return "{}"
        }
        return "{" + prettyObject(prettyJson, obj.getOrThrow()) + "}"
    case arr =>
        let arr = jsonObj.arrayValue
        if (arr is ArrayList<Any> && arr.getOrThrow().size == 0) {
            return "[]";
        }
        return "[" + prettyList(prettyJson, arr.getOrThrow()) + "]";
    case _ =>
        return ""
    }
}


func refString(value: String): String {
   return "\"${value}\""
}

func prettyList(pretty: (Json) -> String, list: ArrayList<Json>): String {
    let a: String = list |> map<Json, ToString> { item: Json => pretty(item) } |> collectString(delimiter: ",")
    return a
}


func prettyObject(pretty: (o: Json) -> String, obj: HashMap<String, Json>): String {
    var str = StringBuilder("")
    var count = 0
    var size = obj.size
    // obj.forEach { key: String ,val: Json =>
    for ( (key, val) in obj) {
        count += 1
        str.append(refString(key))
        str.append(":")
        str.append(pretty(val))
        if (count < size) {
          str.append(",")
        }
    }
  return str.toString()
}
 
class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }

}


/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    /*
     * @Benchmark
     */
    func runIteration(){
        let object = JsonParser.parse_ALL(jsonStr)
        let startTime = Timer().getTime()
        for (_ in  0..3){
            let result = prettyJson(object.getOrThrow())
//            debugLog(result)
        }
        let endTime = Timer().getTime()
        println("json-stringify-inspector: ms =  ${Float64((endTime - startTime).toNanoseconds())/1000000.0}")
    }
}

public func debugLog(object: String) {
    let isLog = false
    if (isLog) {
        print(object)
    }
}

main() {
    Benchmark().runIteration()
}

