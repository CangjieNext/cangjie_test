/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

/// 词/token，词法分析结果
class Token {

    var kind: String

    var string: String

    var sourceLineNumber: ?Int64

    var userLineNumber: ?Int64

    var value: ?Any = None

    init(kind: String, string: String, sourceLineNumber: ?Int64, userLineNumber: ?Int64) {
        this.kind = kind
        this.string = string
        this.sourceLineNumber = sourceLineNumber
        this.userLineNumber = userLineNumber
    }

}
type Element = Token
/// 词法分析器
class Lexer <: Iterator<Token> {

    /// 源代码
    var source: String
    /// 源代码行号
    var sourceLineNumber = 1
    /// 是否为行首
    var isLineStart: Bool = false
    /// 用户输入的行号
    var userLineNumber: ?Int64 = 0
    /// 当前解析的代码，也记录了解析的进度
    var currentCode: ?String = Option<String>.None
    /// 所有的代码行
    var lines: Array<String> = Array<String>()
    /// 标识符正则
    let isIdentifier = Regex("^[a-z_]([a-z0-9_]*)")
    /// 数字正则
    let isNumber = Regex("^(([0-9]+(\\.([0-9]*))?)|(\\.[0-9]+)(e([+-]?)([0-9]+))?)")
    /// 字符串正则
    let isString = Regex("^\"([^\"]|(\"\"))*\"")
    /// 关键字正则
    let isKeyword = Regex("^((base)|(data)|(def)|(dim)|(end)|(for)|(go)|(gosub)|(goto)|(if)|(input)|(let)|(next)|(on)|(option)|(print)|(randomize)|(read)|(restore)|(return)|(step)|(stop)|(sub)|(then)|(to))")
    /// 操作符正则
    let isOperator = Regex("^(-|\\+|\\*|\\/|\\^|\\(|\\)|(<[>=]?)|(>=?)|=|,|\\$|;)")

    let isRem = Regex("^rem\\s.*/")

    public init(source!: String) {
        this.source = source
        lines = source.split("\n")
        currentCode = lines[sourceLineNumber - 1]
        isLineStart = true
    }

    /// 匹配并去除空格
    func consumeWhitespace(){
        let reg = Regex("^\\s+")
        if (reg.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let contains = reg.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[contains.getOrThrow().matchString().size..currentCode.getOrThrow().size]
        }
    }
    /// 迭代器 词法解析 provide the next token
    public override func next() : ?Token {
        if (currentCode.isNone()) {
            return Option<Token>.None
        }
        if (isLineStart) {
            consumeWhitespace()
            let issum = Regex("^[0-9]+")
            if (issum.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
                let matches = issum.matcher(currentCode.getOrThrow()).matchStart()
                this.userLineNumber = Int64.parse(matches.getOrThrow().matchString())
                this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
                isLineStart = false
                return Token("userLineNumber", matches.getOrThrow().matchString().size.toString(), sourceLineNumber, userLineNumber.getOrThrow())
            }
        } else {
            consumeWhitespace()
            if (currentCode.getOrThrow().size == 0) {
                isLineStart = true
                if (sourceLineNumber == lines.size) {
                    currentCode = Option<String>.None
                    return Token("newLine", "\n", sourceLineNumber, userLineNumber.getOrThrow())
                } else {
                    let curLineNumber = sourceLineNumber
                    sourceLineNumber += 1
                    currentCode = lines[sourceLineNumber-1]
                    return Token("newLine", "\n", curLineNumber, userLineNumber.getOrThrow())
                }
            }
            return parseToken()
        }
        return Option<Token>.None
    }

    func parseToken() : Token {
        if (isKeyword.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isKeyword.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            return Token("keyword", matches.getOrThrow().matchString(), sourceLineNumber, userLineNumber.getOrThrow())
        } else if (isIdentifier.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isIdentifier.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            return Token("identifier", matches.getOrThrow().matchString(), sourceLineNumber, userLineNumber.getOrThrow())
        } else if (isNumber.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isNumber.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            let token = Token("number", matches.getOrThrow().matchString(), sourceLineNumber, userLineNumber.getOrThrow())
            token.value = Float64.parse(matches.getOrThrow().matchString())
            return token
        } else if (isString.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isString.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            var str = matches.getOrThrow().matchString()
            let start = str.indexOf(str[1]).getOrThrow()
            let end = str.indexOf(str[str.size - 2]).getOrThrow()
            str = String(str[start..=end].toRuneArray())
            let token = Token("string", str.toString(), sourceLineNumber, userLineNumber.getOrThrow())
            token.value = str
            return token
        } else if (isOperator.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isOperator.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            return Token("operator", matches.getOrThrow().matchString(), sourceLineNumber, userLineNumber.getOrThrow())
        } else if (isRem.matcher(currentCode.getOrThrow()).matchStart().isSome()) {
            let matches = isRem.matcher(currentCode.getOrThrow()).matchStart()
            this.currentCode = currentCode.getOrThrow()[matches.getOrThrow().matchString().size..currentCode.getOrThrow().size]
            return Token("remark", matches.getOrThrow().matchString(), sourceLineNumber, userLineNumber.getOrThrow())
        } else {
            return Token("Error", "Error", -1, -1)
        }
    }

    func iteratorLexer(): Iterator<Token> {
        return (this as Iterator<Token>).getOrThrow()
    }

}
