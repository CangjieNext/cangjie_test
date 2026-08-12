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
import std.convert.*
import std.convert.*

private let INT_VAL_P_2 = 2;
private let INT_VAL_P_3 = 3;
private let INT_VAL_P_4 = 4;
private let INT_VAL_P_5 = 5;
private let INT_VAL_P_6 = 6;
private let INT_VAL_P_7 = 7;
private let INT_VAL_P_8 = 8;
private let INT_VAL_P_9 = 9;
private let INT_VAL_P_10 = 10;
private let INT_VAL_P_11 = 11;
private let INT_VAL_P_13 = 13;
private let INT_VAL_P_14 = 14;
private let INT_VAL_P_16 = 16;
private let INT_VAL_P_32 = 32;
private let INT_VAL_P_33 = 33;
private let INT_VAL_P_34 = 34;
private let INT_VAL_P_36 = 36;
private let INT_VAL_P_37 = 37;
private let INT_VAL_P_38 = 38;
private let INT_VAL_P_39 = 39;
private let INT_VAL_P_40 = 40;
private let INT_VAL_P_41 = 41;
private let INT_VAL_P_42 = 42;
private let INT_VAL_P_43 = 43;
private let INT_VAL_P_44 = 44;
private let INT_VAL_P_45 = 45;
private let INT_VAL_P_46 = 46;
private let INT_VAL_P_47 = 47;
private let INT_VAL_P_48 = 48;
private let INT_VAL_P_49 = 49;
private let INT_VAL_P_50 = 50;
private let INT_VAL_P_51 = 51;
private let INT_VAL_P_52 = 52;
private let INT_VAL_P_53 = 53;
private let INT_VAL_P_54 = 54;
private let INT_VAL_P_55 = 55;
private let INT_VAL_P_56 = 56;
private let INT_VAL_P_57 = 57;
private let INT_VAL_P_58 = 58;
private let INT_VAL_P_59 = 59;
private let INT_VAL_P_60 = 60;
private let INT_VAL_P_61 = 61;
private let INT_VAL_P_62 = 62;
private let INT_VAL_P_63 = 63;
private let INT_VAL_P_64 = 64;
private let INT_VAL_P_65 = 65;
private let INT_VAL_P_66 = 66;
private let INT_VAL_P_69 = 69;
private let INT_VAL_P_79 = 79;
private let INT_VAL_P_87 = 87;
private let INT_VAL_P_88 = 88;
private let INT_VAL_P_91 = 91;
private let INT_VAL_P_92 = 92;
private let INT_VAL_P_93 = 93;
private let INT_VAL_P_94 = 94;
private let INT_VAL_P_96 = 96;
private let INT_VAL_P_97 = 97;
private let INT_VAL_P_98 = 98;
private let INT_VAL_P_101 = 101;
private let INT_VAL_P_102 = 102;
private let INT_VAL_P_110 = 110;
private let INT_VAL_P_111 = 111;
private let INT_VAL_P_114 = 114;
private let INT_VAL_P_116 = 116;
private let INT_VAL_P_117 = 117;
private let INT_VAL_P_118 = 118;
private let INT_VAL_P_120 = 120;
private let INT_VAL_P_123 = 123;
private let INT_VAL_P_124 = 124;
private let INT_VAL_P_125 = 125;
private let INT_VAL_P_126 = 126;
private let INT_VAL_P_160 = 160;
private let INT_VAL_P_255 = 255;
private let INT_VAL_P_5760 = 5760;
private let INT_VAL_P_8232 = 8232;
private let INT_VAL_P_8233 = 8233;
private let INT_VAL_P_1023 = 1023;

private let INT_VAL_P_0x10000 = 0x10000;
private let INT_VAL_P_0xd800 = 0xd800;
private let INT_VAL_P_0xdc00 = 0xdc00;
private let INT_VAL_P_0xffff = 0xffff;
private let INT_VAL_P_0x10ffff = 0x10ffff;

private let INT_VAL_P_0xd7ff = 0xd7ff;
private let INT_VAL_P_0xe000 = 0xe000;
private let INT_VAL_P_0x35fdc00 = 0x35fdc00;

func last<T>(stack: ArrayList<T>) : T {
    return stack[stack.size - 1]
}

private let empty: ArrayList<Any> = ArrayList<Any>()

private let beforeExpr = true
private let startsExpr = true
private let isLoop = true
private let isAssign = true
private let prefixBool = true
private let postfixBool = true

private var  keywords: HashMap<String, TokenType> = HashMap<String, TokenType>()
private var  tt: Option<TypesCls> = Option<TypesCls>.None
private var  tc: Option<TokContextCls> = Option<TokContextCls>.None

extend String {
    func getCharUnicode(index: Int64) : Rune{
        var temp: Rune
        var sz: Int64
        unsafe{
            (temp, sz) = Rune.fromUtf8(this.rawData(), index)
        }
        return temp
    }
}

func getTT(): TypesCls {
    match (tt) {
        case Some(tt) => tt
        case None =>
            tt = Some(TypesCls())
            tt.getOrThrow()
    }
}

func getTC(): TokContextCls {
    match (tc) {
        case Some(tc) => tc
        case None =>
            tc = Some(TokContextCls())
            tc.getOrThrow()
    }
}

extend <T> ArrayList<T> {
    public func popLast(): Option<T> {
        if (this.size > 0) {
            return this.remove(at: this.size - 1)
        } else {
            return Option<T>.None
        }
    }

    public func removeLast(): T {
        if (this.size == 0) {
            throw Exception("removeLast")
        } else {
            let ele = this[this.size - 1]
            this.remove(at: this.size - 1)
            return ele
        }
    }

    public func splice(start: Int64, deleteCount: Int64) : ArrayList<T> {
        var deleteItems: ArrayList<T> = ArrayList<T>()
        for (i in (0..this.size)) {
            if (i > start && i < deleteCount) {
                deleteItems.add(this[i])
            }
        }
        return deleteItems
    }
    
    public func slice(start: Int64, end!: ?Int64 = Option<Int64>.None) : ArrayList<T> {
        if (end.isNone()) {
            return ArrayList<T>(this.slice(Range(start,this.size-1,1,true,true,true)))
        }
        return ArrayList<T>(this.slice(Range(start,end.getOrThrow(),1,true,true,false)))
    }

    public func reversed(): ArrayList<T> {
        this.reverse()
        return this
    }
}

extend <T> ArrayList<T> where T <: Equatable<T> {
    public func firstIndex(of: T): Option<Int64> {
        for (_index in 0..this.size) {
            if (this[_index] == of) {
                return Some(_index)
            }
        }
        return Option<Int64>.None
    }    
}

public class TokenOptions {
    
    var keyword: ?String = Option<String>.None
    var beforeExpr: ?Bool = Option<Bool>.None
    var startsExpr: ?Bool = Option<Bool>.None
    var rightAssociative: ?Bool = Option<Bool>.None
    var isLoop: ?Bool = Option<Bool>.None
    var isAssign: ?Bool = Option<Bool>.None
    var prefix: ?Bool = Option<Bool>.None
    var postfix: ?Bool = Option<Bool>.None
    var binop: ?Int64 = Option<Int64>.None
}


public class TokenType <: Equatable<TokenType> {
    public operator func == (rhs: TokenType) : Bool {
        if (refEq(this, rhs)) {
            return true
        } else {
            return false
        }
    }

    public operator func != (rhs: TokenType) : Bool {
        return !(this == rhs)
    }

    var label: String
    var keyword: ?String = Option<String>.None
    var beforeExpr: Bool
    var startsExpr: Bool
    var rightAssociative: Bool
    var isLoop: Bool
    var isAssign: Bool
    var prefix: Bool
    var postfix: Bool
    var binop: ?Int64
    var updateContext: ?((target: Tokenizer, prevType: ?TokenType) -> Unit) = None
        
    init(label : String, conf!: TokenOptions = TokenOptions()) {
        this.label = label
        this.keyword = conf.keyword
        this.beforeExpr = conf.beforeExpr ?? false
        this.startsExpr = conf.startsExpr ?? false
        this.rightAssociative = conf.rightAssociative ?? false
        this.isLoop = conf.isLoop ?? false
        this.isAssign = conf.isAssign ?? false
        this.prefix = conf.prefix ?? false
        this.postfix = conf.postfix ?? false
        if (conf.binop.isSome()) {
            this.binop = conf.binop
        } else {
            this.binop = Option<Int64>.None
        }
	    this.updateContext = Option<((target: Tokenizer, prevType: ?TokenType) -> Unit)>.None
    }

}

func createKeyword(name: String, options!: TokenOptions = TokenOptions()) : TokenType {
    options.keyword = name
    let token = TokenType(name, conf: options)
    keywords[name] = token
    return token;
}

func createBinop(name: String, binop: Int64) : TokenType {
    let conf = TokenOptions()
    conf.binop = binop
    return TokenType(name, conf:conf)
}

public class TypesCls {
    let num: TokenType
    let regexp: TokenType
    let string: TokenType
    let name: TokenType
    let eof: TokenType
    let bracketL: TokenType
    let bracketR: TokenType
    let braceL: TokenType
    let braceBarL: TokenType
    let braceR: TokenType
    let braceBarR: TokenType
    let parenL: TokenType
    let parenR: TokenType
    let comma: TokenType
    let semi: TokenType
    let colon: TokenType
    let doubleColon: TokenType
    let dot: TokenType
    let question: TokenType
    let arrow: TokenType
    let template: TokenType
    let ellipsis: TokenType
    let backQuote: TokenType
    let dollarBraceL: TokenType
    let at: TokenType
    let eq: TokenType
    let assign: TokenType
    let incDec: TokenType
    let prefix: TokenType
    let logicalOR: TokenType
    let logicalAND: TokenType
    let bitwiseOR: TokenType
    let bitwiseXOR: TokenType
    let bitwiseAND: TokenType
    let equality: TokenType
    let relational: TokenType
    let bitShift: TokenType
    let plusMin : TokenType
    let modulo: TokenType
    let star: TokenType
    let slash: TokenType
    let exponent: TokenType
    
    
    let _break: TokenType
    let _case: TokenType
    let _catch: TokenType
    let _continue: TokenType
    let _debugger: TokenType
    let _default: TokenType
    let _do: TokenType
    let _else: TokenType
    let _finally: TokenType
    let _for: TokenType
    let _function: TokenType
    let _if: TokenType
    let _return: TokenType
    let _switch: TokenType
    let _throw: TokenType
    let _try: TokenType
    let _let: TokenType
    let _var: TokenType
    let _const: TokenType
    let _while: TokenType
    let _with: TokenType
    let _new: TokenType
    let _this: TokenType
    let _super: TokenType
    let _class: TokenType
    let _extends: TokenType
    let _export: TokenType
    let _import: TokenType
    let _null: TokenType
    let _true: TokenType
    let _false: TokenType
    let _in: TokenType
    let _instanceof: TokenType
    let _typeof: TokenType
    let _void: TokenType
    let _delete: TokenType
    let _yield: TokenType
    var jsxTagStart: ?TokenType
    var jsxText: ?TokenType
    var jsxName: ?TokenType
    var jsxTagEnd: ?TokenType

    init() {
        let startsOp = TokenOptions()
        startsOp.startsExpr = startsExpr
        
        let beforeOP = TokenOptions()
        beforeOP.beforeExpr = beforeExpr
        
        let allOp = TokenOptions()
        allOp.beforeExpr = beforeExpr
        allOp.startsExpr = startsExpr
        
        let opIncDec = TokenOptions()
        opIncDec.prefix = prefixBool
        opIncDec.postfix = postfixBool
        opIncDec.startsExpr = startsExpr
        
        let opBeforeIsAssign = TokenOptions()
        opBeforeIsAssign.beforeExpr = beforeExpr
        opBeforeIsAssign.isAssign = isAssign
        
        let opPlusMin = TokenOptions()
        opPlusMin.beforeExpr = beforeExpr
        opPlusMin.binop = INT_VAL_P_9
        opPlusMin.prefix = prefixBool
        opPlusMin.startsExpr = startsExpr
        
        let opPerfix = TokenOptions()
        opPerfix.beforeExpr = beforeExpr
        opPerfix.prefix = prefixBool
        opPerfix.startsExpr = startsExpr
        
        let opExponent = TokenOptions()
        opExponent.beforeExpr = beforeExpr
        opExponent.binop = INT_VAL_P_11
        opExponent.rightAssociative = true
        
        let loopAndBefore = TokenOptions()
        loopAndBefore.isLoop = isLoop
        loopAndBefore.beforeExpr = beforeExpr
        
        let loop = TokenOptions()
        loop.isLoop = isLoop
        
        let _inOP = TokenOptions()
        _inOP.beforeExpr = beforeExpr
        _inOP.binop = INT_VAL_P_7
        

        num = TokenType("num", conf: startsOp)
        regexp = TokenType("regexp", conf: startsOp)
        string = TokenType("string", conf: startsOp)
        name = TokenType("name", conf: startsOp)
        eof = TokenType("eof")
        bracketL = TokenType("[", conf: allOp)
        bracketR = TokenType("]")
        braceL = TokenType("{", conf: allOp)
        braceBarL = TokenType("{|", conf: allOp)
        braceR = TokenType("}")
        braceBarR = TokenType("|}")
        parenL = TokenType("(", conf: allOp)
        parenR = TokenType(")")
        comma = TokenType(",", conf: beforeOP)
        semi = TokenType(";", conf: beforeOP)
        colon = TokenType(":", conf: beforeOP)
        doubleColon = TokenType("::", conf: beforeOP)
        dot = TokenType(".")
        question = TokenType("?", conf: beforeOP)
        arrow = TokenType("=>", conf: beforeOP)
        template = TokenType("template")
        ellipsis = TokenType("...", conf: beforeOP)
        backQuote = TokenType("`", conf: startsOp)
        dollarBraceL = TokenType(##"${"##, conf: allOp)
        at = TokenType("@")
        eq = TokenType("=", conf: opBeforeIsAssign)
        assign = TokenType("_=", conf: opBeforeIsAssign)
        incDec = TokenType("++/--", conf: opIncDec)
        prefix = TokenType("prefix", conf: opPerfix)
        logicalOR = createBinop("||", 1)
        logicalAND = createBinop("&&", INT_VAL_P_2)
        bitwiseOR = createBinop("|", INT_VAL_P_3)
        bitwiseXOR = createBinop("^", INT_VAL_P_4)
        bitwiseAND = createBinop("&", INT_VAL_P_5)
        equality = createBinop("==/!=", INT_VAL_P_6)
        relational = createBinop("</>", INT_VAL_P_7)
        bitShift = createBinop("<</>>", INT_VAL_P_8)
        plusMin = TokenType("+/-", conf: opPlusMin)
        modulo = createBinop("%", INT_VAL_P_10)
        star = createBinop("*", INT_VAL_P_10)
        slash = createBinop("/", INT_VAL_P_10)
        exponent = TokenType("**", conf: opExponent)
        
        _break = createKeyword("break")
        _case = createKeyword("case", options: beforeOP)
        _catch = createKeyword("catch")
        _continue = createKeyword("continue")
        _debugger = createKeyword("debugger")
        _default = createKeyword("default", options: beforeOP)
        _do = createKeyword("do", options: loopAndBefore)
        _else = createKeyword("else", options: beforeOP)
        _finally = createKeyword("finally")
        _for = createKeyword("for", options: loop)
        _function = createKeyword("function", options: startsOp)
        _if = createKeyword("if")
        _return = createKeyword("return", options: beforeOP)
        _switch = createKeyword("switch")
        _throw = createKeyword("throw", options: opPerfix)
        _try = createKeyword("try")
        _var = createKeyword("var")
        _let = createKeyword("let")
        _const = createKeyword("const")
        _while = createKeyword("while", options: loop)
        _with = createKeyword("with")
        _new = createKeyword("new", options: allOp)
        _this = createKeyword("this", options: startsOp)
        _super = createKeyword("super", options: startsOp)
        _class = createKeyword("class", options: startsOp)
        _extends = createKeyword("extends", options: beforeOP)
        _export = createKeyword("export")
        _import = createKeyword("import", options: startsOp)
        _null = createKeyword("null", options: startsOp)
        _true = createKeyword("true", options: startsOp)
        _false = createKeyword("false", options: startsOp)
        _in = createKeyword("in", options: _inOP)
        _instanceof = createKeyword("instanceof", options: _inOP)
        _typeof = createKeyword("typeof", options: opPerfix)
        _void = createKeyword("void", options: opPerfix)
        _delete = createKeyword("delete", options: opPerfix)
        _yield = createKeyword("yield", options: allOp)
        jsxName = TokenType("jsxName");
        jsxText = TokenType("jsxText", conf: beforeOP);
        jsxTagStart = TokenType("jsxTagStart", conf: startsOp);
        jsxTagEnd = TokenType("jsxTagEnd");
        
        
        parenR.updateContext = { target, prev =>
            let selfLess = target
            
            if (selfLess.state.context.getOrThrow().size == 1) {
                selfLess.state.exprAllowed = true
                return
            }
            let out = selfLess.state.context.getOrThrow().popLast()

            if (refEq(out.getOrThrow(), getTC().braceStatement) && refEq(selfLess.curContext().getOrThrow(), getTC().functionExpression)) {
                selfLess.state.context.getOrThrow().popLast()
                selfLess.state.exprAllowed = false
            } else if (refEq(out.getOrThrow(), getTC().templateQuasi)) {
                selfLess.state.exprAllowed = true
            } else {
                selfLess.state.exprAllowed = !out.getOrThrow().isExpr
            }
        }
        
        braceR.updateContext = parenR.updateContext
        
        name.updateContext = { target, prevType =>
            let selfLess = target
            selfLess.state.exprAllowed = false
            if (refEq(prevType.getOrThrow(), this._let) || refEq(prevType.getOrThrow(), this._const) || refEq(prevType.getOrThrow(), this._var)) {
                let startT = selfLess.input.size - Int64(selfLess.state.end)
                let str = selfLess.input[startT..selfLess.input.size]
                if (let Some(reult) <- lineBreak.matcher(str).matchStart()) {
                    selfLess.state.exprAllowed = true
                } 
                selfLess.state.exprAllowed = true
            }
        }
        
        braceL.updateContext = { target, prevType =>
            let selfLess = target
            let tokContext : TokContext
            if (selfLess.braceIsBlock(prevType.getOrThrow())) {
                tokContext = getTC().braceStatement
            } else {
                tokContext = getTC().braceExpression
            }
            selfLess.state.context.getOrThrow().add(tokContext)
            selfLess.state.exprAllowed = true
        }
        
        dollarBraceL.updateContext = { target,  _ =>
            let selfLess = target
            selfLess.state.context.getOrThrow().add(getTC().templateQuasi)
            selfLess.state.exprAllowed = true
        }
        
        parenL.updateContext = { target, prevType =>
            let selfLess = target
            let statementParens = refEq(prevType.getOrThrow(), this._if) || refEq(prevType.getOrThrow(), this._for) || 
            refEq(prevType.getOrThrow(), this._with) || refEq(prevType.getOrThrow(), this._while)
            if (statementParens) {
                selfLess.state.context.getOrThrow().add(getTC().parenStatement)
            } else {
                selfLess.state.context.getOrThrow().add(getTC().parenExpression)
            }
            selfLess.state.exprAllowed = true
        }
        
        incDec.updateContext = { _, _ =>
            
        }
        
        _function.updateContext = { target, _ =>
            let selfLess = target
            if (!refEq(selfLess.curContext().getOrThrow(), getTC().braceStatement)) {
                selfLess.state.context.getOrThrow().add(getTC().functionExpression)
            }
            selfLess.state.exprAllowed = false
        }
        
        backQuote.updateContext = { target, _  =>
            let selfLess = target
            if (refEq(selfLess.curContext().getOrThrow(), getTC().template)) {
                selfLess.state.context.getOrThrow().popLast();
              } else {
                selfLess.state.context.getOrThrow().add(getTC().template);
              }
              selfLess.state.exprAllowed = false;
        }
        
        jsxTagStart.getOrThrow().updateContext = { target, _ =>
            let selfLess = target
            selfLess.state.context.getOrThrow().add(getTC().j_expr); // treat as beginning of JSX expression
            selfLess.state.context.getOrThrow().add(getTC().j_oTag); // start opening tag context
            selfLess.state.exprAllowed = false;
        }

        jsxTagEnd.getOrThrow().updateContext = { target, prevType =>
          let selfLess = target
          let out = selfLess.state.context.getOrThrow().popLast();
          if ((refEq(out.getOrThrow(), getTC().j_oTag) && prevType == this.slash || refEq(out.getOrThrow(), getTC().j_cTag))) {
            selfLess.state.context.getOrThrow().popLast();
            selfLess.state.exprAllowed = refEq(selfLess.curContext().getOrThrow(), getTC().j_expr);
          } else {
            selfLess.state.exprAllowed = true;
          }
        };
    }
}

public class State {

    var strict: Bool = false
    
    var input: ?String = Option<String>.None
    
    var potentialArrowAt: ?Int64 = Option<Int64>.None
    
    var inFunction: Bool = false
    
    var inGenerator: Bool = false
    
    var inMethod: ?Any = Option<Any>.None
    
    var inAsync: Bool = false
    
    var inType: Bool = false
    
    var inPropertyName: Bool = false
    
    var noAnonFunctionType: Bool = false
    
    var labels: ?ArrayList<Any> = Option<ArrayList<Any>>.None //(Node|Label)[];
    
    var decorators: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    
    var tokens: ?ArrayList<Any> = Option<ArrayList<Any>>.None // (Token | Comment)[];
    
    var comments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    
    var trailingComments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    
    var leadingComments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    
    var commentStack: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    
    var curLine: Int64 = 0
    
    var startLoc: ?Position0 = Option<Position0>.None
    
    var endLoc: ?Position0 = Option<Position0>.None
    
    var pos: Int64 = 0
    
    var lineStart: Int64 = 0
    
    var _type: TokenType = TokenType("") 

    var value: ?Any = Option<Any>.None // string | RegConfig | number | boolean | null
    
    var start: Int64 = 0
    
    var end: Int64 = 0
    
    var lastTokEndLoc: ?Position0 = Option<Position0>.None
    
    var lastTokStartLoc: ?Position0 = Option<Position0>.None
    
    var lastTokStart: Int64 = 0
    
    var lastTokEnd: Int64 = 0
    
    var context: ?ArrayList<TokContext> = Option<ArrayList<TokContext>>.None
    
    var exprAllowed: Bool = false
    
    var containsEsc: Bool = false
    
    var containsOctal: Bool = false
    
    var octalPosition: ?Int64 = Option<Int64>.None
    
    var invalidTemplateEscapePosition0: ?Int64 = Option<Int64>.None
    
    var exportedIdentifiers: ?ArrayList<String> = Option<ArrayList<String>>.None
    
    var commentPreviousNode: ?Node = Option<Node>.None

    func `init`( options: ParserOptions, input: String) : State {
        if (options.strictMode == false) {
            strict = false
        } else {
            strict = options.sourceType == "module"
        }
        this.input = input;
        potentialArrowAt = -1;
        inMethod = false
        inFunction = false
        inGenerator = false
        inAsync = false
        inPropertyName = false
        inType = false
        noAnonFunctionType = false
        labels = ArrayList<Any>()
        decorators = ArrayList<Node>()
        tokens = ArrayList<Any>()
        comments = ArrayList<Comment>()
        trailingComments = ArrayList<Comment>()
        leadingComments  = ArrayList<Comment>()
        commentStack     = ArrayList<Node>()
        pos = 0
        lineStart = 0
        curLine = options.startLine.getOrThrow()
        _type = getTT().eof
        value = Option<Any>.None
        start = pos
        end = pos
        startLoc = curPosition()
        endLoc = curPosition()
        lastTokEndLoc = Option<Position0>.None
        lastTokStartLoc = Option<Position0>.None
        lastTokStart = pos
        lastTokEnd = pos
        context = ArrayList<TokContext>([getTC().braceStatement])
        exprAllowed = true
        containsEsc = false
        containsOctal = false
        octalPosition = Option<Int64>.None
        invalidTemplateEscapePosition0 = Option<Int64>.None
        exportedIdentifiers = ArrayList<String>();
        return this;
    }
    
    func curPosition(): Position0 {
        return Position0(curLine, pos - lineStart);
    }

    func clone(skipArrays!: ?Bool = Option<Bool>.None) : State {
        let state = State()
        return state
    }

}

public class Token {
    var _type: TokenType
    var value: ?Any
    var start: Int64
    var end: Int64
    var loc: SourceLocation

    init( state: State) {
        this._type = state._type
        this.value = state.value
        this.start = state.start
        this.end = state.end
        this.loc = SourceLocation(state.startLoc, end: state.endLoc)
    }
}

func codePointToString(code: Int64): String {
    return String(Rune(code))
}

public open class Tokenizer {
    var state: State
    var options: ParserOptions
    var isLookahead: Bool = false
    var input: String
    var inModule: Bool = false
    
    init(options: ParserOptions, input: String) {
        this.options = options
        this.state = State()
	    this.input = input
        this.state.`init`(options, input)
    }
    
    func next() {
        if (!isLookahead) {
            state.tokens.getOrThrow().add(Token(state))
        }
        state.lastTokEnd = state.end
        state.lastTokStart = state.start
        state.lastTokEndLoc = state.endLoc
        state.lastTokStartLoc = state.startLoc
        nextToken()
    }
    
    func eat( _type: TokenType) : Bool {
        if (matchX(_type)) {
            next()
            return true
        } else {
            return false
        }
    }

    
    func matchX(_type: TokenType) : Bool {
        return refEq(state._type, _type)
    }
    
    open public func isKeyword(word: String) : Bool {
        return isKeywordFunc(word)
    }
    
    func lookahead(): State {
        let old = state
        state = old.clone(skipArrays: true)
        isLookahead = true
        next()
        isLookahead = false
        let curr = state.clone(skipArrays: true)
        state = old
        return curr
    }
                                        
    func setStrict( strict: Bool) {skipSpace
        state.strict = strict
        if (!matchX(getTT().num) && !matchX(getTT().string)) {
            return
        }
        state.pos = this.state.start
        while (state.pos < state.lineStart) {
            state.lineStart = this.input.lastIndexOf("\n", this.state.lineStart - INT_VAL_P_2) ?? -1  + 1
            state.curLine -= 1
        }
        nextToken()
    }
    
    func curContext(): ?TokContext {
        return state.context.getOrThrow()[state.context.getOrThrow().size - 1]
    }
    
    func nextToken() : Unit {
        let curContext = curContext()
        if (((curContext.isNone()) || !curContext.getOrThrow().preserveSpace)) {
            skipSpace()
        }
        state.containsOctal = false
        state.octalPosition = Option<Int64>.None
        state.start = state.pos
        state.startLoc = state.curPosition()
        if ((state.pos >= input.size)) {
            return finishToken(getTT().eof, val: Option<Any>.None)
        }
        if ((curContext.getOrThrow().overridee.isSome())) {
            return curContext.getOrThrow().overridee.getOrThrow()(this)
        } else {
          return readToken(fullCharCodeAtPos())
        }
    }
    
    open public func readToken( code: Int64) : Unit {
        if (isIdentifierStart(code) || code == INT_VAL_P_92) {
            return readWord()
        } else {
            return getTokenFromCode(code)
        }
    }

    func fullCharCodeAtPos() : Int64 {
        let code:Int64 = Int64(UInt32(input.getCharUnicode(state.pos)))
        if ((code <= INT_VAL_P_0xd7ff) || (code >= INT_VAL_P_0xe000)) {
            return Int64(code)
        }
        let next = UInt32(input.getCharUnicode(state.pos+1))
        return Int64(UInt32(code << INT_VAL_P_10) + next - UInt32(INT_VAL_P_0x35fdc00))
    }
    
    func pushComment( block: Bool,  text: String,  start: Int64,  end: Int64,  startLoc: Position0,  endLoc: Position0) {
        let comment : Comment
        if (block) {
            comment = Comment("CommentBlock", text, start, end, SourceLocation(startLoc, end: endLoc))
        } else {
            comment = Comment("CommentLine", text, start, end, SourceLocation(startLoc, end: endLoc))
        }
        if ((!isLookahead)) {
            state.tokens.getOrThrow().add(comment)
            state.comments.getOrThrow().add(comment)
            addComment(comment)
        }
    }
    
    /*********** some method impletement in subclass `parser` *****/
    open public func addComment( comment: Comment) : Unit {
        throw Exception("impletement in subclass parser")
    }
    
    open public func raise( pos: ?Int64,  message: String)  {
        // throw Exception("impletement in subclass parser")
    }
    
    open public func hasPlugin( name: String) : Bool {
        throw Exception("impletement in subclass parser")
        return false
    }
    
    open public func unexpected( pos: ?Int64,  messageOrType: ?Any) : Unit{
        throw Exception("impletement in subclass parser")
    }
    
    func skipBlockComment() {
        let startLoc: Position0 = this.state.curPosition()
        let start: Int64 = this.state.pos
        this.state.pos += INT_VAL_P_2
        let end = this.input.indexOf("*/", this.state.pos) ?? -1
        if (end == -1) {
            this.raise(this.state.pos - INT_VAL_P_2, "Unterminated comment")
        }
        this.state.pos = end + INT_VAL_P_2
        var matches = lineBreakG.matcher(this.input)
        matches.setRegion(start, this.state.pos)
        var startIndex = 0
        var matches_data = matches.find(startIndex)
        while (matches_data.isSome() && matches_data.getOrThrow().matchPosition().start < this.state.pos) {
            this.state.curLine += 1
            this.state.lineStart = matches_data.getOrThrow().matchPosition().end + 1
            startIndex = this.state.lineStart
            matches_data = matches.find(startIndex)
        }       
        pushComment(true, input.slice(start + INT_VAL_P_2, end), start, state.pos, startLoc, state.curPosition())
    }
            
    open public func skipLineComment(startSkip: Int64) {
        let start = state.pos
        let startLoc = state.curPosition()
        state.pos += startSkip
        var ch = Int64(UInt32(input.getCharUnicode(state.pos)))
        
        while ((state.pos < input.size && ch != INT_VAL_P_10 && ch != INT_VAL_P_13 && ch != INT_VAL_P_8232 && ch != INT_VAL_P_8233)) {
            state.pos += 1
            ch = Int64(UInt32(input.getCharUnicode(state.pos)))
        }
        pushComment(false, input.slice(start + startSkip, state.pos), start, state.pos, startLoc, state.curPosition())
    }
    
    func skipSpace() {
        var BKwhile = false
        while (state.pos < input.size) {
            let ch = Int64(UInt32(input.getCharUnicode(state.pos)))
            match(ch) {
            case 32 =>
                state.pos += 1
            case 160 =>
                state.pos += 1
            case 13 =>
                if (Int64(UInt32(input.getCharUnicode(state.pos+1))) == INT_VAL_P_10) {
                    state.pos += 1
                }
                //fallthrough
                state.pos += 1
                state.curLine += 1
                state.lineStart = state.pos
            case 10 | 8232 | 8233 =>
                state.pos += 1
                state.curLine += 1
                state.lineStart = state.pos
            case 47 =>
                let ch00 = Int64(UInt32(input.getCharUnicode(state.pos+1)))
                
                match (ch00) {
                    case 42 => // '*'
                        skipBlockComment()
                    case 47 =>
                        skipLineComment(INT_VAL_P_2)
                    case _ =>
                        BKwhile = true
                }
                
            case _ =>
                let match1 = nonASCIIwhitespace.contains(String(Rune(ch)))
                if (ch > INT_VAL_P_8 && ch < INT_VAL_P_14 || (ch >= INT_VAL_P_5760 && match1)) {
                    state.pos += 1
                } else {
                    BKwhile = true
                }
            }
            if (BKwhile) {
                break
            }
        }
    }
    
    func finishToken( _type: TokenType,  val!: ?Any = Option<Any>.None) {
        state.end = state.pos
        state.endLoc = state.curPosition()
        let prevType = state._type
        state._type = _type
        state.value = val
        updateContext(prevType)
    }
 
    func readTokenDot() : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
        
        if ((next >= INT_VAL_P_48 && next <= INT_VAL_P_57)) {
            return readNumber(true)
        }
        let next2 = Int64(UInt32(input.getCharUnicode(state.pos + INT_VAL_P_2)))
        if ((next == INT_VAL_P_46 && next2 == INT_VAL_P_46)) {
            state.pos += INT_VAL_P_3
            return finishToken(getTT().ellipsis, val:Option<Any>.None)
        } else {
            state.pos += 1
            return finishToken(getTT().dot, val:Option<Any>.None)
        }
    }
    
    func readTokenSlash() : Unit {
        if ((state.exprAllowed)) {
            state.pos += 1
            return readRegexp()
        }
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
        
        if ((next == INT_VAL_P_61)) {
            return finishOp(getTT().assign, INT_VAL_P_2)
        } else {
            return finishOp(getTT().slash, 1)
        }
    }

    func readTokenMultModulo( code:Int64) : Unit {
        var _type : TokenType
        if (code == INT_VAL_P_42) {
            _type = getTT().star
        } else {
            _type = getTT().modulo
        }
        var width = 1
        var next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
        
        if ((next == INT_VAL_P_42)) {
            width += 1
            let s1 = String(input.getCharUnicode(state.pos + INT_VAL_P_2)).toArray()
            next = Int64(s1[0])
            _type = getTT().exponent
        }
        if ((next == INT_VAL_P_61)) {
            width += 1
            _type = getTT().assign
        }
        return finishOp(_type, width)
    }

    func readTokenPipeAmp( code: Int64) : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
        
        if ((next == code)) {
            if (code == INT_VAL_P_124) {
                return finishOp(getTT().logicalOR, INT_VAL_P_2)
            } 
            return finishOp(getTT().logicalAND, INT_VAL_P_2)
        }
        if ((next == INT_VAL_P_61)) {
            return finishOp(getTT().assign, INT_VAL_P_2)
        }
        if ((code == INT_VAL_P_124 && next == INT_VAL_P_125 && hasPlugin("flow"))) {
            return finishOp(getTT().braceBarR, INT_VAL_P_2)
        }
        if (code == INT_VAL_P_124) {
            return finishOp(getTT().bitwiseOR, 1)
        } 
        return finishOp(getTT().bitwiseAND, 1)
    }

    func readTokenCaret() : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
        
        if ((next == INT_VAL_P_61)) {
            println("------------------------readTokenCaret-------------")
            return finishOp(getTT().assign, INT_VAL_P_2)
        } else {
            return finishOp(getTT().bitwiseXOR, 1)
        }
    }
    
    func readTokenPlusMin( code: Int64) : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))

        if ((next == code)) {
            let match1 = lineBreak.matcher(input.slice(state.lastTokStart, state.pos)).matchStart()
            let s1 = String(input.getCharUnicode(state.pos + INT_VAL_P_2)).toArray()
            if ((next == INT_VAL_P_45 && Int64(s1[0]) == INT_VAL_P_62) && match1.isSome()) {
                skipLineComment(INT_VAL_P_3)
                skipSpace()
                return nextToken()
            }
            return finishOp(getTT().incDec, INT_VAL_P_2)
        }
        
        if (next == INT_VAL_P_61) {
            return finishOp(getTT().assign, INT_VAL_P_2)
        } else {
            return finishOp(getTT().plusMin, 1)
        }
    }
    
    func readTokenLtGt( code: Int64) : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))

        var size = 1
        if ((next == code)) {
            let s1 = String(input.getCharUnicode(state.pos + INT_VAL_P_2)).toArray()
            if (code == INT_VAL_P_62 && Int64(s1[0]) == INT_VAL_P_62) {
                size = INT_VAL_P_3
            } else {
                size = INT_VAL_P_2
            }
            let s2 = String(input.getCharUnicode(state.pos + size)).toArray()
            let next = Int64(s1[0])
            if (Int64(s2[0]) == 61) {
                return finishOp(getTT().assign, size + 1)
            }
            return finishOp(getTT().bitShift, size)
        }
        if (next == INT_VAL_P_33 && code == INT_VAL_P_60 && (Int64(UInt32(input.getCharUnicode(state.pos + INT_VAL_P_3))) == INT_VAL_P_45) && (Int64(UInt32(input.getCharUnicode(state.pos + INT_VAL_P_3))) == INT_VAL_P_45)) {
            if (inModule) {
                unexpected(None, Option<Any>.None)
            }
            skipLineComment(INT_VAL_P_4)
            skipSpace()
            return nextToken()
        }
        if ((next == INT_VAL_P_61)) {
            size = INT_VAL_P_2
        }
        return finishOp(getTT().relational, size)
    }
    
    func readTokenEqExcl(code: Int64) : Unit {
        let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))

        if ((next == INT_VAL_P_61)) {
            if (Int64(UInt32(input.getCharUnicode(state.pos + INT_VAL_P_2))) == INT_VAL_P_61) {
                return finishOp(getTT().equality, INT_VAL_P_3)
            } 
            return finishOp(getTT().equality, INT_VAL_P_2)
        }
        if ((code == INT_VAL_P_61 && next == INT_VAL_P_62)) {
            state.pos += INT_VAL_P_2
            return finishToken(getTT().arrow)
        }
        if (code == INT_VAL_P_61) {
            return finishOp(getTT().eq, 1)
        } 
        return finishOp(getTT().prefix, 1)
    
    }
    
    func getTokenFromCode(code: Int64) : Unit {
        match (code) {
        case 46 =>
            return readTokenDot()
        case 40 =>
            state.pos += 1
            return finishToken(getTT().parenL, val:Option<Any>.None)
        case 41 =>
            state.pos += 1
            return finishToken(getTT().parenR, val:Option<Any>.None)
        case 59 =>
            state.pos += 1
            return finishToken(getTT().semi, val:Option<Any>.None)
        case 44 =>
            state.pos += 1
            return finishToken(getTT().comma, val:Option<Any>.None)
        case 91 =>
            state.pos += 1
            return finishToken(getTT().bracketL, val:Option<Any>.None)
        case 93 =>
            state.pos += 1
            return finishToken(getTT().bracketR, val:Option<Any>.None)
        case 123 =>
            if ((hasPlugin("flow") && Int64(UInt32(input.getCharUnicode(state.pos+1))) == 124)) {
                return finishOp(getTT().braceBarL, INT_VAL_P_2)
            } else {
                state.pos += 1
                return finishToken(getTT().braceL, val:Option<Any>.None)
            }
        case 125 =>
            state.pos += 1
            return finishToken(getTT().braceR, val:Option<Any>.None)
        case 58 =>
            if ((hasPlugin("functionBind") && Int64(UInt32(input.getCharUnicode(state.pos+1))) == 58)) {
                return finishOp(getTT().doubleColon, INT_VAL_P_2)
            } else {
                state.pos += 1
                return finishToken(getTT().colon, val:Option<Any>.None)
            }
        case 63 =>
            state.pos += 1
            return finishToken(getTT().question, val:Option<Any>.None)
        case 64 =>
            state.pos += 1
            return finishToken(getTT().at, val:Option<Any>.None)
        case 96 =>
            state.pos += 1
            return finishToken(getTT().backQuote, val:Option<Any>.None)
        case 48 =>
            let next = Int64(UInt32(input.getCharUnicode(state.pos+1)))
            if ((next == INT_VAL_P_120 || next == INT_VAL_P_88)) {
                return readRadixNumber(INT_VAL_P_16)
            }
            if ((next == INT_VAL_P_111 || next == INT_VAL_P_79)) {
                return readRadixNumber(INT_VAL_P_8)
            }
            if ((next == INT_VAL_P_98 || next == INT_VAL_P_66)) {
                return readRadixNumber(INT_VAL_P_2)
            }
            //fallthrough
            return readNumber(false)
        case 49 => 
            return readNumber(false) 
        case 50 =>  
            return readNumber(false)
        case 51 =>  
            return readNumber(false)
        case 52 => 
            return readNumber(false) 
        case 53 =>  
            return readNumber(false)
        case 54 =>  
            return readNumber(false)
        case 55 =>  
            return readNumber(false)
        case 56 =>  
            return readNumber(false)
        case 57 =>
            return readNumber(false)
        case 34 =>
            return readString(code) 
        case 39 =>
            return readString(code)
        case 47 =>
            return readTokenSlash()
        case 37 =>
            return readTokenMultModulo(code)
        case 42 =>
            return readTokenMultModulo(code)
        case 124 =>
            return readTokenPipeAmp(code)
        case 38 =>
            return readTokenPipeAmp(code)
        case 94 =>
            return readTokenCaret()
        case 43 =>
            return readTokenPlusMin(code)
        case 45 =>
            return readTokenPlusMin(code)
        case 60 =>
            return readTokenLtGt(code)
        case 62 =>
            return readTokenLtGt(code)
        case 61 =>
            return readTokenEqExcl(code)
        case 33 =>
            return readTokenEqExcl(code)
        case 126 =>
            return finishOp(getTT().prefix, 1)
        case _ => 
            ()
        }
        raise(state.pos, "Unexpected character ${codePointToString(code)}")
    }
    
    func finishOp( _type: TokenType,  size: Int64) : Unit {
      let str = input.slice(state.pos, state.pos + size)
      state.pos += size
      return finishToken(_type, val:str)
    }
    
    func readRegexp() : Unit {
        let start = state.pos
        var escaped = false
        var inClass = false
        while (true) {
            if (state.pos >= input.size) {
                raise(start, "Unterminated regular expression")
            }
            let ch = input[state.pos]
            if (lineBreak.matcher(String(Rune(ch))).matchStart().isSome()) {
                raise(start, "Unterminated regular expression")
            }
            if (escaped) {
                escaped = false
            } else {
                if ((ch == UInt8(UInt32(r'[')))) {
                    inClass = true
                } else if ((ch == UInt8(UInt32(r']')) && inClass)) {
                    inClass = false
                } else if ((ch == UInt8(UInt32(r'/')) && !inClass)) {
                    break
                }
                escaped = (ch == UInt8(UInt32(r'\\')))
            }
            state.pos += 1
        }
        let content = input.slice(start, state.pos)
        state.pos += 1
        let mods = readWord1()
        if (mods.size > 0) {
            let validFlags = Regex("^[gmsiyu]*$")
            if (validFlags.matcher(mods).matchStart().isNone()) {
                raise(start, "Invalid regular expression flag")
            }
        }
        return finishToken(getTT().regexp, val: RegConfig(content, mods))
    }

    func readInt64(radix: Int64, len!: ?Int64 = Option<Int64>.None): ?Int64 {
        let start = state.pos
        var total = 0
        var i = 0
        let e : Int64  
        if (len.isNone()) {
            e = Int64.Max
        } else {
            e = len.getOrThrow()
        }
        while (i < e) {
            let code = Int64(UInt32(input.getCharUnicode(state.pos)))
            let val: Int64
            if ((code >= INT_VAL_P_97)) {
                val = Int64(code) - INT_VAL_P_97 + INT_VAL_P_10
            } else if ((code >= INT_VAL_P_65)) {
                val = Int64(code) - INT_VAL_P_65 + INT_VAL_P_10
            } else if ((code >= INT_VAL_P_48 && code <= INT_VAL_P_57)) {
                val = Int64(code) - INT_VAL_P_48
            } else  {
                val = Int64.Max
            }
            if ((val >= radix)) {
                break
            }
            state.pos += 1
            total = total * radix + val
            i += 1
        }
        if ((state.pos == start || len.isSome() && state.pos - start != len.getOrThrow())) {
            return None
        }
        return total
    }
    
    func readRadixNumber( radix: Int64) : Unit {
        state.pos += INT_VAL_P_2
        let val = readInt64(radix)
        if ((val.isNone())) {
            raise(state.start + INT_VAL_P_2, "Expected number in radix ${radix}")
        }
        if ((isIdentifierStart(fullCharCodeAtPos()))) {
            raise(state.pos, "Identifier directly after number")
        }
        return finishToken(getTT().num, val: val.getOrThrow())
    }
    
    func readNumber( startsWithDot: Bool) : Unit {
        let start = state.pos
        let octal = (Int64(UInt32(input.getCharUnicode(state.pos))) == INT_VAL_P_48)
        var isFloat32 = false
        if ((!startsWithDot && readInt64(10).isNone())) {
            raise(start, "Invalid number")
        }
        var next = Int64(UInt32(input.getCharUnicode(state.pos)))

        if ((next == INT_VAL_P_46)) {
            state.pos += 1
            readInt64(INT_VAL_P_10)
            isFloat32 = true
            next = Int64(UInt32(input.getCharUnicode(state.pos)))
        }
        if ((next == INT_VAL_P_69 || next == INT_VAL_P_101)) {
            state.pos += 1
            next = Int64(UInt32(input.getCharUnicode(state.pos)))
            if ((next == INT_VAL_P_43 || next == INT_VAL_P_45)) {
                state.pos += 1
            }
            if ((readInt64(INT_VAL_P_10).isNone())) {
                raise(start, "Invalid number")
            }
            isFloat32 = true
        }
        if ((isIdentifierStart(fullCharCodeAtPos()))) {
            raise(state.pos, "Identifier directly after number")
        }
        let str = input.slice(start, state.pos)
        var val: ?Int64 = Option<Int64>.None
        if (isFloat32) {
            val = Int64.tryParse(str)
        } else if ((!octal || str.size == 1)) {
            val = Int64.tryParse(str)
        } else if (Regex("[89]").matcher(str).matchStart().isSome() || state.strict) {
            raise(start, "Invalid number")
        } else {
            val = Int64.tryParse("o" + str)
        }
        return finishToken(getTT().num, val: val.getOrThrow())
    }

    func readCodePoint( throwOnInvalid: Bool) : ?Int64 {
        let ch = Int64(UInt32(input.getCharUnicode(state.pos)))

        let code: ?Int64
        if ((ch == INT_VAL_P_123)) {
            state.pos += 1
            let codePos = state.pos
            code = this.readHexChar(this.input.indexOf("}", this.state.pos).getOrThrow() - this.state.pos, throwOnInvalid)
            state.pos += 1
            if ((code.isNone())) {
				state.invalidTemplateEscapePosition0 = state.invalidTemplateEscapePosition0.getOrThrow() - 1
            } else if (code.getOrThrow() > INT_VAL_P_0x10ffff) {
                if ((throwOnInvalid)) {
                    raise(codePos, "Code point out of bounds")
                } else {
                    state.invalidTemplateEscapePosition0 = codePos - INT_VAL_P_2
                    return None
                }
            }
        } else {
            code = readHexChar(4, throwOnInvalid)
        }
        return code
    }

    func readString( `quote`: Int64) : Unit {
        var out = ""
        state.pos += 1
        var chunkStart = state.pos
        while ((true)) {
            if ((state.pos >= input.size)) {
                raise(state.start, "Unterminated string constant")
            }
            let ch = Int64(UInt32(input.getCharUnicode(state.pos)))

            if (ch == `quote`) {
                break
            }
            if ((ch == INT_VAL_P_92)) {
                out += input.slice(chunkStart, state.pos)
                out += readEscapedChar(false).getOrThrow()
                chunkStart = state.pos
            } else {
                if ((isNewLine(ch))) {
                    raise(state.start, "Unterminated string constant")
                }
                state.pos += 1
            }
        }
        out += input.slice(chunkStart, state.pos)
        state.pos += 1
        return finishToken(getTT().string, val: out)
    }

    func readTmplToken() : Unit {
        var out = ""
        var chunkStart = state.pos
        var containsInvalid = false
        while (true) {
            if ((state.pos >= input.size)) {
                raise(state.start, "Unterminated template")
            }
            let ch = Int64(UInt32(input.getCharUnicode(state.pos)))
            if ((ch == INT_VAL_P_96 || ch == INT_VAL_P_36 && Int64(UInt32(input.getCharUnicode(state.pos+1))) == INT_VAL_P_123)) {
                if ((state.pos == state.start && matchX(getTT().template))) {
                    if ((ch == INT_VAL_P_36)) {
                        state.pos += INT_VAL_P_2
                        return finishToken(getTT().dollarBraceL)
                    } else {
                        state.pos += 1
                        return finishToken(getTT().backQuote)
                    }
                }
                out += input.slice(chunkStart, state.pos)
                if (containsInvalid) {
                    return finishToken(getTT().template, val: Option<Any>.None)
                } else {
                    return finishToken(getTT().template, val: out)
                }
            }
            if (ch == INT_VAL_P_92) {
                out += input.slice(chunkStart, state.pos)
                let escaped = readEscapedChar(true)
                if ((escaped.isNone())) {
                    containsInvalid = true
                } else {
                    out += escaped.getOrThrow()
                }
                chunkStart = state.pos
            } else if (isNewLine(ch)) {
                out += input.slice(chunkStart, state.pos)
                state.pos += 1
                match (ch) {
                case 13 =>
                    if ((Int64(UInt32(input.getCharUnicode(state.pos))) == INT_VAL_P_10)) {
                        state.pos += 1
                    }
                case 10 =>
                    out += "\n"
                    
                case _ =>
                    out += String(Rune(ch))
                }
                state.curLine += 1
                state.lineStart = state.pos
                chunkStart = state.pos
            } else {
                state.pos += 1
            }
        }
    }

    func readEscapedChar( inTemplate: Bool) : ?String {
        let throwOnInvalid = !inTemplate
        state.pos += 1
        let ch = Int64(UInt32(input.getCharUnicode(state.pos)))
        state.pos += 1
        match (ch) {
        case 110 =>
            return "\n"
        case 114 =>
            return "\r"
        case 120 =>
            let code = readHexChar(2, throwOnInvalid)
            if (code.isNone()) {
                return None
            }
            return String(Rune(code.getOrThrow()))
        case 117 =>
            let code = readCodePoint(throwOnInvalid)
            if (code.isNone()) {
                return None
            }
            return codePointToString(code.getOrThrow())
        case 116 =>
            return "\t"
        case 98 =>
            return "\\b"
        case 118 =>
            return "\\u000b"
        case 102 =>
            return "\\f"
        case 13 =>
            if (Int64(UInt32(input.getCharUnicode(state.pos))) == 10) {
                state.pos += 1
            }
        case 10 =>
            state.lineStart = state.pos
            state.curLine += 1
            return ""
        case _ =>
            if (ch >= INT_VAL_P_48 && ch <= INT_VAL_P_55) {
                let codePos = state.pos - 1
                let startIndex = state.pos - 1
                let endIndex = INT_VAL_P_3
                let subStr = input[Range(startIndex, endIndex-1, 1, true, true, true)]
                var octalStr = Regex("^[0-7]+").matcher(subStr).matchStart().getOrThrow().matchString()
                var octal = Int64.tryParse("o" + octalStr)
                if ((octal.getOrThrow() > INT_VAL_P_255)) {
                    octalStr = octalStr.slice(0, -1)
                    octal = Int64.tryParse("o" + octalStr)
                }
                if ((octal.getOrThrow() > 0)) {
                    if ((inTemplate)) {
                        state.invalidTemplateEscapePosition0 = codePos
                        return None
                    } else if ((state.strict)) {
                        raise(codePos, "Octal literal in strict mode")
                    } else if ((!state.containsOctal)) {
                        state.containsOctal = true
                        state.octalPosition = codePos
                    }
                }
                state.pos += octalStr.size - 1
                return String(Rune(octal.getOrThrow()))
            }
            return String(Rune(ch))
        }
        return None
    }

    func readHexChar(len: Int64, throwOnInvalid: Bool): ?Int64 {
        let codePos = state.pos
        let n = readInt64(INT_VAL_P_16, len: len)
        if ((n.isNone())) {
            if ((throwOnInvalid)) {
                raise(codePos, "Bad character escape sequence")
            } else {
                state.pos = codePos - 1
                state.invalidTemplateEscapePosition0 = codePos - 1
            }
        }
        return n
    }
    
    func readWord1() : String {
        state.containsEsc = false
        var word = ""
        var first = true
        var chunkStart = state.pos
        while ((state.pos < input.size)) {
            let ch = fullCharCodeAtPos()
            if ((isIdentifierChar(ch))) {
                
                if (ch <= INT_VAL_P_0xffff) {
                    state.pos += 1 
                } else {
                    state.pos += INT_VAL_P_2
                }
            } else if ((ch == INT_VAL_P_92)) { // "\"
                state.containsEsc = true
                word += input.slice(chunkStart, state.pos)
                let escStart = state.pos
                state.pos += 1
                if ((Int64(UInt32(input.getCharUnicode(state.pos))) != INT_VAL_P_117)) {
                    raise(state.pos, "Expecting Unicode escape sequence \\uXXXX")
                }
                state.pos += 1
                let esc = readCodePoint(true)
                if (first) {
                    if ((!(isIdentifierStart)(esc.getOrThrow()))) {
                        raise(escStart, "Invalid Unicode escape")
                    }    
                } else {
                    if ((!(isIdentifierChar)(esc.getOrThrow()))) {
                        raise(escStart, "Invalid Unicode escape")
                    }
                }
                word += codePointToString(esc.getOrThrow())
                chunkStart = state.pos
            } else {
                break
            }
            first = false
        }
        return word + input.slice(chunkStart, state.pos)
    }
    
    func readWord() : Unit {
        let word = readWord1()
        var _type = getTT().name
        if (!state.containsEsc && isKeyword(word)) {
            _type = keywords[word]
        }
        return finishToken(_type, val: word)
    }
    
    func braceIsBlock(prevType: TokenType): Bool {
        if (refEq(prevType, getTT().colon)) {
            let parent = curContext()
            if (refEq(parent.getOrThrow(), getTC().braceStatement) || refEq(parent.getOrThrow(), getTC().braceExpression)) {
                return !parent.getOrThrow().isExpr
            }
        }
        if (refEq(prevType, getTT()._return)) {
            return lineBreak.matcher(input.slice(state.lastTokEnd, state.start)).matchStart().isSome()
        }
        if (refEq(prevType, getTT()._else) || refEq(prevType, getTT().semi) || refEq(prevType, getTT().eof) || refEq(prevType, getTT().parenR)) {
            return true
        }
        if (refEq(prevType, getTT().braceL)) {
            return refEq(curContext().getOrThrow(), getTC().braceStatement)
        }
        return !state.exprAllowed
    }
    
    open public func updateContext( prevType: TokenType) {
        let _type_ = state._type
        var update: ?(( target: Tokenizer,  prevType: TokenType) -> Unit)
        if (_type_.keyword.isSome() && refEq(prevType, getTT().dot)) {
            state.exprAllowed = false
        } else if (let Some(update) <- _type_.updateContext) {
            update(this, prevType)
        } else {
            state.exprAllowed = _type_.beforeExpr
        }
    }
}

public class TokContext {
    
    var token: String
    
    var isExpr: Bool
    
    var preserveSpace: Bool
    
    var overridee: ?(( p: Tokenizer) -> Unit) = None
    
    init( token: String,  isExpr: Bool,  preserveSpace!: ?Bool = Option<Bool>.None,  overridee!: ?((p: Tokenizer) -> Unit) = None) {
        this.token = token
        this.isExpr = !(!isExpr)
        var preserveSpaceBool = false
        if (preserveSpace.isSome()) {
            preserveSpaceBool = !(!preserveSpace.getOrThrow())
        }
        this.preserveSpace = preserveSpaceBool
        this.overridee = overridee
    }
    
}

public class TokContextCls {

    let braceStatement = TokContext("{", false)
    
    let braceExpression = TokContext("{", true)
    
    let templateQuasi = TokContext(##"${"##, true)
    
    let parenStatement = TokContext("(", false)
    
    let parenExpression = TokContext("(", true)
    
    
    let template = TokContext("`", true, preserveSpace: true, overridee: { p =>
        p.readTmplToken()
    }) 
    
    let functionExpression = TokContext("function", true)
    
    let j_oTag = TokContext("<tag", false)
    

    let j_cTag = TokContext("</tag", false)

    let j_expr = TokContext("<tag>.../tag>", true, preserveSpace: true, overridee: None)

}

public class ExpPos {
    var start: Int64
    
    init( start: Int64) {
        this.start = start
    }
}

public class ParamsObj {
    var params: ArrayList<Node>
    var rest: ?Node = Option<Node>.None
    init( params: ArrayList<Node>,  rest!: ?Node = Option<Node>.None) {
        this.params = params
        this.rest = rest
    }
}

func getQualifiedJSXName( object: Node) : String {
    if ((object._type == "JSXIdentifier")) {
        return (object.name.getOrThrow() as String).getOrThrow();
    }
    
    if ((object._type == "JSXNamespacedName")) {
        return (object.namespace.getOrThrow().name.getOrThrow() as String).getOrThrow() + ":" + ((object.name.getOrThrow() as Node).getOrThrow().name.getOrThrow() as String).getOrThrow()
    }
    
    if ((object._type == "JSXMemberExpression")) {
        return getQualifiedJSXName(object.object.getOrThrow()) + "." + getQualifiedJSXName(object.property.getOrThrow())
    }
    return ""
}

let HEX_NUMBER = Regex("^[\\da-fA-F]+$")
let DECIMAL_NUMBER = Regex("^\\d+$")


enum XHTMLEntities {
    | quot(String)
     | amp(String)
     | apos(String)
     | lt(String)
     | gt(String)
     | nbsp(String)
     | iexcl(String)
     | cent(String)
     | pound(String)
     | curren(String)
     | yen(String)
     | brvbar(String)
     | sect(String)
     | uml(String)
     | copy(String)
     | ordf(String)
     | laquo(String)
     | not(String)
     | shy(String)
     | reg(String)
     | macr(String)
     | deg(String)
     | plusmn(String)
     | sup2(String)
     | sup3(String)
     | acute(String)
     | micro(String)
     | para(String)
     | middot(String)
     | cedil(String)
     | sup1(String)
     | ordm(String)
     | raquo(String)
     | frac14(String)
     | frac12(String)
     | frac34(String)
     | iquest(String)
     | Agrave(String)
     | Aacute(String)
     | Acirc(String)
     | Atilde(String)
     | Auml(String)
     | Aring(String)
     | AElig(String)
     | Ccedil(String)
     | Egrave(String)
     | Eacute(String)
     | Ecirc(String)
     | Euml(String)
     | Igrave(String)
     | Iacute(String)
     | Icirc(String)
     | Iuml(String)
     | ETH(String)
     | Ntilde(String)
     | Ograve(String)
     | Oacute(String)
     | Ocirc(String)
     | Otilde(String)
     | Ouml(String)
     | times(String)
     | Oslash(String)
     | Ugrave(String)
     | Uacute(String)
     | Ucirc(String)
     | Uuml(String)
     | Yacute(String)
     | THORN(String)
     | szlig(String)
     | agrave(String)
     | aacute(String)
     | acirc(String)
     | atilde(String)
     | auml(String)
     | aring(String)
     | aelig(String)
     | ccedil(String)
     | egrave(String)
     | eacute(String)
     | ecirc(String)
     | euml(String)
     | igrave(String)
     | iacute(String)
     | icirc(String)
     | iuml(String)
     | eth(String)
     | ntilde(String)
     | ograve(String)
     | oacute(String)
     | ocirc(String)
     | otilde(String)
     | ouml(String)
     | divide(String)
     | oslash(String)
     | ugrave(String)
     | uacute(String)
     | ucirc(String)
     | uuml(String)
     | yacute(String)
     | thorn(String)
     | yuml(String)
     | OElig(String)
     | oelig(String)
     | Scaron(String)
     | scaron(String)
     | Yuml(String)
     | fnof(String)
     | circ(String)
     | tilde(String)
     | Alpha(String)
     | Beta(String)
     | Gamma(String)
     | Delta(String)
     | Epsilon(String)
     | Zeta(String)
     | Eta(String)
     | Theta(String)
     | Iota(String)
     | Kappa(String)
     | Lambda(String)
     | Mu(String)
     | Nu(String)
     | Xi(String)
     | Omicron(String)
     | Pi(String)
     | Rho(String)
     | Sigma(String)
     | Tau(String)
     | Upsilon(String)
     | Phi(String)
     | Chi(String)
     | Psi(String)
     | Omega(String)
     | alpha(String)
     | beta(String)
     | gamma(String)
     | delta(String)
     | epsilon(String)
     | zeta(String)
     | eta(String)
     | theta(String)
     | iota(String)
     | kappa(String)
     | lambda(String)
     | mu(String)
     | nu(String)
     | xi(String)
     | omicron(String)
     | pi(String)
     | rho(String)
     | sigmaf(String)
     | sigma(String)
     | tau(String)
     | upsilon(String)
     | phi(String)
     | chi(String)
     | psi(String)
     | omega(String)
     | thetasym(String)
     | upsih(String)
     | piv(String)
     | ensp(String)
     | emsp(String)
     | thinsp(String)
     | zwnj(String)
     | zwj(String)
     | lrm(String)
     | rlm(String)
     | ndash(String)
     | mdash(String)
     | lsquo(String)
     | rsquo(String)
     | sbquo(String)
     | ldquo(String)
     | rdquo(String)
     | bdquo(String)
     | dagger(String)
     | Dagger(String)
     | bull(String)
     | hellip(String)
     | permil(String)
     | prime(String)
     | Prime(String)
     | lsaquo(String)
     | rsaquo(String)
     | oline(String)
     | frasl(String)
     | euro(String)
     | image(String)
     | weierp(String)
     | real(String)
     | trade(String)
     | alefsym(String)
     | larr(String)
     | uarr(String)
     | rarr(String)
     | darr(String)
     | harr(String)
     | crarr(String)
     | lArr(String)
     | uArr(String)
     | rArr(String)
     | dArr(String)
     | hArr(String)
     | forall(String)
     | part(String)
     | exist(String)
     | empty(String)
     | nabla(String)
     | isin(String)
     | notin(String)
     | ni(String)
     | prod(String)
     | sum(String)
     | minus(String)
     | lowast(String)
     | radic(String)
     | _prop(String)
     | infin(String)
     | ang(String)
     | and(String)
     | or(String)
     | cap(String)
     | cup(String)
     | `int`(String)
     | there4(String)
     | sim(String)
     | cong(String)
     | asymp(String)
     | ne(String)
     | equiv(String)
     | le(String)
     | ge(String)
     | sub(String)
     | sup(String)
     | nsub(String)
     | sube(String)
     | supe(String)
     | oplus(String)
     | otimes(String)
     | perp(String)
     | sdot(String)
     | lceil(String)
     | rceil(String)
     | lfloor(String)
     | rfloor(String)
     | lang(String)
     | rang(String)
     | loz(String)
     | spades(String)
     | clubs(String)
     | hearts(String)
     | diams(String)

    static func getRawValue(value: String) {
        return value
    }
 }

type ExtraValue = Any // string | RegConfig | number | number | RegConfig | boolean | null

public class TemplateElementValue {
  var raw: String
  var cooked: ?Any // string | RegConfig | number | boolean | null

    init( raw: String,  cooked!: ?Any = Option<Any>.None) {
        this.raw = raw
        this.cooked = cooked
    }
}

public class Node {

    var id: ?Node = Option<Node>.None
    var key: ?Node = Option<Node>.None
    var test: ?Node = Option<Node>.None
    var left: ?Node = Option<Node>.None
    var right: ?Node = Option<Node>.None
    var prefix: ?Bool = Option<Bool>.None
    var `operator`: ?Any = Option<Any>.None  // string | RegConfig | number | boolean |null
    var consequent: ?Any = Option<Any>.None // Node[] | Node
    var alternate: ?Node = Option<Node>.None
    var computed: ?Bool = Option<Bool>.None
    var kind: ?String = Option<String>.None
    var generator: ?Bool = Option<Bool>.None
    var expression: ?Any = Option<Any>.None // boolean | Node | Option<Any>.None
    var expressions: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var async: ?Bool = Option<Bool>.None
    var body: ?Any = Option<Any>.None // Node | ArrayList<Node> | Option<Any>.None
    var _type: String
    var start: Int64
    var end: Int64
    var loc: SourceLocation
    // cangjie 元组不可修改
    var range_0: ?Int64 = Option<Int64>.None
    var range_1: ?Int64 = Option<Int64>.None
    var leadingComments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    var trailingComments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    var innerComments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    var sourceType: ?String = Option<String>.None
    var program: ?Node = Option<Node>.None
    var tokens: ?ArrayList<Any> = Option<ArrayList<Any>>.None  // (Token | Comment)
    var comments: ?ArrayList<Comment> = Option<ArrayList<Comment>>.None
    var value: ?Any = Option<Any>.None  // string | Node | boolean | number | TemplateElementValue | RegConfig  | null
    var extra: ?HashMap<String,ExtraValue> = Option<HashMap<String,ExtraValue>>.None 
    var argument: ?Node = Option<Node>.None
    var superClass: ?Node = Option<Node>.None
    var object: ?Node = Option<Node>.None
    var callee: ?Node = Option<Node>.None
    var args: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var pattern: ?String = Option<String>.None
    var flags: ?String = Option<String>.None
    var meta: ?Node = Option<Node>.None
    var property: ?Node = Option<Node>.None
    var name: ?Any = Option<Any>.None // string | Node
    var tail: ?Bool = Option<Bool>.None
    var quasis: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var decorators: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var properties: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var method: ?Bool = Option<Bool>.None
    var shorthand: ?Bool = Option<Bool>.None
    var params: ?ArrayList<?Node> = Option<ArrayList<?Node>>.None
    var directives: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var delegate: ?Bool = Option<Bool>.None
    var label: ?Node = Option<Node>.None
    var declarations: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var discriminant: ?Node = Option<Node>.None
    var cases: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var block: ?Node = Option<Node>.None
    var handler: ?Node = Option<Node>.None
    var finalizer: ?Node = Option<Node>.None
    var specifiers: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var exported: ?Node = Option<Node>.None
    var statementStart: ?Int64 = Option<Int64>.None
    var `init`: ?Node = Option<Node>.None
    var update: ?Node = Option<Node>.None
    var param: ?Node = Option<Node>.None
    var guardedHandlers: ?ArrayList<Any> = Option<ArrayList<Any>>.None // undefined[]
    var await: ?Bool = Option<Bool>.None
    var `static`: ?Bool = Option<Bool>.None
    var typeAnnotation: ?Node = Option<Node>.None
    var declaration: ?Node = Option<Node>.None
    var source: ?Any = Option<Any>.None  // Node | void
    var elements: ?ArrayList<?Node> = Option<ArrayList<?Node>>.None
    var local: ?Node = Option<Node>.None
    var imported: ?Node = Option<Node>.None
    var tag: ?Node = Option<Node>.None
    var quasi: ?Node = Option<Node>.None
    var typeParameters: ?Node = Option<Node>.None
    var rest: ?Node = Option<Node>.None
    var returnType: ?Node = Option<Node>.None
    var predicate: ?Node = Option<Node>.None
    var mixins: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var extendsArr: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var variance: ?Node = Option<Node>.None
    var bound: ?Node = Option<Node>.None
    var `default`: ?Node = Option<Node>.None
    var optional: ?Bool = Option<Bool>.None
    var callProperties: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var indexers: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var exact: ?Bool = Option<Bool>.None
    var qualification: ?Node = Option<Node>.None
    var types: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var elementType: ?Node = Option<Node>.None
    var openingElement: ?Node = Option<Node>.None
    var closingElement: ?Node = Option<Node>.None
    var children: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var selfClosing: ?Bool = Option<Bool>.None
    var namespace: ?Node = Option<Node>.None
    var attributes: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var regex: ?RegConfig = Option<RegConfig>.None
    var raw: ?String = Option<String>.None
    var directive: ?String = Option<String>.None
    var exportKind: ?String = Option<String>.None
    var exprListItem: ?Bool = Option<Bool>.None
    var implements: ?ArrayList<Node> = Option<ArrayList<Node>>.None
    var superTypeParameters: ?Node = Option<Node>.None
    var importKind: ?String = Option<String>.None
    
    init(parser!: ?Parser = Option<Parser>.None, pos!: ?Int64 = Option<Int64>.None, loc!: ?Position0 = Option<Position0>.None) {
        this._type = ""
        this.start = pos ?? 0
        this.end = 0
        this.loc = SourceLocation(loc)
        if (parser.isSome() && (parser.getOrThrow().options.ranges ?? false)) {
            this.range_0 = pos.getOrThrow()
            this.range_1 = 0
        }
        if (parser.isSome()) { 
            this.loc.fileName = parser.getOrThrow().fileName
        }
    }
    
    func clone() : Node {
        let newNode = Node(parser: None, pos: None, loc: None)
        newNode._type = _type
        newNode.start = start
        newNode.end = end
        newNode.loc = loc
        newNode.range_0 = this.range_0
        newNode.range_1 = this.range_1
        return newNode
    }

    func setTypeParameters(param_node: ?Node) {
        this.typeParameters = param_node
    }

    func setStatementStart(param_statementStart: ?Int64) {
        this.statementStart = param_statementStart
    }

    func setKind(param_kind: ?String) {
        this.kind = param_kind
    }
}

public open class Parser <: Tokenizer {
    var fileName: String
    let primitiveTypes: ArrayList<String> = ArrayList<String>([
        "any",
        "mixed",
        "empty",
        "bool",
        "boolean",
        "number",
        "string",
        "void",
        "null"
    ])
    
    init(options: ParserOptions, input: String) {
        super(getOptions(options), input)
        this.fileName = options.sourceFilename ?? ""
        this.options = getOptions(options)
        this.inModule = this.options.sourceType == "module"
        this.input = input
        if (this.state.pos == 0 && this.input[0] == UInt8(UInt32(r'#')) && this.input[1] == UInt8(UInt32(r'!'))) {
            let start = state.pos
            let startLoc = state.curPosition()
            state.pos += INT_VAL_P_2
            let s = input[Range(state.pos, input.size-1, 1, true, true, true)].toArray()
            var ch = Int64(s[0])
            while ((state.pos < input.size && ch != INT_VAL_P_10 && ch != INT_VAL_P_13 && ch != INT_VAL_P_8232 && ch != INT_VAL_P_8233)) {
                state.pos += 1
                let s1 = input[Range(state.pos, input.size-1, 1, true, true, true)].toArray()
                ch = Int64(s1[0])
            }
            let comment : Comment
            if (false) {
                comment = Comment("CommentBlock", input.slice(start + INT_VAL_P_2, state.pos), start, state.pos, SourceLocation(startLoc, end: state.curPosition()))
            } else {
                comment = Comment("CommentLine", input.slice(start + INT_VAL_P_2, state.pos), start, state.pos, SourceLocation(startLoc, end: state.curPosition()))
            }
            if ((!isLookahead)) {
                state.tokens.getOrThrow().add(comment)
                state.comments.getOrThrow().add(comment)
                comment.loc.fileName = fileName
                state.trailingComments.getOrThrow().add(comment)
                state.leadingComments.getOrThrow().add(comment)
            }
        // func pushComment( block: Bool,  text: String,  start: Int64,  end: Int64,  startLoc: Position0,  endLoc: Position0) {
        // }

        }
    }

    override public func hasPlugin(name: String) : Bool {
        let excludePlugins = HashSet<String>(["dynamicImport","doExpressions","functionSent","objectRestSpread","asyncGenerators","decorators","classProperties","exportExtensions"])
        if(excludePlugins.contains(name)) {
          return false
        }
        return true
    }
    
    func isReservedWord( word: String) : Bool {
        if (word == "await") {
            return inModule;
        } else {
            return reservedWords.enumAwait(word)
        }
    }
    
    func parse() : Node {
        let file = startNode()
        let program = startNode()
        nextToken()
        return parseTopLevel(file, program)
    }
    
    override public func raise( pos: ?Int64,  message: String)  {
        var newMessage = message
        let loc = getLineInfo(input, pos.getOrThrow())
        newMessage += "(${loc.line}:${loc.col})";
        let err = ParserError(pos.getOrThrow(), loc, newMessage)
        // throw err
    }
    
    open public func checkPropClash( _prop: Node,  propHash: Any) : Unit {
        if ((_prop.computed.getOrThrow() || (_prop.kind.isSome() && (_prop.kind.getOrThrow().size > 0)))) {
            return
        }
    }
    
    func getExpression() : ?Node {
        nextToken()
        let expr = parseExpression()
        if ((!matchX(getTT().eof))) {
            unexpected(None, Option<Any>.None)
        }
        return expr
    }
    
    func parseExpression( noIn!: ?Bool = Option<Bool>.None,  refShorthandDefaultPos!: ?ExpPos = Option<ExpPos>.None) : ?Node {
        let startPos = state.start
        let startLoc = state.startLoc
        let expr =  parseMaybeAssign( noIn, refShorthandDefaultPos, None, None)
        if ((matchX(getTT().comma))) {
            let node = startNodeAt(startPos, startLoc.getOrThrow())
            node.expressions = ArrayList<Node>([expr.getOrThrow()] )
            while ((eat(getTT().comma))) {
                node.expressions.getOrThrow().add( parseMaybeAssign(noIn, refShorthandDefaultPos, Option<(( tar: Parser,  n: Node,  pos: Int64,  loc: Position0) -> Node)>.None, Option<ExpPos>.None).getOrThrow())
            }
            toReferencedList(node.expressions)
            return finishNode(node, "SequenceExpression")
        }
        return expr
    }
    
    open public func parseMaybeAssign( noIn: ?Bool,  refShorthandDefaultPosIn: ?ExpPos,  afterLeftParse: ?(( tar: Parser,  n: Node,  pos: Int64,  loc: Position0) -> Node),  refNeedsArrowPos: ?ExpPos)  : ?Node {
        
        var refShorthandDefaultPos = refShorthandDefaultPosIn
        let startPos = state.start
        let startLoc = state.startLoc
        
        if ((matchX(getTT()._yield) && state.inGenerator)) {
            var left = parseYield()
            if ((afterLeftParse.isSome())) {
                left = afterLeftParse.getOrThrow()(this, left, startPos, startLoc.getOrThrow())
            }
            return left
        }
        var failOnShorthandAssign: Bool
        if ((refShorthandDefaultPos.isSome())) {
            failOnShorthandAssign = false
        } else {
            refShorthandDefaultPos = ExpPos(0)
            failOnShorthandAssign = true
        }
        
        if ((matchX(getTT().parenL) || matchX(getTT().name))) {
            state.potentialArrowAt = state.start
        }
        var left =  parseMaybeConditional(noIn, refShorthandDefaultPos, refNeedsArrowPos)

        if ((afterLeftParse.isSome())) {
            left = afterLeftParse.getOrThrow()(this, left.getOrThrow(), startPos, startLoc.getOrThrow())
        }
        if ((state._type.isAssign)) {
            let node = startNodeAt(startPos, startLoc.getOrThrow())
            node.`operator` = state.value
            if (matchX(getTT().eq)) {
                node.left = toAssignable(left, None, "assignment expression")
            } else {
                node.left = left
            }
            refShorthandDefaultPos.getOrThrow().start = 0
            
            checkLVal(left.getOrThrow(), None, None, "assignment expression")
            
            if (((left.getOrThrow().extra.isSome()) && (left.getOrThrow().extra.getOrThrow().contains("parenthesized")))) {
                var errorMsg: String = ""
                if ((left.getOrThrow()._type == "ObjectPattern")) {
                    errorMsg = "`({a}) = 0` use `({a} = 0)`"
                } else if ((left.getOrThrow()._type == "ArrayPattern")) {
                    errorMsg = "`([a]) = 0` use `([a] = 0)`"
                }
                if ((errorMsg.size > 0)) {
                     raise(left.getOrThrow().start, "You're trying to assign to a parenthesized expression, eg. instead of ${errorMsg}")
                }
            }
            next()
            node.right =  parseMaybeAssign( noIn, None, None, None)
            return finishNode(node, "AssignmentExpression")
        } else if ((failOnShorthandAssign && (refShorthandDefaultPos.isSome() && refShorthandDefaultPos.getOrThrow().start != 0))) {
            unexpected(refShorthandDefaultPos.getOrThrow().start, Option<Any>.None)
        }
        return left
    }
    
    func parseMaybeConditional( noIn: ?Bool,  refShorthandDefaultPos: ?ExpPos,  refNeedsArrowPos: ?ExpPos)  : ?Node {
        let startPos = state.start
        let startLoc = state.startLoc
        let expr = parseExprOps(noIn, refShorthandDefaultPos)
        if (refShorthandDefaultPos.isSome() && refShorthandDefaultPos.getOrThrow().start != 0) {
            return expr
        }
        return parseConditional(expr, noIn, startPos, startLoc.getOrThrow(), Option<State>.None) 
    }
    
    open public func parseConditional( expr: Node,  noIn: ?Bool,  startPos: Int64,  startLoc: Position0,  refNeedsArrowPos: ?State)  : ?Node {
        if ((eat(getTT().question))) {
            let node = startNodeAt(startPos, startLoc)
            node.test = expr
            node.consequent =  match(parseMaybeAssign( None, None, None, None)) {
                case Some(x) => Some(x)
                case _ => Option<Any>.None
            }
            expect(getTT().colon, pos: None)
            node.alternate =  parseMaybeAssign( noIn, None, None, None)
            return finishNode(node, "ConditionalExpression")
        }
        return expr
    }
    
    func parseExprOps( noIn: ?Bool,  refShorthandDefaultPos: ?ExpPos) : Node {
        let startPos = state.start
        let startLoc = state.startLoc
        let expr = parseMaybeUnary(refShorthandDefaultPos: refShorthandDefaultPos)
        if (((refShorthandDefaultPos.isSome()) && (refShorthandDefaultPos.getOrThrow().start != 0))) {
            return expr
        } else {
            return parseExprOp(expr, startPos, startLoc.getOrThrow(), -1, noIn)
        }
    }
    
    func parseExprOp( left: Node,  leftStartPos: Int64,  leftStartLoc: Position0,  minPrec: Int64,  noIn: ?Bool) : Node {
        let prec = state._type.binop
        var noInBool = false
        if (noIn.isNone()) {
            noInBool = true
        } else {
            noInBool = !noIn.getOrThrow()
        }
        if ((prec.isSome() && (noInBool || !matchX(getTT()._in)))) {
            if ((prec.getOrThrow() > minPrec)) {
                let node = startNodeAt(leftStartPos, leftStartLoc)
                node.left = left
                node.`operator` = state.value
                if ((node.`operator`.getOrThrow() as String).getOrThrow() == "**" &&
                    left._type == "UnaryExpression" &&
                    (left.extra.isSome()) &&
                    (!left.extra.getOrThrow().contains("parenthesizedArgument")) &&
                    !left.extra.getOrThrow().contains("parenthesized")) {
                     raise(left.argument.getOrThrow().start, "Illegal expression. Wrap left hand side or entire exponentiation in parentheses.")
                }
                let op = state._type
                next()
                let startPos = state.start
                let startLoc = state.startLoc
                if (op.rightAssociative) {
                    node.right = parseExprOp(parseMaybeUnary(), startPos, startLoc.getOrThrow(), (prec.getOrThrow() - 1), noIn)
                } else {
                    node.right = parseExprOp(parseMaybeUnary(), startPos, startLoc.getOrThrow(), prec.getOrThrow(), noIn)
                }
                if (refEq(op, getTT().logicalOR) || refEq(op, getTT().logicalAND)) {
                    finishNode(node, "LogicalExpression")
                } else {
                    finishNode(node, "BinaryExpression")
                }
                return parseExprOp(node, leftStartPos, leftStartLoc, minPrec, noIn)
            }
        }
        return left
    }
    
    func parseMaybeUnary( refShorthandDefaultPos!: ?ExpPos = Option<ExpPos>.None) : Node {
        if ((state._type.prefix)) {
            let node = startNode()
            let update = matchX(getTT().incDec)
            node.`operator` = state.value
            node.prefix = true
            next()
            let argType = state._type
            node.argument = parseMaybeUnary(refShorthandDefaultPos: None)
            addExtra(node, "parenthesizedArgument", refEq(argType,  getTT().parenL) && ((node.argument.getOrThrow().extra.isNone()) || !(node.argument.getOrThrow().extra.getOrThrow().contains("parenthesized"))))
            if (((refShorthandDefaultPos.isSome()) && (refShorthandDefaultPos.getOrThrow().start != 0))) {
                unexpected(refShorthandDefaultPos.getOrThrow().start, Option<Any>.None)
            }
            if (update) {
                checkLVal(node.argument.getOrThrow(), None, None, "prefix operation")
            } else if ((state.strict && ((node.`operator` ?? "") as String == "delete") && node.argument.getOrThrow()._type == "Identifier")) {
                 raise(node.start, "Deleting local variable in strict mode")
            }
            if (update) {
                return finishNode(node, "UpdateExpression")
            } 
            return finishNode(node, "UnaryExpression")

        }
        let startPos = state.start
        let startLoc = state.startLoc
        var expr = parseExprSubscripts(refShorthandDefaultPos:refShorthandDefaultPos)
        if ((refShorthandDefaultPos.isSome()) && (refShorthandDefaultPos.getOrThrow().start != 0)) {
            return expr
        }
        while ((state._type.postfix && !canInsertSemicolon())) {
            let node = startNodeAt(startPos, startLoc.getOrThrow())
            node.`operator` = state.value
            node.prefix = false
            node.argument = expr
            checkLVal(expr, None, None, "postfix operation")
            next()
            expr = finishNode(node, "UpdateExpression")
        }
        return expr
    }
    
    func parseExprSubscripts( refShorthandDefaultPos!: ?ExpPos = Option<ExpPos>.None) : Node {
        let startPos = state.start
        let startLoc = state.startLoc
        let potentialArrowAt = state.potentialArrowAt
        let expr = parseExprAtom(refShorthandDefaultPos)

        if ((expr.getOrThrow()._type == "ArrowFunctionExpression" && expr.getOrThrow().start == potentialArrowAt.getOrThrow())) {
            return expr.getOrThrow()
        }
        if (((refShorthandDefaultPos.isSome()) && (refShorthandDefaultPos.getOrThrow().start != 0))) {
            return expr.getOrThrow()
        }
        return parseSubscripts(expr.getOrThrow(), startPos, startLoc.getOrThrow(), noCalls: None)
    }
    
    func parseSubscripts( baseIn: Node,  startPos: Int64,  startLoc: Position0,  noCalls!: ?Bool = Option<Bool>.None) : Node {
        var base = baseIn
        var noCallsBool = false
        if (noCalls.isNone()) {
            noCallsBool = true
        } else {
            noCallsBool = !noCalls.getOrThrow()
        }
        while (true) {
            if ((noCallsBool && eat(getTT().doubleColon))) {
                var node = startNodeAt(startPos, startLoc)
                node.object = base
                node.callee = parseNoCallExpr()
                return parseSubscripts(finishNode(node, "BindExpression"), startPos, startLoc, noCalls: noCalls)
            } else if ((eat(getTT().dot))) {
                let node = startNodeAt(startPos, startLoc)
                node.object = base
                node.property = parseIdentifier(true)
                node.computed = false
                base = finishNode(node, "MemberExpression")
            } else if ((eat(getTT().bracketL))) {
                let node = startNodeAt(startPos, startLoc)
                node.object = base
                node.property = parseExpression()
                node.computed = true
                expect(getTT().bracketR)
                base = finishNode(node, "MemberExpression")
            } else if ((noCallsBool && matchX(getTT().parenL))) {
                let possibleAsync = (state.potentialArrowAt == base.start &&
                                    base._type == "Identifier" &&
                                    ((base.name ?? "") as String == "async") && 
                                    !canInsertSemicolon())
                next()
                let node = startNodeAt(startPos, startLoc)
                node.callee = base
                node.args = parseCallExpressionArguments(getTT().parenR, possibleAsync)
                if ((node.callee.getOrThrow()._type == "Import" && node.args.getOrThrow().size != 1)) {
                     raise(node.start, "import() requires exactly one argument")
                }
                base = finishNode(node, "CallExpression")
                if ((possibleAsync && shouldParseAsyncArrow())) {
                    return parseAsyncArrowFromCallExpression(startNodeAt(startPos, startLoc), node)
                } else {
                    toReferencedList(node.args.getOrThrow())
                }
            } else if ((matchX(getTT().backQuote))) {
                let node = startNodeAt(startPos, startLoc)
                node.tag = base
                node.quasi = parseTemplate(true)
                base = finishNode(node, "TaggedTemplateExpression")
            } else {
                return base
            }
        }
        return base 
    }
    
    func parseCallExpressionArguments( close: TokenType,  possibleAsyncArrow: Bool) : ArrayList<Node> {
        var elts = ArrayList<Node>()
        var innerParenStart: Int64 = 0
        var first = true
        while ((!eat(close))) {
            if ((first)) {
                first = false
            } else {
                expect(getTT().comma, pos: None)
                if (eat(close)) {
                    break
                }
            }
            if ((matchX(getTT().parenL) && (innerParenStart != 0))) {
                innerParenStart = state.start
            }
            
            let node : ?Node
            if (possibleAsyncArrow) {
                node = parseExprListItem(false, ExpPos(0), ExpPos(0))
            } else {
                node = parseExprListItem(false, None, None)
            }
            elts.add(node.getOrThrow())
        }
        if ((possibleAsyncArrow && (innerParenStart != 0) && shouldParseAsyncArrow())) {
            unexpected(None, Option<Any>.None)
        }
        return elts
    }
    
    open public func shouldParseAsyncArrow() : Bool {
        return matchX(getTT().arrow)
    }
    
    open public func parseAsyncArrowFromCallExpression( node: Node,  call: Node) : Node {
        expect(getTT().arrow, pos: None)
        return parseArrowExpression(node, call.args, isAsync: true)
    }
    
    func parseNoCallExpr() : Node {
        let startPos = state.start
        let startLoc = state.startLoc
        return parseSubscripts(parseExprAtom(Option<ExpPos>.None).getOrThrow(), startPos, startLoc.getOrThrow(), noCalls: true)
    }
    
    open public func parseExprAtom(refShorthandDefaultPos: ?ExpPos) : ?Node {
        let canBeArrow = state.potentialArrowAt == state.start
        let node: ?Node
        match(state._type) { 
        case tt_super where tt_super == getTT()._super  =>
            if (((state.inMethod.isNone()) && options.allowSuperOutsideMethod.getOrThrow())) {
                 raise(state.start, "'super' outside of function or class")
            }
            node = startNode()
            next()
            if ((!matchX(getTT().parenL) && !matchX(getTT().bracketL) && !matchX(getTT().dot))) {
                unexpected(None, Option<Any>.None)
            }
            if ((matchX(getTT().parenL) && (state.inMethod.getOrThrow() as String != "constructor") && options.allowSuperOutsideMethod.getOrThrow())) {
                 raise(node.getOrThrow().start, "super() is only valid inside a class constructor. Make sure the method name is spelled exactly as 'constructor'.")
            }
            return finishNode(node.getOrThrow(), "Super")
        case tt_import where tt_import == getTT()._import =>
            if ((!hasPlugin("dynamicImport"))) {
                unexpected(None, Option<Any>.None)
            }
            node = startNode()
            next()
            if ((!matchX(getTT().parenL))) {
                unexpected(None, getTT().parenL)
            }
            return finishNode(node.getOrThrow(), "Import")
        case tt_this where tt_this == getTT()._this =>
            node = startNode()
            next()
            return finishNode(node.getOrThrow(), "ThisExpression")
        case tt_yield where tt_yield == getTT()._yield =>
            if ((state.inGenerator)) {
                unexpected(None, Option<Any>.None)
            }
            //fallthrough
            node = startNode()
            let allowAwait = ((state.value ?? "") as String == "await" && state.inAsync)
            let allowYield = shouldAllowYieldIdentifier()
            let id = parseIdentifier(allowAwait || allowYield)
            if (((id.name ?? "") as String == "await")) {
                if ((state.inAsync || inModule)) {
                    return parseAwait(node.getOrThrow())
                }
            } else if (((id.name ?? "") as String == "async" && matchX(getTT()._function) && !canInsertSemicolon())) {
                next()
                return parseFunction(node.getOrThrow(), false, allowExpressionBody: false, isAsync: true, optionalId: Option<Bool>.None)
            } else if ((canBeArrow && ((id.name ?? "") as String == "async") && matchX(getTT().name))) {
                let params = ArrayList<Node>([parseIdentifier(Option<Bool>.None)])
                expect(getTT().arrow, pos: None)
                return parseArrowExpression(node.getOrThrow(), params, isAsync: true)
            }
            if ((canBeArrow && !canInsertSemicolon() && eat(getTT().arrow))) {
                return parseArrowExpression(node.getOrThrow(), ArrayList<Node>([id]))
            }
            return id
        case tt_name where tt_name == getTT().name =>
            node = startNode()
            let allowAwait = ((state.value ?? "") as String == "await" && state.inAsync)
            let allowYield = shouldAllowYieldIdentifier()
            let id = parseIdentifier(allowAwait || allowYield)
            if (((id.name ?? "") as String == "await")) {
                if ((state.inAsync || inModule)) {
                    return parseAwait(node.getOrThrow())
                }
            } else if (((id.name ?? "") as String == "async" && matchX(getTT()._function) && !canInsertSemicolon())) {
                next()
                return parseFunction(node.getOrThrow(), false, allowExpressionBody:false, isAsync:true, optionalId:Option<Bool>.None)
            } else if ((canBeArrow && ((id.name ?? "") as String == "async") && matchX(getTT().name))) {
                let params = ArrayList<Node>([parseIdentifier(Option<Bool>.None)])
                expect(getTT().arrow, pos: None)
                return parseArrowExpression(node.getOrThrow(), params, isAsync: true)
            }
            if ((canBeArrow && !canInsertSemicolon() && eat(getTT().arrow))) {
                return parseArrowExpression(node.getOrThrow(), ArrayList<Node>([id]))
            }
            return id
        case tt_do where tt_do == getTT()._do =>
            if ((hasPlugin("doExpressions"))) {
                let node = startNode()
                next()
                let oldInFunction = state.inFunction
                let oldLabels = state.labels
                state.labels = ArrayList<Any>()
                state.inFunction = false
                node.body = parseBlock(allowDirectives: false)
                state.inFunction = oldInFunction
                state.labels = oldLabels
                return finishNode(node, "DoExpression")
            }
            //fallthrough
            let value = state.value
            node = parseLiteral((value.getOrThrow() as RegConfig).getOrThrow().value, "RegExpLiteral", None, None)
            node.getOrThrow().pattern = (value.getOrThrow() as RegConfig).getOrThrow().pattern
            node.getOrThrow().flags = (value.getOrThrow() as RegConfig).getOrThrow().flags
            return node
        case tt_regexp where tt_regexp == getTT().regexp =>
            let value = state.value
            node = parseLiteral((value.getOrThrow() as RegConfig).getOrThrow().value, "RegExpLiteral", None, None)
            node.getOrThrow().pattern = (value.getOrThrow() as RegConfig).getOrThrow().pattern
            node.getOrThrow().flags = (value.getOrThrow() as RegConfig).getOrThrow().flags
            return node
        case tt_num where tt_num == getTT().num =>
            return parseLiteral(state.value, "NumericLiteral", None, Option<Position0>.None)
        case tt_string where tt_string == getTT().string =>
            return parseLiteral(state.value, "StringLiteral", None, Option<Position0>.None)
        case tt_null where tt_null == getTT()._null =>
            node = startNode()
            next()
            return finishNode(node.getOrThrow(), "NullLiteral")
        case tt_true where tt_true == getTT()._true =>
            node = startNode()
            node.getOrThrow().value = matchX(getTT()._true)
            next()
            return finishNode(node.getOrThrow(), "BooleanLiteral")
        case tt_false where tt_false == getTT()._false =>
            node = startNode()
            node.getOrThrow().value = matchX(getTT()._true)
            next()
            return finishNode(node.getOrThrow(), "BooleanLiteral")
        case tt_parenL where tt_parenL == getTT().parenL =>
            return parseParenAndDistinguishExpression(None, None, canBeArrow)
        case tt_bracketL where tt_bracketL == getTT().bracketL =>
            node = startNode()
            next()
            let expList = parseExprList(getTT().bracketR, allowEmpty:true, refShorthandDefaultPos:refShorthandDefaultPos)
            var expList00: ?ArrayList<?Node> = ArrayList<?Node>()
            for (expList_element in expList) {
                expList00.getOrThrow().add(Some(expList_element))
            }
            node.getOrThrow().elements = expList00
            toReferencedList(expList)
            return finishNode(node.getOrThrow(), "ArrayExpression")
        case tt_braceL where tt_braceL == getTT().braceL =>
            return parseObj(false, refShorthandDefaultPos: refShorthandDefaultPos)
        case tt_function where tt_function == getTT()._function =>
            return parseFunctionExpression()
        case tt_at where tt_at == getTT().at =>
            parseDecorators(allowExport:None)
            return None
        case tt_class where tt_class == getTT()._class =>
            node = startNode()
            takeDecorators(node.getOrThrow())
            return parseClass(node.getOrThrow(), false, optionalId:None)
        case tt_new where tt_new == getTT()._new =>
            return parseNew()
        case tt_backQuote where tt_backQuote == getTT().backQuote =>
            return parseTemplate(false)
        case tt_doubleColon where tt_doubleColon == getTT().doubleColon =>
            node = startNode()
            next()
            node.getOrThrow().object = Option<Node>.None
            node.getOrThrow().callee = parseNoCallExpr()
            let callee = node.getOrThrow().callee
            if ((callee.getOrThrow()._type == "MemberExpression")) {
                return finishNode(node.getOrThrow(), "BindExpression")
            } else {
                 raise(callee.getOrThrow().start, "Binding should be performed on object property.")
                return None
            }
        case _ =>
            unexpected(None, Option<Any>.None)
            return None
        }
    }
    
    func parseFunctionExpression() : Node {
        let node = startNode()
        let meta = parseIdentifier(true)
        if ((state.inGenerator && eat(getTT().dot) && hasPlugin("functionSent"))) {
            return parseMetaProperty(node, meta, "sent")
        } else {
            return parseFunction(node, false, allowExpressionBody:Option<Bool>.None, isAsync:Option<Bool>.None, optionalId:Option<Bool>.None)
        }
    }
    
    func parseMetaProperty( node: Node,  meta: Node,  propertyName: String) : Node {
        node.meta = meta
        node.property = parseIdentifier(true)
        if (((node.property.getOrThrow().name).getOrThrow() as String != propertyName)) {
             raise(node.property.getOrThrow().start, "The only valid meta property for new is Any??")
        }
        return finishNode(node, "MetaProperty")
    }
    
    open public func parseLiteral(value: ?Any, _type: String, startPos: ?Int64, startLoc: ?Position0): Node {
        let startPos1 : ?Int64 
        let startLoc1 : ?Position0 
        if (startPos.isSome()) {
            startPos1 = startPos.getOrThrow()
        } else {
            startPos1 = state.start 
        }
        if (startLoc.isSome()) {
            startLoc1 = startLoc.getOrThrow()
        } else {
            startLoc1 = state.startLoc.getOrThrow()
        }
        let node = startNodeAt(startPos1.getOrThrow(), startLoc1.getOrThrow())
        addExtra(node, "rawValue", (value.getOrThrow() as ExtraValue).getOrThrow())
        addExtra(node, "raw", input.slice(startPos1.getOrThrow(), state.end))
        node.value = value
        next()
        return finishNode(node, _type)
    }
    
    func parseParenExpression() : Node {
        expect(getTT().parenL, pos: None)
        let val = parseExpression(noIn: None, refShorthandDefaultPos:None)
        expect(getTT().parenR, pos: None)
        return val.getOrThrow()
    }
    
    func parseParenAndDistinguishExpression( startPos: ?Int64,  startLoc: ?Position0,  canBeArrow: Bool) : Node {
        let startPos1 : Int64 
        let startLoc1 : Position0 
        if (startPos.isSome()) {
            startPos1 = startPos.getOrThrow()
        } else {
            startPos1 = state.start
        }
        if (startLoc.isSome()) {
            startLoc1 = startLoc.getOrThrow()
        } else {
            startLoc1 = state.startLoc.getOrThrow()
        }
        let val: Node
        expect(getTT().parenL, pos: None)
        let innerStartPos = state.start
        let innerStartLoc = state.startLoc
        var exprList: ArrayList<Node> = ArrayList<Node>([])
        let refShorthandDefaultPos = ExpPos(0)
        let refNeedsArrowPos = ExpPos(0)
        var first = true
        var spreadStart: Int64 = 0
        var optionalCommaStart: Int64 = 0
        while ((!matchX(getTT().parenR))) {
            if ((first)) {
                first = false
            } else {
                expect(getTT().comma, pos: refNeedsArrowPos.start)
                if ((matchX(getTT().parenR))) {
                    optionalCommaStart = state.start
                    break
                }
            }
            if ((matchX(getTT().ellipsis))) {
                let spreadNodeStartPos = state.start
                let spreadNodeStartLoc = state.startLoc
                spreadStart = state.start
                exprList.add(parseParenItem(parseRest(), None, None))
                break
            } else {
                let handler: (Parser, Node, Int64, Position0) -> Node = { tar, n, pos, loc =>
                    return n
                }
                exprList.add( parseMaybeAssign( false, refShorthandDefaultPos, handler, refNeedsArrowPos).getOrThrow())
            }
        }
        let innerEndPos = state.start
        let innerEndLoc = state.startLoc
        expect(getTT().parenR, pos: None)
        var arrowNode: ?Node = startNodeAt(startPos1, startLoc1)
        if (canBeArrow && shouldParseArrow()) {
            arrowNode = parseArrow(arrowNode.getOrThrow())
            if (arrowNode.isSome()) {
                for (param in exprList) {
                    if ((param.extra.isSome() && param.extra.getOrThrow().contains("parenthesized"))) {
                        unexpected(param.extra.getOrThrow()["parenStart"] as Int64, Option<Any>.None)
                    }
                }
                return parseArrowExpression(arrowNode.getOrThrow(), exprList)
            }
        }

        if (exprList.size == 0) {
            unexpected(state.lastTokStart, Option<Any>.None)
        }
        if (optionalCommaStart > 0) {
            unexpected(optionalCommaStart, Option<Any>.None)
        }
        if (spreadStart > 0) {
            unexpected(spreadStart, Option<Any>.None)
        }
        if (refShorthandDefaultPos.start != 0) {
            unexpected(refShorthandDefaultPos.start, Option<Any>.None)
        }
        if (refNeedsArrowPos.start > 0) {
            unexpected(refNeedsArrowPos.start, Option<Any>.None)
        }
        if (exprList.size > 1) {
            val = startNodeAt(innerStartPos, innerStartLoc.getOrThrow())
            val.expressions = exprList
            toReferencedList(val.expressions)
            finishNodeAt(val, "SequenceExpression", innerEndPos, innerEndLoc.getOrThrow())
        } else {
            val = exprList[0]
        }
        addExtra(val, "parenthesized", true)
        addExtra(val, "parenStart", (startPos1 as ExtraValue).getOrThrow())
        return val
    }
    
    open public func shouldParseArrow() : Bool {
        return !canInsertSemicolon()
    }
    
    open public func parseArrow( node: Node) : ?Node {
        if ((eat(getTT().arrow))) {
            return node
        }
        return None
    }
    
    open public func parseParenItem( node: Node,  startPos: ?Int64,  startLoc: ?Position0) : Node {
        return node
    }
    
    func parseNew() : Node {
        let node = startNode()
        let meta = parseIdentifier(true)
        if ((eat(getTT().dot))) {
            let metaProp = parseMetaProperty(node, meta, "target")
            if ((!state.inFunction)) {
                 raise(metaProp.property.getOrThrow().start, "new.target can only be used in functions")
            }
            return metaProp
        }
        node.callee = parseNoCallExpr()
        if ((eat(getTT().parenL))) {
            node.args = parseExprList(getTT().parenR, allowEmpty:None, refShorthandDefaultPos:None)
            toReferencedList(node.args)
        } else {
            node.args = ArrayList<Node>()
        }
        return finishNode(node, "NewExpression")
    }
    
    func parseTemplateElement( isTagged: Bool) : Node {
        let elem = startNode()
        if ((state.value.isNone())) {
            if ((!isTagged)) {
                raise(state.invalidTemplateEscapePosition0, "Invalid escape sequence in template")
            } else {
                state.invalidTemplateEscapePosition0 = Option<Int64>.None
            }
        }
        let reg =  Regex("\\r\\n?")
        let raw = input.slice(state.start, state.end).replace("\r\n", "\n")
        let cooked = state.value
        elem.value = TemplateElementValue(raw, cooked: cooked)
        next()
        elem.tail = matchX(getTT().backQuote)
        return finishNode(elem, "TemplateElement")
    }
    
    func parseTemplate( isTagged: Bool) : Node {
        let node = startNode()
        next()
        node.expressions = ArrayList<Node>()
        var curElt = parseTemplateElement(isTagged)
        node.quasis = ArrayList<Node>([curElt])
        while ((!curElt.tail.getOrThrow())) {
            expect(getTT().dollarBraceL, pos: None)
            node.expressions.getOrThrow().add(parseExpression(noIn: None, refShorthandDefaultPos:None).getOrThrow())
            expect(getTT().braceR, pos: None)
            curElt = parseTemplateElement(isTagged)
            node.quasis.getOrThrow().add(curElt)
        }
        next()
        return finishNode(node, "TemplateLiteral")
    }
    
    func parseObj( isPattern: Bool,  refShorthandDefaultPos!: ?ExpPos = Option<ExpPos>.None) : Node {
        var decorators = ArrayList<Node>()
        let propHash = this
        var first = true
        let node = startNode()
        node.properties = ArrayList<Node>()
        next()
        var firstRestLocation: ?Int64 = Option<Int64>.None
        while (!eat(getTT().braceR)) {
            if ((first)) {
                first = false
            } else {
                expect(getTT().comma, pos: None)
                if ((eat(getTT().braceR))) {
                    break
                }
            }
            while ((matchX(getTT().at))) {
                decorators.add(parseDecorator())
            }
            var _prop  = startNode()
            var isGenerator = false
            var isAsync = false
            var startPos: ?Int64 = Option<Int64>.None
            var startLoc: ?Position0 = Option<Position0>.None
            if ((decorators.size > 0)) {
                _prop.decorators = decorators
                decorators = ArrayList<Node>()
            }
            if ((hasPlugin("objectRestSpread") && matchX(getTT().ellipsis))) {
                if (isPattern) {
                    _prop = parseSpread(ExpPos(0))
                    _prop._type = "RestElement"
                } else {
                    _prop = parseSpread(None)
                    _prop._type = "SpreadElement"
                }
                if ((isPattern)) {
                    toAssignable(_prop.argument, true, "object pattern")
                }
                node.properties.getOrThrow().add(_prop)
                if ((isPattern)) {
                    let position = state.start
                    if ((firstRestLocation.isSome())) {
                        unexpected(firstRestLocation, "Cannot have multiple rest elements when destructuring")
                    } else if ((eat(getTT().braceR))) {
                        break
                    } else if ((matchX(getTT().comma) && refEq(lookahead()._type, getTT().braceR))) {
                        unexpected(position, "A trailing comma is not permitted after the rest element")
                    } else {
                        firstRestLocation = position
                        continue
                    }
                } else {
                    continue
                }
            }
            _prop.method = false
            _prop.shorthand = false
            if (isPattern || (refShorthandDefaultPos.isSome())) {
                startPos = state.start
                startLoc = state.startLoc
            }
            if ((!isPattern)) {
                isGenerator = eat(getTT().star)
            }
            if ((!isPattern && isContextual("async"))) {
                if ((isGenerator)) {
                    unexpected(None, Option<Any>.None)
                }
                let asyncId = parseIdentifier(None)
                if ((matchX(getTT().colon) || matchX(getTT().parenL) || matchX(getTT().braceR) || matchX(getTT().eq) || matchX(getTT().comma))) {
                    _prop.key = asyncId
                    _prop.computed = false
                } else {
                    isAsync = true
                    if ((hasPlugin("asyncGenerators"))) {
                        isGenerator = eat(getTT().star)
                    }
                    parsePropertyName(_prop)
                }
            } else {
                parsePropertyName(_prop)
            }
            parseObjPropValue(_prop, startPos, startLoc, isGenerator, isAsync, isPattern, refShorthandDefaultPos.getOrThrow())
            checkPropClash(_prop, propHash)
            if ((_prop.shorthand.getOrThrow())) {
                addExtra(_prop, "shorthand", true)
            }
            node.properties.getOrThrow().add(_prop)
        }
        if ((firstRestLocation.isSome())) {
            unexpected(firstRestLocation, "The rest element has to be the last element when destructuring")
        }
        if ((decorators.size > 0)) {
            raise(state.start, "You have trailing decorators with no property")
        }
        if (isPattern) {
            return finishNode(node, "ObjectPattern")
        } else {
            return finishNode(node, "ObjectExpression")
        }
    }

    func isGetterOrSetterMethod( _prop: Node,  isPattern: Bool) : Bool {
        return !isPattern && 
        !_prop.computed.getOrThrow() &&
        _prop.key.getOrThrow()._type == "Identifier" &&
        (((_prop.key.getOrThrow().name ?? "") as String == "get") || ((_prop.key.getOrThrow().name ?? "") as String == "set")) &&
        (
            matchX(getTT().string) ||
            matchX(getTT().num) ||
            matchX(getTT().bracketL) ||
            matchX(getTT().name) ||
            (state._type.keyword.isSome() && state._type.keyword.isSome())
        )
    }
    
    open public func checkGetterSetterParamCount( method: Node) {
        var paramCount = 1
        if (method.kind == "get") {
            paramCount = 0
        } 
        if ((method.params.getOrThrow().size != paramCount)) {
            let start = method.start
            if ((method.kind == "get")) {
                raise(start, "getter should have no params")
            } else {
                raise(start, "setter should have exactly one param")
            }
        }
    }
    
    open public func parseObjectMethod( _prop: Node,  isGenerator: Bool,  isAsync: Bool,  isPattern: Bool) : ?Node {
        if ((isAsync || isGenerator || matchX(getTT().parenL))) {
            if ((isPattern)) {
                unexpected(None, Option<Any>.None)
            }
            _prop.kind = "method"
            _prop.method = true
            parseMethod(_prop, isGenerator, isAsync)
            return finishNode(_prop, "ObjectMethod")
        }
        if ((isGetterOrSetterMethod(_prop, isPattern))) {
            if ((isGenerator || isAsync)) {
                unexpected(None, Option<Any>.None)
            }
            _prop.kind = (_prop.key.getOrThrow().name.getOrThrow() as String).getOrThrow()
            parsePropertyName(_prop)
            parseMethod(_prop, None, None)
            checkGetterSetterParamCount(_prop)
            return finishNode(_prop, "ObjectMethod")
        }
        return None
    }
    
    func parseObjectProperty( _prop: Node,  startPos: ?Int64,  startLoc: ?Position0,  isPattern: Bool,  refShorthandDefaultPos: ?ExpPos) : ?Node {
        if ((eat(getTT().colon))) {
            if (isPattern) {
                _prop.value = match(parseMaybeDefault(state.start, state.startLoc, Option<Node>.None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            } else {
                _prop.value =  parseMaybeAssign(false, refShorthandDefaultPos, Option<((Parser, Node, Int64, Position0) -> Node)>.None, Option<ExpPos>.None).getOrThrow()
            }
            return finishNode(_prop, "ObjectProperty")
        }
        if ((!_prop.computed.getOrThrow() && _prop.key.getOrThrow()._type == "Identifier")) {
            if ((isPattern)) {
                checkReservedWord((_prop.key.getOrThrow().name.getOrThrow() as String).getOrThrow(), _prop.key.getOrThrow().start, true, true)
                _prop.value = match(parseMaybeDefault(startPos, startLoc, _prop.key.getOrThrow().clone())) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            } else if ((matchX(getTT().eq) && refShorthandDefaultPos.isSome())) {
                if ((refShorthandDefaultPos.getOrThrow().start == 0)) {
                    refShorthandDefaultPos.getOrThrow().start = state.start
                }
                _prop.value = match(parseMaybeDefault(startPos, startLoc, _prop.key.getOrThrow().clone())) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            } else {
                _prop.value = _prop.key.getOrThrow().clone()
            }
            _prop.shorthand = true
            return finishNode(_prop, "ObjectProperty")
        }
        return None
    }

    func parseObjPropValue( _prop: Node,  startPos: ?Int64,  startLoc: ?Position0,  isGenerator: Bool,  isAsync: Bool,  isPattern: Bool,  refShorthandDefaultPos: ExpPos) : Bool {
        let node =
        (parseObjectMethod(_prop, isGenerator, isAsync, isPattern).isSome()) ||
        (parseObjectProperty(_prop, startPos, startLoc, isPattern, refShorthandDefaultPos).isSome())
        if ((!node)) {
            unexpected(None, Option<Any>.None)
        }
        return node
    }
    
    open public func parsePropertyName( _prop: Node) : ?Node {
        if ((eat(getTT().bracketL))) {
            _prop.computed = true
            _prop.key =  parseMaybeAssign( None, None, None, None)
            expect(getTT().bracketR)
        } else {
            _prop.computed = false
            let oldInPropertyName = state.inPropertyName
            state.inPropertyName = true
            if (matchX(getTT().num) || matchX(getTT().string)) {
                _prop.key = parseExprAtom(Option<ExpPos>.None)
            } else {
                _prop.key = parseIdentifier(true)
            }
            state.inPropertyName = oldInPropertyName
        }
        return _prop.key
    }

    func initFunction( node: Node,  isAsync: ?Bool) {
        node.id = Option<Node>.None
        node.generator = false
        node.expression = false
        if (isAsync.isNone()) {
            node.async = false
        } else {
            node.async = isAsync
        }
    }
    
    open public func parseMethod( node: Node,  isGenerator: ?Bool,  isAsync: ?Bool ) : Node {
        let oldInMethod = state.inMethod
        if (node.kind.isSome()) {
            state.inMethod = match(node.kind)  {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
        } else {
            state.inMethod = true
        }
        initFunction(node, isAsync.getOrThrow())
        expect(getTT().parenL)
        node.params = parseBindingList(getTT().parenR, allowEmpty: None)
        node.generator = isGenerator
        parseFunctionBody(node, None)
        state.inMethod = oldInMethod
        return node
    }
    
    func parseArrowExpression( node: Node,  params: ?ArrayList<Node>,  isAsync!: ?Bool = Option<Bool>.None) : Node {
        initFunction(node, isAsync)
        var params00: ?ArrayList<?Node> = ArrayList<?Node>()
        for (param in params.getOrThrow()) {
            params00.getOrThrow().add(Some(param))
        }
        node.params = toAssignableList(params00, true, "arrow function parameters")
        parseFunctionBody(node, true)
        return finishNode(node, "ArrowFunctionExpression")
    }

    open public func isStrictBody( node: Node,  isExpression: Bool) : Bool {
        if ((!isExpression && (node.body.getOrThrow() as Node).getOrThrow().directives.getOrThrow().size > 0)) {
            for (directive in (node.body.getOrThrow() as Node).getOrThrow().directives.getOrThrow()) {
                if (((((directive.value.getOrThrow() as Node).getOrThrow().value ?? "") as String) == "use strict")) {
                    return true
                }
            }
        }
        return false
    }
    
    open public func parseFunctionBody( node: Node,  allowExpression: ?Bool) : Unit {
        var allowExpressionBool : Bool 
        if (allowExpression.isNone()) {
            allowExpressionBool = false
        } else {
            allowExpressionBool = allowExpression.getOrThrow()
        }
        let isExpression = allowExpressionBool && !matchX(getTT().braceL)
        let oldInAsync = state.inAsync
        state.inAsync = node.async.getOrThrow()
        if ((isExpression)) {
            node.body =  match(parseMaybeAssign(None, None, None, Option<ExpPos>.None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            node.expression = true
        } else {
            let oldInFunc = state.inFunction
            let oldInGen = state.inGenerator
            let oldLabels = state.labels
            state.inFunction = true
            state.inGenerator = node.generator.getOrThrow()
            state.labels = ArrayList<Any>()
            node.body = parseBlock(allowDirectives: true)
            node.expression = false
            state.inFunction = oldInFunc
            state.inGenerator = oldInGen
            state.labels = oldLabels
        }
        state.inAsync = oldInAsync
        let isStrict = isStrictBody(node, isExpression)
        let isCheckLVal = state.strict || allowExpressionBool || isStrict
        if ((isStrict && (node.id.isSome()) && node.id.getOrThrow()._type == "Identifier" && ((node.id.getOrThrow().name ?? "") as String == "yield"))) {
            raise(node.id.getOrThrow().start, "Binding yield in strict mode")
        }
        if ((isCheckLVal)) {
            let nameHash: HashMap<String, Bool> = HashMap<String, Bool>()
            let oldStrict = state.strict
            if ((isStrict)) {
                state.strict = true
            }
            if ((node.id.isSome())) {
                checkLVal(node.id.getOrThrow(), true, None, "function name")
            }
            for (param in node.params.getOrThrow()) {
                if ((isStrict && param.getOrThrow()._type != "Identifier")) {
                    raise(param.getOrThrow().start, "Non-simple parameter in strict mode")
                }
                checkLVal(param.getOrThrow(), true, nameHash, "function parameter list")
            }
            state.strict = oldStrict
        }
    }

    func parseExprList( close: TokenType,  allowEmpty!: ?Bool = Option<Bool>.None,  refShorthandDefaultPos!: ?ExpPos = Option<ExpPos>.None) : ArrayList<Node> {
        var elts:ArrayList<Node> = ArrayList<Node>()
        var first = true
        while ((!eat(close))) {
            if (first) {
                first = false
            } else {
                expect(getTT().comma)
                if ((eat(close))) {
                    break
                }
            }
            elts.add(parseExprListItem(allowEmpty, refShorthandDefaultPos, Option<ExpPos>.None).getOrThrow())
        }
        return elts
    }

    open public func parseExprListItem( allowEmpty: ?Bool,  refShorthandDefaultPos: ?ExpPos,  refNeedsArrowPos: ?ExpPos) : ?Node {
        let elt: ?Node
        if ((allowEmpty.isSome() && allowEmpty == true && matchX(getTT().comma))) {
            elt = Option<Node>.None
        } else if ((matchX(getTT().ellipsis))) {
            elt = parseSpread(refShorthandDefaultPos)
        } else {
            let handler: ( tar: Parser,  n: Node,  pos: Int64,  loc: Position0) -> Node = { tar, n, pos, loc =>
                return this.parseParenItem(n, Option<Int64>.None, Option<Position0>.None)
            }
            elt =  parseMaybeAssign( false, refShorthandDefaultPos, handler, refNeedsArrowPos)
        }
        return elt
    }

    func parseIdentifier( liberal: ?Bool ) : Node {
        let node = startNode()
        var liberalBool : Bool
        if (liberal.isNone()) {
            liberalBool = true
        } else {
            liberalBool = !liberal.getOrThrow()
        }
        var keyWord = false
        if (state._type.keyword.isNone()) {
            keyWord = false
        } else {
            if (state._type.keyword.getOrThrow().size == 0) {
                keyWord = false
            } else {
                keyWord = true
            }
        }
        if (liberalBool) {
            checkReservedWord(((state.value ?? "") as String).getOrThrow(), state.start, keyWord, false)
        }
        if (matchX(getTT().name)) {
            node.name = ((state.value ?? "") as String).getOrThrow()
        } else if (state._type.keyword.getOrThrow().size > 0) {
            node.name = state._type.keyword.getOrThrow()
        } else {
            unexpected(None, Option<Any>.None)
        }
        if ((liberalBool && ((node.name ?? "") as String == "await") && state.inAsync)) {
            raise(node.start, "invalid use of await inside of an async function")
        }
        node.loc.identifierName = node.name.getOrThrow() as String
        next()
        return finishNode(node, "Identifier")
    }

    func checkReservedWord( word: String,  startLoc: Int64,  checkKeywords: Bool,  isBinding: Bool) {
        if ((isReservedWord(word) || (checkKeywords && isKeyword(word)))) {
            raise(startLoc, word + " is a reserved word")
        }
        if ((state.strict && (reservedWords.strict(word) || (isBinding && reservedWords.strictBind(word))))) {
            raise(startLoc, word + " is a reserved word in strict mode")
        }
    }

    func parseAwait( node: Node) : Node {
        if (!state.inAsync) {
            unexpected(None, Option<Any>.None)
        }
        if ((matchX(getTT().star))) {
            raise(node.start, "await* has been removed from the async functions proposal. Use Promise.all() instead.")
        }
        node.argument = parseMaybeUnary()
        return finishNode(node, "AwaitExpression")
    }

    func parseYield() : Node {
        let node = startNode()
        next()
        if (matchX(getTT().semi) || 
            canInsertSemicolon() ||
            (!matchX(getTT().star) && !state._type.startsExpr)) {
            node.delegate = false
            node.argument = Option<Node>.None
        } else {
            node.delegate = eat(getTT().star)
            node.argument =  parseMaybeAssign( None, None, None, None)
        }
        return finishNode(node, "YieldExpression")
    }
    
    func startNode() : Node {
        return Node(parser: this, pos: state.start, loc: state.startLoc)
    };

    func startNodeAt( pos: ?Int64,  loc: ?Position0) : Node {
        return Node(parser: this, pos: pos, loc: loc)
    }
    
    func finishNode( node: Node,  _type: String) : Node {
        node._type = _type;
        node.end = state.lastTokEnd
        node.loc.end = state.lastTokEndLoc
        if ((options.ranges.getOrThrow())) {
            node.range_1 = state.lastTokEnd
        }
        processComment(node)
        return node
    }
    
    func finishNodeAt( node: Node,  _type: String,  pos: Int64,  loc: Position0) : Node {
        node._type = _type
        node.end = pos
        node.loc.end = loc
        if ((options.ranges.getOrThrow())) {
            node.range_1 = pos 
        }
        processComment(node)
        return node
    };
    
    func resetStartLocationFromNode( node: Node,  locationNode: Node)  : Node {
        node.start = locationNode.start;
        node.loc.start = locationNode.loc.start;
        if ((options.ranges.getOrThrow())) {
            node.range_0 = locationNode.range_0 ?? 0;
        }
        return node;
    }
        
    override public func addComment( comment: Comment) : Unit {
        comment.loc.fileName = fileName
        state.trailingComments.getOrThrow().add(comment)
        state.leadingComments.getOrThrow().add(comment)
    }
    
    func processComment(node: Node) {
        if ((node._type == "Program" && ((node.body.getOrThrow() as ArrayList<Node>) ?? ArrayList<Node>()).size > 0)) {
            return
        }
        var stack = state.commentStack
        var lastChild: ?Node = Option<Node>.None
        var trailingComments: ?ArrayList<Comment>
        let i: Int64 = 0
        var j: Int64 = 0
        if (state.trailingComments.getOrThrow().size > 0) {
            if ((state.trailingComments.getOrThrow()[0].start >= Int64(node.end))) {
                trailingComments = state.trailingComments
                state.trailingComments = ArrayList<Comment>()
            } else {
                state.trailingComments.getOrThrow().clear()
            }
        } else {
            let lastInStack = last(stack.getOrThrow())
                   
            if ((stack.getOrThrow().size > 0) && lastInStack.trailingComments.isSome() && (lastInStack.trailingComments.getOrThrow().size) != 0 && ((lastInStack.trailingComments.getOrThrow()[0].start) >= Int64(node.end))) {
                    trailingComments = lastInStack.trailingComments;
                    lastInStack.trailingComments = Option<ArrayList<Comment>>.None;
            }
        }
        
        while (stack.getOrThrow().size > 0 && last(stack.getOrThrow()).start >= node.start) {
            lastChild = stack.getOrThrow().popLast()
        }
        
        if (lastChild.isSome()) {
            if (((lastChild.getOrThrow().leadingComments).isSome())) {
                if ((!refEq(lastChild.getOrThrow(), node) && last(lastChild.getOrThrow().leadingComments ?? ArrayList<Comment>([])).end <= Int64(node.start))) {
                    node.leadingComments = lastChild.getOrThrow().leadingComments.getOrThrow()
                    lastChild.getOrThrow().leadingComments = Option<ArrayList<Comment>>.None;
                } else {
                    var i = lastChild.getOrThrow().leadingComments.getOrThrow().size - 2
                    while (i >= 0) {
                        if ((lastChild.getOrThrow().leadingComments.getOrThrow()[i].end <= Int64(node.start))) {
                            node.leadingComments = lastChild.getOrThrow().leadingComments.getOrThrow().splice(0, i + 1)
                            break;
                        }
                        i -= 1
                    }
                }
            }
        } else if ((state.leadingComments.getOrThrow().size > 0)) {
            if ((last(state.leadingComments.getOrThrow()).end <= Int64(node.start))) {
                if ((state.commentPreviousNode.isSome())) {
                    while (j < state.leadingComments.getOrThrow().size) {
                        if ((state.leadingComments.getOrThrow()[j].end < Int64(state.commentPreviousNode.getOrThrow().end))) {
                            state.leadingComments = state.leadingComments.getOrThrow().splice(j, 1)
                            j -= 1
                        }
                        j += 1
                    }
                }
                if ((state.leadingComments.getOrThrow().size > 0)) {
                    node.leadingComments = state.leadingComments
                    state.leadingComments = ArrayList<Comment>();
                }
            } else {
                for (i in (0..state.leadingComments.getOrThrow().size)) {
                    if (state.leadingComments.getOrThrow()[i].end > Int64(node.start)) {
                        break
                    }
                }
                node.leadingComments = state.leadingComments.getOrThrow().slice(0, end: i)
                if (node.trailingComments.isSome() && node.trailingComments.getOrThrow().size == 0) {
                    node.trailingComments = Option<ArrayList<Comment>>.None
                }
                trailingComments = state.leadingComments.getOrThrow().slice(i)
                if (trailingComments.getOrThrow().size == 0) {
                    trailingComments = Option<ArrayList<Comment>>.None
                }
            }
        }
        
        state.commentPreviousNode = node
        trailingComments = ArrayList<Comment>()
        if (trailingComments.isSome()) {
            if (trailingComments.getOrThrow().size != 0 &&
                trailingComments.getOrThrow()[0].start >= Int64(node.start) &&
                last(trailingComments.getOrThrow()).end <= Int64(node.end)) {
                node.innerComments = trailingComments
            } else {
                node.trailingComments = trailingComments
            }
        }
        stack.getOrThrow().add(node)
        state.commentStack = stack
        
    }
    
    func addExtra( node: Node,  key: String,  val: ExtraValue) {
        node.extra = node.extra ?? HashMap<String,ExtraValue>()
        var extra = node.extra
        extra?[key] = val
        node.extra = extra
    }
    
    func isRelational( op: String) : Bool {
        return matchX(getTT().relational) && (state.value ?? "") as String == op
    }
    
    func expectRelational( op: String) : Unit {
        if ((isRelational(op))) {
            next()
        } else {
            unexpected(None, getTT().relational);
        }
    }
    
    func isContextual( name: String) : Bool {
        return matchX(getTT().name) && (state.value ?? "") as String == name
    }
    
    func eatContextual( name: String) : Bool {
        return (state.value ?? "") as String == name && eat(getTT().name)
    }
    
    func expectContextual( name: String,  message!: ?String = Option<String>.None) : Unit {
        if ((!eatContextual(name))) {
            unexpected(None, match(message) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                })
        }
    }
    
    func canInsertSemicolon() : Bool {
        return matchX(getTT().eof) ||
        matchX(getTT().braceR) ||
        lineBreak.matcher(input.slice(state.lastTokEnd, state.start)).matchStart().isSome()
      }

      func isLineTerminator() : Bool {
        return eat(getTT().semi) || canInsertSemicolon()
      }

      func semicolon() : Unit {
          if ((!isLineTerminator())) {
              unexpected(None, getTT().semi)
          }
      }
    
    /// Any: void | boolean
    func expect( _type: TokenType, pos!: ?Int64 = Option<Int64>.None) : ?Bool {
        let eatBool = eat(_type)
        if (eatBool) {
            return eatBool
        } else {
            unexpected(pos, _type)
            return None
        }
    }
    
    /// Any: TokenType | string
    override public func unexpected( pos: ?Int64,  messageOrType: ?Any) : Unit {
        var message = "Unexpected token"
        if (messageOrType.isSome() &&
            messageOrType.getOrThrow() is TokenType &&
            (messageOrType.getOrThrow() as TokenType).getOrThrow().label.size > 0) {
            message = "Unexpected token, expected ${(messageOrType.getOrThrow() as TokenType).getOrThrow().label}"
        }
        if (pos.isSome()) {
             raise(pos.getOrThrow(), message);
        } else {
             raise(state.start, message);
        }
    }

    open public func toAssignable( node: ?Node,  isBinding: ?Bool,  contextDescription: String) : ?Node {
        if ((node.isSome())) {
            match (node.getOrThrow()._type) {
            case "Identifier" | "ObjectPattern" | "ArrayPattern" | "AssignmentPattern" =>
                ()
            case "ObjectExpression" =>
                node.getOrThrow()._type = "ObjectPattern";
                for (_prop in (node.getOrThrow().properties.getOrThrow())) {
                    if (_prop._type == "ObjectMethod") {
                        if (_prop.kind == "get" || _prop.kind == "set") {
                             raise(_prop.key.getOrThrow().start, "Object pattern can't contain getter or setter")
                        } else {
                             raise(_prop.key.getOrThrow().start, "Object pattern can't contain methods")
                        }
                    } else {
                        toAssignable(_prop, isBinding, "object destructuring pattern")
                    }
                }
                
                
            case "ObjectProperty" =>
                toAssignable(node.getOrThrow().value.getOrThrow() as Node, isBinding, contextDescription);
                
                
            case "SpreadElement" =>
                node.getOrThrow()._type = "RestElement"
                
            case "ArrayExpression" =>
                node.getOrThrow()._type = "ArrayPattern"
                toAssignableList(node.getOrThrow().elements ?? ArrayList<?Node>(), isBinding ?? false, contextDescription)
            case "AssignmentExpression" =>
                if (node.getOrThrow().`operator`.getOrThrow() as String == "=") {
                    node.getOrThrow()._type = "AssignmentPattern"
                    node.getOrThrow().`operator` = Option<Any>.None
                } else {
                     raise(node.getOrThrow().left.getOrThrow().end, "Only '=' operator can be used for specifying default value.")
                }
                
            case "MemberExpression" =>
                if (!(isBinding ?? false)) {
                    ()
                }
            case _ =>
                let subMessage : String
                if (contextDescription.size != 0) {
                    subMessage = " in ${contextDescription}"
                } else {
                    subMessage = "expression"
                }
                let message = "Invalid left-hand side ${subMessage}"
                 raise(node.getOrThrow().start, subMessage)
            }
        }
        return node;
    }
    
    open public func toAssignableList( exprList: ?ArrayList<?Node>,  isBinding: Bool,  contextDescription: String) : ?ArrayList<?Node> {
        var end = exprList.getOrThrow().size
        if (end != 0) {
            var last = exprList.getOrThrow()[end - 1]
            if ((last.isSome() && last.getOrThrow()._type == "RestElement")) {
                end -= 1
            } else if ((last.isSome() && last.getOrThrow()._type == "SpreadElement")) {
                last.getOrThrow()._type = "RestElement"
                let arg = last.getOrThrow().argument
                toAssignable(arg, isBinding, contextDescription)
                if ((arg.getOrThrow()._type != "Identifier" && arg.getOrThrow()._type != "MemberExpression" && arg.getOrThrow()._type != "ArrayPattern")) {
                    unexpected(arg.getOrThrow().start, Option<Any>.None);
                }
                end -= 1;
            }
        }
        for (i in (0..end)) {
            let elt = exprList.getOrThrow()[i]
            if ((elt.isSome() && elt.getOrThrow()._type == "SpreadElement")) {
                 raise(elt.getOrThrow().start, "The rest element has to be the last element when destructuring")
            }
            if ((elt.isSome())) {
                toAssignable(elt, isBinding, contextDescription)
            }
        }
        return exprList;
    }
    
    open public func toReferencedList( exprList: ?ArrayList<Node>) : ?ArrayList<Node> {
        return exprList
    }
    
    func parseSpread( refShorthandDefaultPos: ?ExpPos) : Node {
        let node = startNode()
        next()
        node.argument =  parseMaybeAssign(false, refShorthandDefaultPos, Option<((Parser, Node, Int64, Position0) -> Node)>.None, Option<ExpPos>.None)
        return finishNode(node, "SpreadElement");
    }
    
    func parseRest() : Node {
        let node = startNode()
        next()
        node.argument = parseBindingIdentifier()
        return finishNode(node, "RestElement");
    }
    
    func shouldAllowYieldIdentifier() : Bool {
        return matchX(getTT()._yield) && !state.strict && !state.inGenerator
    }
    
    func parseBindingIdentifier() : Node {
        return parseIdentifier(shouldAllowYieldIdentifier())
    }
    
    func parseBindingAtom() : ?Node {
        match (state._type) {
        case tt_yield where tt_yield == getTT()._yield =>
            if ((state.strict || state.inGenerator) ) {
                unexpected(None, Option<Any>.None)
            }
            //fallthrough
            return parseIdentifier(true)
        case tt_name where tt_name == getTT().name =>
            return parseIdentifier(true)
        case tt_bracketL where tt_bracketL == getTT().bracketL =>
            let node = startNode()
            next()
            node.elements = parseBindingList(getTT().bracketR, allowEmpty: true)
            return finishNode(node, "ArrayPattern")
        case tt_braceL where tt_braceL == getTT().braceL =>
            return parseObj(true, refShorthandDefaultPos: None)
            
        case _ =>
            unexpected(None, Option<Any>.None)
            return None
            
        }
    }
    
    func parseBindingList( close: TokenType,  allowEmpty!: ?Bool = Option<Bool>.None) : ArrayList<?Node> {
        var elts: ArrayList<?Node> = ArrayList<?Node>()
        var first = true
        while ((!eat(close))) {
            if ((first)) {
                first = false
            } else {
                expect(getTT().comma, pos: None)
            }
            if (((allowEmpty ?? false) && matchX(getTT().comma))) {
                elts.add(None)
            } else if ((eat(close))) {
                break;
            } else if ((matchX(getTT().ellipsis))) {
                elts.add(parseAssignableListItemTypes(parseRest()))
                expect(close, pos: None)
                break;
            } else {
                var decorators: ArrayList<Node> = ArrayList<Node>()
                while ((matchX(getTT().at))) {
                    decorators.add(parseDecorator())
                }
                let left = parseMaybeDefault(None, None, None);
                if ((decorators.size != 0)) {
                    left.getOrThrow().decorators = decorators
                }
                parseAssignableListItemTypes(left.getOrThrow());
                elts.add(parseMaybeDefault(left.getOrThrow().start, left.getOrThrow().loc.start, left))
            }
        }
        return elts
    };
    
    open public func parseAssignableListItemTypes( param: Node) : Node {
        return param
    }
    
    open public func parseMaybeDefault( startPos: ?Int64,  startLoc: ?Position0,  left: ?Node) : ?Node {
        let startLoc1 : Position0
        if (startLoc.isSome()) {
            startLoc1 = startLoc.getOrThrow() 
        } else {
            startLoc1 = state.startLoc.getOrThrow()
        }
        let startPos1 : Int64
        if (startPos.isSome()) {
            startPos1 = startPos.getOrThrow()
        } else {
            startPos1 = state.start
        }
        let left1 : Node 
        if (left.isSome()) {
            left1 = left.getOrThrow() 
        } else {
            left1 = parseBindingAtom().getOrThrow()
        }
        if ((!eat(getTT().eq))) {
            return left1
        }
        
        let node = startNodeAt(Int64(startPos1), startLoc1)
        node.left = left1
        node.right =  parseMaybeAssign( None, None, None, None)
        return finishNode(node, "AssignmentPattern")
    }
    
    /// boolean | undefined
    open public func checkLVal( exprIn: Node,  isBinding: ?Bool,   checkClashesIn: ?HashMap<String, Bool>,  contextDescription: String): Unit {
        let expr = exprIn
        var checkClashes = checkClashesIn
        
        match (expr._type) {
        case "Identifier" =>
            checkReservedWord((expr.name ?? "") as String ?? "", expr.start, false, true)
            
            if (checkClashes.isSome()) {
                let key = "_${(expr.name ?? "") as String ?? ""}"
                if (checkClashes.getOrThrow().contains(key)) {
                     raise(expr.start, "Argument name clash in strict mode")
                } else {
                    checkClashes.getOrThrow()[key] = true
                }
            }            
        case "MemberExpression" =>
            if (isBinding ?? false) {
                if ((isBinding ?? false)) {
                     raise(expr.start, "Binding" + " member expression")
                } else {
                     raise(expr.start, "Assigning to" + " member expression")
                }
            }            
        case "ObjectPattern" =>
            for (item in expr.properties ?? ArrayList<Node>()) {
                var _prop: ?Node = item
                if ((_prop.getOrThrow()._type == "ObjectProperty")) {
                    _prop = _prop.getOrThrow().value.getOrThrow() as Node
                }
                checkLVal(_prop.getOrThrow(), isBinding, checkClashes, "object destructuring pattern")
            }
            
        case "ArrayPattern" =>
            for (elem in expr.elements ?? ArrayList<?Node>()) {
                var _prop: ?Node = elem
                if (_prop.isSome()) {
                    checkLVal(_prop.getOrThrow(), isBinding, checkClashes, "array destructuring pattern");
                }
            }
            
        case "AssignmentPattern" =>
            checkLVal(expr.left.getOrThrow(), isBinding, checkClashes, "assignment pattern");
            
        case "RestElement" =>
            checkLVal(expr.argument.getOrThrow(), isBinding, checkClashes, "rest element");
            
        case _ =>
            let message : String
            if ((isBinding ?? false)) {
                if (contextDescription.size != 0) {
                    message = "Binding invalid" + " left-hand side" + " in " + contextDescription ;
                } else {
                    message = "Binding invalid" + " left-hand side" +  /* istanbul ignore next */ "expression";
                }
            } else {
                if (contextDescription.size != 0) {
                    message = "Invalid" + " left-hand side" + " in " + contextDescription;

                } else {
                    message = "Invalid" + " left-hand side" + /* istanbul ignore next */ "expression";

                }    
            }
             raise(expr.start, message);
        }
    }
    
    func parseTopLevel( file: Node,  program: Node) : Node {
        program.sourceType = options.sourceType;
        parseBlockBody(program, true, true, getTT().eof); // key func
        file.program = finishNode(program, "Program");
        file.comments = state.comments;
        file.tokens = state.tokens;
        return finishNode(file, "File");
    };
    
    func stmtToDirective( stmt: Node) : Node {
        let expr = (stmt.expression.getOrThrow() as Node).getOrThrow()
        
        let directiveLiteral = startNodeAt(expr.start, expr.loc.start);
        let directive = startNodeAt(stmt.start, stmt.loc.start);
        
        let raw = input.slice(Int64(expr.start), Int64(expr.end));
        let val = raw.slice(1, raw.size - 2)
        directiveLiteral.value = val; // remove quotes
        
        addExtra(directiveLiteral, "raw", raw);
        addExtra(directiveLiteral, "rawValue", val);
        
        directive.value = finishNodeAt(directiveLiteral, "DirectiveLiteral", expr.end, expr.loc.end.getOrThrow());
        
        return finishNodeAt(directive, "Directive", stmt.end, stmt.loc.end.getOrThrow());
    }
    
    open public func parseStatement( declaration: Bool,  topLevel: ?Bool) : Node {
        if ((matchX(getTT().at))) {
            parseDecorators(allowExport:true);
        }
        
        let starttype = state._type; 
        let node = startNode();

        match (starttype.label) {
        case "break" =>
            return parseBreakContinueStatement(node, starttype.keyword.getOrThrow())
        case "continue" =>
            return parseBreakContinueStatement(node, starttype.keyword.getOrThrow())
        case "debugger" =>
            return parseDebuggerStatement(node);
        case "do" =>
            return parseDoStatement(node);
        case "for" =>
            return parseForStatement(node);
        case "function" =>
            if (!declaration) {
                unexpected(None, Option<Any>.None);
            }
            return parseFunctionStatement(node);
            
        case "class" =>
            if (!declaration) {
                unexpected(None, Option<Any>.None);
            }
            return parseClass(node, true);
            
        case "if" =>
            return parseIfStatement(node);
        case "return" =>
            return parseReturnStatement(node);
        case "switch" =>
            return parseSwitchStatement(node);
        case "throw" =>
            return parseThrowStatement(node);
        case "try" =>
            return parseTryStatement(node);
            
        case "let" =>
            if ((!declaration)) {
                unexpected(None, Option<Any>.None);
            }
            return parseVarStatement(node, starttype);
        case "const" =>
            if ((!declaration)) {
                unexpected(None, Option<Any>.None);
            }
            return parseVarStatement(node, starttype);
        case "var" =>
            return parseVarStatement(node, starttype);
        case "while" =>
            return parseWhileStatement(node);
        case "with" =>
            return parseWithStatement(node);
        case "{" =>
            return parseBlock();
        case ";" =>
            return parseEmptyStatement(node);
        case "export" =>
            if ((hasPlugin("dynamicImport") && refEq(lookahead()._type, getTT().parenL))) {
                print("dynamicImport");
            }
            if (options.allowImportExportEverywhere.getOrThrow()) {
                if ((!topLevel.getOrThrow())) {
                     raise(state.start, "'import' and 'export' may only appear at the top level");
                }
                
                if ((!inModule)) {
                     raise(state.start, "'import' and 'export' may appear only with 'sourceType: module'");
                }
            }
            if (refEq(getTT()._import, starttype)) {
                return parseImport(node)
            } else {
                return parseExport(node)
            }
        case "import" =>
            if ((hasPlugin("dynamicImport") && refEq(lookahead()._type, getTT().parenL))) {
                print("dynamicImport");
            }
            if ((options.allowImportExportEverywhere.getOrThrow())) {
                if ((!topLevel.getOrThrow())) {
                     raise(state.start, "'import' and 'export' may only appear at the top level");
                }
                
                if ((!inModule)) {
                     raise(state.start, "'import' and 'export' may appear only with 'sourceType: module'");
                }
            }
            if (refEq(getTT()._import, starttype)) {
                return parseImport(node)
            } else {
                return parseExport(node)
            }        
        case "name" =>
            if (((state.value ?? "") as String == "async")) {
                // peek ahead and see if next token is a function
                let state = state.clone();
                next();
                if ((matchX(getTT()._function) && !canInsertSemicolon())) {
                    expect(getTT()._function);
                    return parseFunction(node, true, allowExpressionBody:false, isAsync:true, optionalId:Option<Bool>.None);
                } else {
                    this.state = state;
                }
            }
        case _ => ()
        }
        let maybeName = ((state.value ?? "") as String).getOrThrow();
        let expr = parseExpression().getOrThrow();
        if (refEq(starttype, getTT().name) && expr._type == "Identifier" && eat(getTT().colon)) {
            return parseLabeledStatement(node, maybeName, expr);
        } else {
            return parseExpressionStatement(node, expr);
        }
    }
    
    func takeDecorators(node: Node) {
        if ((state.decorators.getOrThrow().size != 0)) {
            node.decorators = state.decorators;
            state.decorators = ArrayList<Node>();
        }
    }
    
    func parseDecorators( allowExport!: ?Bool = Option<Bool>.None) {
        while ((matchX(getTT().at))) {
            let decorator = parseDecorator();
            state.decorators.getOrThrow().add(decorator)
        }
        
        if ((allowExport.getOrThrow() && matchX(getTT()._extends))) {
            return;
        }
        
        if ((!matchX(getTT()._class))) {
            raise(state.start, "Leading decorators must be attached to a class declaration");
        }
    };
    
    func parseDecorator() : Node {
        if ((!hasPlugin("decorators"))) {
            unexpected(None, Option<Any>.None);
        }
        let node = startNode();
        next();
        node.expression =  match(parseMaybeAssign(None, None, None, None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
        return finishNode(node, "Decorator");
    }
    
    func parseBreakContinueStatement( node: Node,  keyword: String) : Node {
        let isBreak = keyword == "break";
        next();
        
        if ((isLineTerminator())) {
            node.label = Option<Node>.None;
        } else if ((!matchX(getTT().name))) {
            unexpected(None, Option<Any>.None);
        } else {
            node.label = parseIdentifier(Option<Bool>.None);
            semicolon();
        }
        
        let i: Int64 = 0
        
        for (i in 0..state.labels.getOrThrow().size) {
            let lab = state.labels.getOrThrow()[i];
            if ((node.label.isNone() || (lab as Label).getOrThrow().name == (node.label.getOrThrow().name.getOrThrow() as String).getOrThrow())) {
                if (((lab as Node).isSome() && (lab as Node).getOrThrow().kind.isSome() && (isBreak || (lab as Node).getOrThrow().kind == "loop"))) {
                    break;
                }
                if ((node.label.isSome()) && isBreak) {
                    break;
                }
            }
            
            
        }
        
        if ((i == state.labels.getOrThrow().size)) {
            raise(node.start, "Unsyntactic " + keyword);
        }
        if (isBreak) {
            return finishNode(node, "BreakStatement");
        } else {
            return finishNode(node, "ContinueStatement");
        }
    }
    
    func parseDebuggerStatement( node: Node) : Node {
        next();
        semicolon();
        return finishNode(node, "DebuggerStatement");
    };
    
    func parseDoStatement( node: Node) : Node {
        next();
        state.labels.getOrThrow().add(Label.loopLabel);
        node.body = parseStatement(false, None);
        state.labels.getOrThrow().popLast();
        expect(getTT()._while, pos: None);
        node.test = parseParenExpression();
        eat(getTT().semi);
        return finishNode(node, "DoWhileStatement");
    };

    func parseForStatement( node: Node) : Node {
        next();
        state.labels.getOrThrow().add(Label.loopLabel);
        var forAwait = false;
        if ((hasPlugin("asyncGenerators") && state.inAsync && isContextual("await"))) {
            forAwait = true;
            next();
        }
        expect(getTT().parenL, pos: None);
        
        if ((matchX(getTT().semi))) {
            if ((forAwait)) {
                unexpected(None, Option<Any>.None);
            }
            return parseFor(node, None);
        }
        
        if ((matchX(getTT()._var) || matchX(getTT()._let) || matchX(getTT()._const))) {
            let `init` = startNode();
            let varKind = state._type;
            next();
            parseVar(`init`, true, varKind);
            finishNode(`init`, "VariableDeclaration");
            
            if ((matchX(getTT()._in) || isContextual("of"))) {
                if ((`init`.declarations.getOrThrow().size == 1 && `init`.declarations.getOrThrow()[0].`init`.isSome())) {
                    return parseForIn(node, `init`, forAwait);
                }
            }
            if (forAwait) {
                unexpected(None, Option<Any>.None);
            }
            return parseFor(node, `init`);
        }
        
        let refShorthandDefaultPos = ExpPos(0)
        var `init` = parseExpression(noIn: true, refShorthandDefaultPos:refShorthandDefaultPos);
        if ((matchX(getTT()._in) || isContextual("of"))) {
            let description : String
            if (isContextual("of")) {
                description = "for-of statement";
            } else {
                description = "for-in statement";
            }
            toAssignable(`init`, None, description);
            checkLVal(`init`.getOrThrow(), None, None, description);
            return parseForIn(node, `init`.getOrThrow(), forAwait);
        } else if ((refShorthandDefaultPos.start > 0)) {
            unexpected(refShorthandDefaultPos.start, Option<Any>.None);
        }
        if ((forAwait)) {
            unexpected(None, Option<Any>.None);
        }
        return parseFor(node, `init`);
    }

     func parseFunctionStatement( node: Node) : Node {
        next();
        return parseFunction(node, true, allowExpressionBody:None, isAsync:None, optionalId:None)
      }

     func parseIfStatement( node: Node) : Node {
        next();
        node.test = parseParenExpression();
        node.consequent = parseStatement(false, None);
        if (eat(getTT()._else)) {
            node.alternate = parseStatement(false, None);
        } else {
            node.alternate = Option<Node>.None;
        }
        return finishNode(node, "IfStatement");
      };

    func parseReturnStatement( node: Node) : Node {
        if ((!state.inFunction && options.allowReturnOutsideFunction.getOrThrow())) {
          raise(state.start, "'return' outside of function");
        }
        next();
        if (isLineTerminator()) {
          node.argument = Option<Node>.None;
        } else {
          node.argument = parseExpression(noIn: None, refShorthandDefaultPos: None);
          semicolon();
        }

        return finishNode(node, "ReturnStatement");
      }

    func parseSwitchStatement( node: Node) : Node {
        next();
        node.discriminant = parseParenExpression();
        node.cases = ArrayList<Node>()
        expect(getTT().braceL, pos:None);
        state.labels.getOrThrow().add(Label.switchLabel);

        var cur: ?Node = Option<Node>.None;
        var sawDefault: Bool = false
        while (!matchX(getTT().braceR)) {
            if ((matchX(getTT()._case) || matchX(getTT()._default))) {
                let isCase = matchX(getTT()._case);
                if ((cur.isSome())) {
                    finishNode(cur.getOrThrow(), "SwitchCase");
                }
                cur = startNode()
                node.cases.getOrThrow().add(cur.getOrThrow());
                cur.getOrThrow().consequent = ArrayList<Node>();
                next();
                if ((isCase)) {
                    cur.getOrThrow().test = parseExpression();
                } else {
                    if ((sawDefault)) {
                         raise(state.lastTokStart, "Multiple default clauses");
                    }
                    sawDefault = true;
                    cur.getOrThrow().test = Option<Node>.None;
                }
                expect(getTT().colon);
            } else {
                if (cur.isSome()) {
                    var arr: ArrayList<Node> = ArrayList<Node>([])
                    arr.add(parseStatement(true, Option<Bool>.None))
                    var arr1 = (cur.getOrThrow().consequent.getOrThrow() as ArrayList<Node>).getOrThrow()
                    arr1.add(all: arr)
                    cur.getOrThrow().consequent = arr1
                } else {
                    unexpected(None, Option<Any>.None);
                }
            }
        }
        
        if ((cur.isSome())) {
            finishNode(cur.getOrThrow(), "SwitchCase");
        }
        next(); // Closing brace
        state.labels.getOrThrow().popLast();
        return finishNode(node, "SwitchStatement");
    }

    func parseThrowStatement( node: Node) : Node {
        next();
        if (lineBreak.matcher(input.slice(state.lastTokEnd, state.start)).matchStart().isSome()) {
           raise(state.lastTokEnd, "Illegal newline after throw");
        }
        node.argument = parseExpression();
        semicolon();
        return finishNode(node, "ThrowStatement");
    }

    func parseTryStatement(node: Node) : Node {
        next();
        
        node.block = parseBlock(allowDirectives: None);
        node.handler = Option<Node>.None;
        
        if ((matchX(getTT()._catch))) {
            let clause = startNode();
            next();
            
            expect(getTT().parenL, pos: None);
            clause.param = parseBindingAtom();
            checkLVal(clause.param.getOrThrow(), true, HashMap<String, Bool>(), "catch clause");
            expect(getTT().parenR, pos: None);
            
            clause.body = parseBlock(allowDirectives: None);
            node.handler = finishNode(clause, "CatchClause");
        }
        
        node.guardedHandlers = empty;
        if (eat(getTT()._finally)) {
            node.finalizer = parseBlock(allowDirectives: None);
        } else {
            node.finalizer = Option<Node>.None;
        }
        
        if ((node.handler.isNone() && node.finalizer.isNone())) {
            raise(node.start, "Missing catch or finally clause");
        }
        
        return finishNode(node, "TryStatement");
    }
    
    func parseVarStatement(node: Node,  kind: Any) : Node {
        next();
        parseVar(node, false, (kind as TokenType).getOrThrow());
        semicolon();
        return finishNode(node, "VariableDeclaration");
    }
    
    func parseWhileStatement(node: Node) : Node {

        next();
        node.test = parseParenExpression();
        state.labels.getOrThrow().add(Label.loopLabel);
        node.body = parseStatement(false, None);
        state.labels.getOrThrow().popLast()
        return finishNode(node, "WhileStatement");
    };
    
    func parseWithStatement(node: Node) : Node {
        

        if ((state.strict)) {
            raise(state.start, "'with' in strict mode");
        }
        next();
        node.object = parseParenExpression();
        node.body = parseStatement(false, None);
        return finishNode(node, "WithStatement");
    };
    
    func parseEmptyStatement(node: Node) : Node {
        next();
        return finishNode(node, "EmptyStatement");
    };
    
    func parseLabeledStatement(node: Node,  maybeName: String,  expr: Node) : Node {
        
        for (label in state.labels.getOrThrow()) {
            var name = ""
            if (let Some(label) <- (label as Label)) {
                name = label.name.getOrThrow()
            }
            if (name == maybeName) {
                raise(expr.start, "Label ${maybeName} is already declared");
            }
        }
        
        let kind : ?String 
        if (state._type.isLoop) {
            kind = "loop"
        } else {
            if (matchX(getTT()._switch)) {
                kind = "switch";
            } else {
                kind = Option<String>.None;
            }
        }
        var i = state.labels.getOrThrow().size - 1
        while (i >= 0) {
            let label = state.labels.getOrThrow()[i]
            if (((label as Node).getOrThrow().statementStart == node.start)) {
                (label as Node).getOrThrow().setStatementStart(state.start)
                (label as Node).getOrThrow().setKind(kind)
            } else {
                break
            }
            i -= 1
        }
        
        
        let lab = Label.`init`(kind.getOrThrow(), maybeName, state.start)
        state.labels.getOrThrow().add(lab);
        node.body = parseStatement(true, None);
        state.labels.getOrThrow().popLast();
        node.label = expr;
        return finishNode(node, "LabeledStatement");
    }
    
    open public func parseExpressionStatement( node: Node,  expr: Node) : Node {
        node.expression = expr;
        semicolon();
        return finishNode(node, "ExpressionStatement");
    };
    
    func parseBlock( allowDirectives!: ?Bool = Option<Bool>.None) : Node {
        let node = startNode();
        expect(getTT().braceL);
        parseBlockBody(node, allowDirectives, false, getTT().braceR);
        return finishNode(node, "BlockStatement");
    };
    
    open public func isValidDirective( stmt: Node) : Bool {
        return stmt._type == "ExpressionStatement" &&
        (stmt.expression.getOrThrow() as Node).getOrThrow()._type == "StringLiteral" &&
        (!(stmt.expression.getOrThrow() as Node).getOrThrow().extra.getOrThrow().contains("parenthesized"))
    }
    
    open public func parseBlockBody( node: Node,  allowDirectives: ?Bool,  topLevel: Bool,  end: TokenType) {
        node.body = ArrayList<Node>()
        node.directives = ArrayList<Node>()
        
        var parsedNonDirective = false;
        var oldStrict: ?Bool = Option<Bool>.None
        var octalPosition: Int64 = 0;
        while (!eat(end)) {
            if ((!parsedNonDirective && state.containsOctal && (octalPosition == 0))) {
                octalPosition = state.octalPosition.getOrThrow();
            }
            let stmt = parseStatement(true, topLevel);
            if ((allowDirectives.isSome() && allowDirectives.getOrThrow() == true && !parsedNonDirective && isValidDirective(stmt))) {
                let directive = stmtToDirective(stmt);
                node.directives.getOrThrow().add(directive);
                
                if ((oldStrict.isNone() && ((directive.value.getOrThrow() as Node).getOrThrow().value ?? "") as String == "use strict")) {
                    oldStrict = state.strict;
                    setStrict(true);
                    
                    if ((octalPosition == 0)) {
                        raise(Int64(octalPosition), "Octal literal in strict mode");
                    }
                }
                
                continue;
            }
            parsedNonDirective = true;
            var arr = (node.body.getOrThrow() as ArrayList<Node>).getOrThrow()
            arr.add(stmt)
            node.body = arr
        }
        if ((oldStrict == false)) {
            setStrict(false);
        }
    }
    
    func parseFor( node: Node,  `init`: ?Node) : Node {
        node.`init` = `init`;
        expect(getTT().semi);
        if (matchX(getTT().semi)) {
            node.test = Option<Node>.None;
        } else {
            node.test = parseExpression();
        }
        expect(getTT().semi);
        if (matchX(getTT().parenR)) {
            node.update = Option<Node>.None;
        } else {
            node.update = parseExpression();
        }
        expect(getTT().parenR);
        node.body = parseStatement(false, Option<Bool>.None);
        state.labels.getOrThrow().popLast()
        return finishNode(node, "ForStatement");
    }
    
    func parseForIn( node: Node,  `init`: Node,  forAwait: Bool) : Node {
        let _type : String
        if (matchX(getTT()._in)) {
            _type = "ForInStatement";
        } else {
            _type = "ForOfStatement";
        }
        if ((forAwait)) {
            eatContextual("of");
        } else {
            next();
        }
        node.await = !(!forAwait);
        node.left = `init`;
        node.right = parseExpression();
        expect(getTT().parenR);
        node.body = parseStatement(false, Option<Bool>.None);
        state.labels.getOrThrow().popLast();
        return finishNode(node, _type);
    }
    
    func parseVar( node: Node,  isFor: Bool,  kind: TokenType) : Node {
        node.declarations = ArrayList<Node>();
        node.kind = kind.keyword;
        while (true) {
            let decl = startNode();
            parseVarHead(decl);
            if ((eat(getTT().eq))) {
                decl.`init` =  parseMaybeAssign(isFor, Option<ExpPos>.None, Option<((Parser, Node, Int64, Position0) -> Node)>.None, Option<ExpPos>.None);
            } else if ((refEq(kind, getTT()._let) && !(matchX(getTT()._in) || isContextual("of")))) {
                unexpected(None, Option<Any>.None);
            } else if ((decl.id.getOrThrow()._type != "Identifier" && !(isFor && (matchX(getTT()._in) || isContextual("of"))))) {
                raise(state.lastTokEnd, "Complex binding patterns require an initialization value");
            } else {
                decl.`init` = Option<Node>.None;
            }
            node.declarations.getOrThrow().add(finishNode(decl, "VariableDeclarator"));
            if ((!eat(getTT().comma))) {
                break;
            }
        }
        return node;
    }
    
    public open func parseVarHead( decl: Node) {
        decl.id = parseBindingAtom();
        checkLVal(decl.id.getOrThrow(), true, None, "variable declaration");
    }
    
    func parseFunction( node: Node,  isStatement: Bool,  allowExpressionBody!: ?Bool = Option<Bool>.None,  isAsync!: ?Bool = Option<Bool>.None,  optionalId!: ?Bool = Option<Bool>.None) : Node {
        let oldInMethod = state.inMethod;
        state.inMethod = false;
        
        initFunction(node, isAsync);
        
        if ((matchX(getTT().star))) {
            if ((node.async.getOrThrow() && !hasPlugin("asyncGenerators"))) {
                unexpected(None, Option<Any>.None);
            } else {
                node.generator = true;
                next();
            }
        }
        
        var optionalIdBool : Bool 
        if (optionalId.isNone()) {
            optionalIdBool = true
        } else {
            optionalIdBool = !optionalId.getOrThrow()
        }
        if ((isStatement && optionalIdBool && !matchX(getTT().name) && !matchX(getTT()._yield))) {
            unexpected(None, Option<Any>.None);
        }
        
        if ((matchX(getTT().name) || matchX(getTT()._yield))) {
            node.id = parseBindingIdentifier();
        }
        
        parseFunctionParams(node);
        parseFunctionBody(node, allowExpressionBody);
        
        state.inMethod = oldInMethod;
        
        if (isStatement) {
            return finishNode(node, "FunctionDeclaration");
        } else {
            return finishNode(node, "FunctionExpression");
        }
    }
    
    open public func parseFunctionParams( node: Node) {
        expect(getTT().parenL);
        node.params = parseBindingList(getTT().parenR);
    }
    
    func parseClass( node: Node,  isStatement: Bool,  optionalId!: ?Bool = Option<Bool>.None) : Node {
        next();
        takeDecorators(node);
        parseClassId(node, isStatement, optionalId);
        parseClassSuper(node, None);
        parseClassBody(node);
        
        if (isStatement) {
            return finishNode(node, "ClassDeclaration");
        } else {
            return finishNode(node, "ClassExpression");
        }
    }
    
    open public func isClassProperty() : Bool {
        return matchX(getTT().eq) || matchX(getTT().semi) || matchX(getTT().braceR);
    }
    
    open public func isClassMethod() : Bool {
        return matchX(getTT().parenL);
    }
    
    func isNonstaticConstructor( method: Node) : Bool {
        return !method.computed.getOrThrow() && !method.`static`.getOrThrow() && (
            ((method.key.getOrThrow().name ?? "") as String == "constructor") || // Identifier
            ((method.key.getOrThrow().value ?? "") as String == "constructor")   // Literal
        );
    }
    
    func parseClassBody( node: Node) {
        // class bodies are implicitly strict
        let oldStrict = state.strict;
        state.strict = true;
        
        var hadConstructor = false;
        var decorators: ArrayList<Node> = ArrayList<Node>([]);
        var classBody = startNode();
        
        classBody.body = ArrayList<Node>();
        
        expect(getTT().braceL, pos: None);
        
        while ((!eat(getTT().braceR))) {
            if (eat(getTT().semi)) {
                if ((decorators.size > 0)) {
                    raise(state.lastTokEnd, "Decorators must not be followed by a semicolon");
                }
                continue;
            }
            
            if (matchX(getTT().at)) {
                decorators.add(parseDecorator());
                continue;
            }
            
            let method = startNode();
            
            if ((decorators.size != 0)) {
                method.decorators = decorators;
                decorators = ArrayList<Node>();
            }
            
            method.`static` = false;
            if ((matchX(getTT().name) && (state.value ?? "") as String == "static")) {
                let key = parseIdentifier(true); // eats 'static'
                if (isClassMethod()) {
                    // a method named 'static'
                    method.kind = "method";
                    method.computed = false;
                    method.key = key;
                    parseClassMethod(classBody, method, false, false);
                    continue;
                } else if ((isClassProperty())) {
                    // a property named 'static'
                    method.computed = false;
                    method.key = key;
                    var arr = (classBody.body.getOrThrow() as ArrayList<Node>).getOrThrow()
                    arr.add(parseClassProperty(method))
                    classBody.body = arr
                    
                    continue;
                }
                method.`static` = true;
            }
            
            if ((eat(getTT().star))) {
                method.kind = "method";
                parsePropertyName(method);
                if ((isNonstaticConstructor(method))) {
                    raise(method.key.getOrThrow().start, "Constructor can't be a generator");
                }
                if ((!method.computed.getOrThrow() && method.`static`.getOrThrow() && ((method.key.getOrThrow().name ?? "") as String == "prototype" || (method.key.getOrThrow().value ?? "") as String == "prototype"))) {
                    raise(method.key.getOrThrow().start, "Classes may not have static property named prototype");
                }
                parseClassMethod(classBody, method, true, false);
            } else {
                let isSimple = matchX(getTT().name);
                let key = parsePropertyName(method);
                if ((!method.computed.getOrThrow() && method.`static`.getOrThrow() && (((method.key.getOrThrow().name ?? "")) as String == "prototype" || (method.key.getOrThrow().value ?? "") as String == "prototype"))) {
                    raise(method.key.getOrThrow().start, "Classes may not have static property named prototype");
                }
                if ((isClassMethod())) {
                    if ((isNonstaticConstructor(method))) {
                        if ((hadConstructor)) {
                            raise(key.getOrThrow().start, "Duplicate constructor in the same class");
                        } else if ((method.decorators.isSome())) {
                            raise(method.start, "You can't attach decorators to a class constructor");
                        }
                        hadConstructor = true;
                        method.kind = "constructor";
                    } else {
                        method.kind = "method";
                    }
                    parseClassMethod(classBody, method, false, false);
                } else if ((isClassProperty())) {
                    if ((isNonstaticConstructor(method))) {
                        raise(method.key.getOrThrow().start, "Classes may not have a non-static field named 'constructor'");
                    }
                    var arr = (classBody.body.getOrThrow() as ArrayList<Node>).getOrThrow()
                    arr.add(parseClassProperty(method))
                    classBody.body = arr
                } else if ((isSimple && (key.getOrThrow().name ?? "") as String == "async" && !isLineTerminator())) {
                    // an async method
                    let isGenerator = hasPlugin("asyncGenerators") && eat(getTT().star);
                    method.kind = "method";
                    parsePropertyName(method);
                    if ((isNonstaticConstructor(method))) {
                        raise(method.key.getOrThrow().start, "Constructor can't be an async function");
                    }
                    parseClassMethod(classBody, method, isGenerator, true);
                } else if ((isSimple && ((key.getOrThrow().name ?? "") as String == "get" || (key.getOrThrow().name ?? "") as String == "set") && !(isLineTerminator() && matchX(getTT().star)))) { // `get\n*` is an uninitialized property named 'get' followed by a generator.
                    // a getter or setter
                    method.kind = ((key.getOrThrow().name ?? "") as String);
                    parsePropertyName(method);
                    if ((isNonstaticConstructor(method))) {
                        raise(method.key.getOrThrow().start, "Constructor can't have get/set modifier");
                    }
                    parseClassMethod(classBody, method, false, false);
                    checkGetterSetterParamCount(method);
                } else if ((isLineTerminator())) {
                    if ((isNonstaticConstructor(method))) {
                        raise(method.key.getOrThrow().start, "Classes may not have a non-static field named 'constructor'");
                    }
                    var arr = (classBody.body.getOrThrow() as ArrayList<Node>).getOrThrow()
                    arr.add(parseClassProperty(method))
                    classBody.body = arr                    
                } else {
                    unexpected(None, Option<Any>.None);
                }
            }
        }
        
        if ((decorators.size) != 0) {
            raise(state.start, "You have trailing decorators with no method");
        }
        
        node.body = finishNode(classBody, "ClassBody");
        
        state.strict = oldStrict;
    }
    
    open public func parseClassProperty( node: Node) : Node {
        let noPluginMsg = "You can only use Class Properties when the 'classProperties' plugin is enabled.";
        if ((node.typeAnnotation.isNone() && !hasPlugin("classProperties"))) {
            raise(node.start, noPluginMsg);
        }
        
        if (matchX(getTT().eq)) {
            if ((!hasPlugin("classProperties"))) {
                raise(state.start, noPluginMsg);
            }
            next();
            node.value = match(parseMaybeAssign(Option<Bool>.None, Option<ExpPos>.None, Option<((Parser, Node, Int64, Position0) -> Node)>.None, Option<ExpPos>.None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
        } else {
            node.value = Option<Any>.None;
        }
        semicolon();
        return finishNode(node, "ClassProperty");
    }
    
    open public func parseClassMethod( classBody: Node,  method: Node,  isGenerator: Bool,  isAsync: Bool) {
        parseMethod(method, isGenerator, isAsync);
        var arr = (classBody.body.getOrThrow() as ArrayList<Node>).getOrThrow()
        arr.add(finishNode(method, "ClassMethod"))
        classBody.body = arr
    }
    
    open public func parseClassId( node: Node,  isStatement: Bool,  optionalId: ?Bool) {
        if ((matchX(getTT().name))) {
            node.id = parseIdentifier(Option<Bool>.None);
        } else {
            if ((optionalId.getOrThrow() || !isStatement)) {
                node.id = Option<Node>.None;
            } else {
                unexpected(None, Option<Any>.None);
            }
        }
    }
    
    open public func parseClassSuper( node: Node,  isStatement: ?Bool) {
        if (eat(getTT()._extends)) {
            node.superClass = parseExprSubscripts();
        } else {
            node.superClass = Option<Node>.None;
        }
    }
    // Parses module export declaration.
    
    open public func parseExport( node: Node) : Node {
        next();
        // export * from '...'
        if ((matchX(getTT().star))) {
            let specifier = startNode();
            next();
            if ((hasPlugin("exportExtensions") && eatContextual("as"))) {
                specifier.exported = parseIdentifier(Option<Bool>.None);
                node.specifiers = ArrayList<Node>([finishNode(specifier, "ExportNamespaceSpecifier")]);
                parseExportSpecifiersMaybe(node);
                parseExportFrom(node, expect: true);
            } else {
                parseExportFrom(node, expect: true);
                return finishNode(node, "ExportAllDeclaration");
            }
        } else if ((hasPlugin("exportExtensions") && isExportDefaultSpecifier())) {
            var specifier = startNode();
            specifier.exported = parseIdentifier(true);
            node.specifiers = ArrayList<Node>([finishNode(specifier, "ExportDefaultSpecifier")]);
            if ((matchX(getTT().comma) && refEq(lookahead()._type, getTT().star))) {
                expect(getTT().comma, pos: None);
                let specifier = startNode();
                expect(getTT().star, pos: None);
                expectContextual("as");
                specifier.exported = parseIdentifier(None);
                node.specifiers.getOrThrow().add(finishNode(specifier, "ExportNamespaceSpecifier"));
            } else {
                parseExportSpecifiersMaybe(node);
            }
            parseExportFrom(node, expect: true);
        } else if ((eat(getTT()._default))) { // export default ...
            var expr = startNode();
            var needsSemi = false;
            if ((eat(getTT()._function))) {
                expr = parseFunction(expr, true, allowExpressionBody:false, isAsync:false, optionalId:true);
            } else if (
                isContextual("async") &&
                refEq(lookahead()._type, getTT()._function)
            ) { // async function declaration
                eatContextual("async");
                eat(getTT()._function);
                expr = parseFunction(expr, true, allowExpressionBody:false, isAsync:true, optionalId:true);
            } else if ((matchX(getTT()._class))) {
                expr = parseClass(expr, true, optionalId: true);
            } else {
                needsSemi = true;
                expr = parseMaybeAssign( None, None, None, None).getOrThrow();
            }
            node.declaration = expr;
            if ((needsSemi)) {
                semicolon();
            }
            checkExport(node, checkNames: true, isDefault: true);
            return finishNode(node, "ExportDefaultDeclaration");
        } else if ((shouldParseExportDeclaration())) {
            node.specifiers = ArrayList<Node>();
            node.source = Option<Any>.None;
            node.declaration = parseExportDeclaration(Option<Node>.None);
        } else { // export { x, y as z } [from '...']
            node.declaration = Option<Node>.None;
            node.specifiers = parseExportSpecifiers();
            parseExportFrom(node, expect: None);
        }
        checkExport(node, checkNames: true, isDefault: None);
        return finishNode(node, "ExportNamedDeclaration");
    }
    
    open public func parseExportDeclaration( node: ?Node) : ?Node {
        return parseStatement(true, None);
    }
    
    func isExportDefaultSpecifier() : Bool {
        if ((matchX(getTT().name))) {
            return (state.value.getOrThrow() as String).getOrThrow() != "type" && (state.value.getOrThrow() as String).getOrThrow() != "async" && (state.value.getOrThrow() as String).getOrThrow() != "interface";
        }
        
        if ((!matchX(getTT()._default))) {
            return false;
        }
        
        let lookahead = lookahead();
        return refEq(lookahead._type, getTT().comma) || (refEq(lookahead._type, getTT().name) && (lookahead.value ?? "") as String == "from");
    }
    
    func parseExportSpecifiersMaybe( node: Node) {
        if ((eat(getTT().comma))) {
            node.specifiers.getOrThrow().add(all: parseExportSpecifiers())
        }
    }
    
    func parseExportFrom( node: Node,  expect!: ?Bool = Option<Bool>.None) {
        if ((eatContextual("from"))) {
            if (matchX(getTT().string)) {
                node.source = match(parseExprAtom(None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
            } else {
                node.source = unexpected(None, Option<Any>.None);
            }
            checkExport(node, checkNames: None, isDefault: None);
        } else {
            if ((expect.getOrThrow())) {
                unexpected(None, Option<Any>.None);
            } else {
                node.source = Option<Any>.None;
            }
        }
        
        semicolon();
    }
    
    open public func shouldParseExportDeclaration() : Bool {
        return state._type.keyword == "var" || state._type.keyword == "const" || state._type.keyword == "let" || state._type.keyword == "function" || state._type.keyword == "class" || isContextual("async");
    }
    
    func checkExport( node: Node,  checkNames!: ?Bool = Option<Bool>.None,  isDefault!: ?Bool = Option<Bool>.None) {
        if ((checkNames.getOrThrow())) {
            // Check for duplicate exports
            var isDefaultBool : Bool
            if (isDefault.isSome()) {
                isDefaultBool = isDefault.getOrThrow()
            } else {
                isDefaultBool = false
            }
            if ((isDefaultBool)) {
                checkDuplicateExports(node, "default");
            } else if (((node.specifiers.isSome()) && node.specifiers.getOrThrow().size > 0)) {
                for (specifier in node.specifiers.getOrThrow()) {
                    checkDuplicateExports(specifier, (specifier.exported.getOrThrow().name.getOrThrow() as String).getOrThrow());
                }
            } else if (((node.declaration).isSome())) {
                if (node.declaration.getOrThrow()._type == "FunctionDeclaration" ||
                    node.declaration.getOrThrow()._type == "ClassDeclaration") {
                    checkDuplicateExports(node, (node.declaration.getOrThrow().id.getOrThrow().name.getOrThrow() as String).getOrThrow());
                } else if ((node.declaration.getOrThrow()._type == "VariableDeclaration")) {
                    for (declaration in node.declaration.getOrThrow().declarations.getOrThrow()) {
                        checkDeclaration(declaration.id.getOrThrow());
                    }
                }
            }
        }
        
        if ((state.decorators.getOrThrow().size > 0)) {
            let isClass = (node.declaration.isSome()) && (node.declaration.getOrThrow()._type == "ClassDeclaration" || node.declaration.getOrThrow()._type == "ClassExpression");
            if (((node.declaration.isNone()) || !isClass)) {
               raise(node.start, "You can only use decorators on an export when exporting a class");
            }
            takeDecorators(node.declaration.getOrThrow());
        }
    }
    
    open public func checkDeclaration( node: Node): Unit {
        if ((node._type == "ObjectPattern")) {
            for (_prop in node.properties.getOrThrow()) {
                checkDeclaration(_prop);
            }
        } else if ((node._type == "ArrayPattern")) {
            for (elem00 in node.elements.getOrThrow()) {
                var elem: ?Node = elem00
                if (elem.isSome()) {
                    checkDeclaration(elem.getOrThrow())
                }
            }
        } else if ((node._type == "ObjectProperty")) {
            checkDeclaration((node.value.getOrThrow() as Node).getOrThrow());
        } else if ((node._type == "RestElement")) {
            checkDeclaration(node.argument.getOrThrow());
        } else if ((node._type == "Identifier")) {
            checkDuplicateExports(node, (node.name.getOrThrow() as String).getOrThrow());
        }
    }
    
    func checkDuplicateExports(node: Node, name: String) {

        let index = state.exportedIdentifiers.getOrThrow().firstIndex(name)
        
        if (index.isSome()) {
            if (index.getOrThrow() > -1) {
                raiseDuplicateExportError(node, name);
            }
        }
        state.exportedIdentifiers.getOrThrow().add(name);
    }
    
    func raiseDuplicateExportError( node: Node,  name: String) {
        let message : String
        if (name == "default") {
            message = "Only one default export allowed per module."
        } else {
            message = "${name} has already been exported. Exported identifiers must be unique."
        }
        raise(node.start, message)
    }
 
    func parseExportSpecifiers() : ArrayList<Node> {
        var nodes: ArrayList<Node> = ArrayList<Node>([])
        var first = true
        var needsFrom: ?Bool = Option<Bool>.None
        
        expect(getTT().braceL);
        
        while ((!eat(getTT().braceR))) {
            if (first) {
                first = false;
            } else {
                expect(getTT().comma, pos: None);
                if ((eat(getTT().braceR))) {
                    break;
                }
            }
            
            let isDefault = matchX(getTT()._default);
            if (isDefault && !needsFrom.getOrThrow()) {
                needsFrom = true
            }
            let node = startNode();
            node.local = parseIdentifier(isDefault);
            
            if (eatContextual("as")) {
                node.exported = parseIdentifier(true);
            } else {
                node.exported = node.local.getOrThrow().clone();
            }
            nodes.add(finishNode(node, "ExportSpecifier"));
        }
        
        if ((needsFrom.isSome() && needsFrom.getOrThrow() && !isContextual("from"))) {
            unexpected(None, Option<Any>.None);
        }
        
        return nodes;
    }
    
    func parseImport( node: Node) : Node {
        eat(getTT()._import);
        
        if (matchX(getTT().string)) {
            node.specifiers = ArrayList<Node>();
            node.source = match(parseExprAtom(None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
        } else {
            node.specifiers = ArrayList<Node>();
            parseImportSpecifiers(node);
            expectContextual("from", message: None);
            if (matchX(getTT().string)) {
                node.source = match(parseExprAtom(None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
            } else {
                node.source = unexpected(None, Option<Any>.None);
            }
        }
        semicolon();
        return finishNode(node, "ImportDeclaration");
    }
    
    open public func parseImportSpecifiers( node: Node) {
        var first = true;
        if (matchX(getTT().name)) {
            let startPos = state.start;
            let startLoc = state.startLoc;
            node.specifiers.getOrThrow().add(parseImportSpecifierDefault(parseIdentifier(Option<Bool>.None), startPos, startLoc.getOrThrow()));
            if ((!eat(getTT().comma))) {
                return;
            }
        }
        
        if ((matchX(getTT().star))) {
            var specifier = startNode();
            next();
            expectContextual("as", message: None);
            specifier.local = parseIdentifier(None);
            checkLVal(specifier.local.getOrThrow(), true, None, "import namespace specifier");
            node.specifiers.getOrThrow().add(finishNode(specifier, "ImportNamespaceSpecifier"));
            return;
        }
        
        expect(getTT().braceL);
        while (!eat(getTT().braceR)) {
            if (first) {
                first = false;
            } else {
                if (eat(getTT().colon)) {
                    unexpected(None, "ES2015 named imports do not destructure. Use another statement for destructuring after the import.");
                }
                
                expect(getTT().comma, pos: None);
                if (eat(getTT().braceR)) {
                    break;
                }
            }
            
            parseImportSpecifier(node);
        }
    }
    
    open public func parseImportSpecifier( node: Node) {
        var specifier = startNode();
        specifier.imported = parseIdentifier(true);
        if ((eatContextual("as"))) {
            specifier.local = parseIdentifier(None);
        } else {
            checkReservedWord((specifier.imported.getOrThrow().name.getOrThrow() as String).getOrThrow(), specifier.start, true, true);
            specifier.local = specifier.imported.getOrThrow().clone();
        }
        checkLVal(specifier.local.getOrThrow(), true, None, "import specifier");
        node.specifiers.getOrThrow().add(finishNode(specifier, "ImportSpecifier"));
    }
    
    func parseImportSpecifierDefault( id: Node,  startPos: Int64,  startLoc: Position0) : Node {
        var node = startNodeAt(startPos, startLoc);
        node.local = id;
        checkLVal(node.local.getOrThrow(), true, None, "default import specifier");
        return finishNode(node, "ImportDefaultSpecifier");
    }
    
    
}

func numberValue( of: String) : Int64 {
  if ((of <= "F" && of >= "A")) {
      return Int64(of[0] - 55)
  }
  if(of <= "f" && of >= "a") {
    return Int64(of[0] - 87)
  }
  return Int64(of[0] - 48)
}

func parseInt1( str: String,  redix: Int64) : Int64 {   
    if (str.size == 1) {
        return numberValue(str[str.size - 1].toString())
    } else {
        return parseInt1(str.slice(0, str.size - 2), redix) * redix + numberValue(str[str.size - 1].toString())
    }
}

func isSimpleProperty( node: ?Node) : Bool {
  return node.isSome() &&
    node.getOrThrow()._type == "Property" &&
    node.getOrThrow().kind == "init" &&
    node.getOrThrow().method == false;
}

public open class ESTreeParser <: Parser {
    init(options: ParserOptions, input: String) {
        super(options, input)
    }

    func estreeParseRegExpLiteral( config: RegConfig) : Node {
       let pattern = config.pattern
       let flags = config.flags
       var regex: ?RegConfig = Option<RegConfig>.None;
        try {
         regex = RegConfig(pattern, flags);
        } catch (e: Exception) {
            
        }
        let node = estreeParseLiteral(config);
       node.regex = config
       return node;
     }

    func estreeParseLiteral( value: ?Any) : Node { // any string | number | RegConfig | boolean | null
       return parseLiteral(value, "Literal", Option<Int64>.None, Option<Position0>.None);
     }

    func directiveToStmt( directive: Node) : Node {
        let directiveLiteral = (directive.value.getOrThrow() as Node).getOrThrow()

        let stmt = startNodeAt(directive.start, directive.loc.start);
        let expression = startNodeAt(directiveLiteral.start, directiveLiteral.loc.start);

       expression.value = directiveLiteral.value;
        expression.raw = directiveLiteral.extra.getOrThrow()["raw"] as String;

        stmt.expression = finishNodeAt(expression, "Literal", directiveLiteral.end, directiveLiteral.loc.end.getOrThrow());
        stmt.directive = (directiveLiteral.extra.getOrThrow()["raw"] as String).getOrThrow().slice(1, -1);

        return finishNodeAt(stmt, "ExpressionStatement", directive.end, directive.loc.end.getOrThrow());
     }

    open public func checkDeclaration( node: ?Node): Unit {
       if ((isSimpleProperty(node))) {
           checkDeclaration((node.getOrThrow().value.getOrThrow() as Node).getOrThrow())
       } else {
           super.checkDeclaration(node.getOrThrow())
       }
     }

    override public func checkGetterSetterParamCount( _prop: Node) {
        let paramCount : Int64
        if (_prop.kind == "get") {
            paramCount = 0
        } else {
            paramCount = 1
        }
        if (((_prop.value.getOrThrow() as Node).getOrThrow().params.getOrThrow().size != paramCount)) {
            let start = _prop.start
            if ((_prop.kind == "get")) {
            raise(start, "getter should have no params");
            } else {
            raise(start, "setter should have exactly one param");
            }
        }
     }

    open override public func checkLVal( expr: Node,  isBinding: ?Bool,  checkClashes: ?HashMap<String, Bool>,  contextDescription: String): Unit {
       match (expr._type) {
         case "ObjectPattern" =>
           for (_prop in expr.properties.getOrThrow()) {
               if (_prop._type == "Property") {
                    checkLVal(( _prop.value.getOrThrow() as Node).getOrThrow(),
                        isBinding,
                        checkClashes,
                        "object destructuring pattern"
                     );
                } else {
                    checkLVal( _prop,
                        isBinding,
                        checkClashes,
                        "object destructuring pattern"
                    );
                }
           }
           
         case _ =>
           super.checkLVal(expr, isBinding, checkClashes, contextDescription);
       }
     }

    override public func checkPropClash( _prop: Node,  propHash: Any) {
        if ((_prop.computed.getOrThrow() || !isSimpleProperty(_prop))) {
            return;
        }
     }

    override public func isStrictBody( node: Node,  isExpression: Bool) : Bool {
       if ((!isExpression && (((node.body.getOrThrow() as Node).getOrThrow().body.getOrThrow() as ArrayList<Node>).getOrThrow()).size > 0)) {
           
           for (directive in (((node.body.getOrThrow() as Node).getOrThrow().body.getOrThrow() as ArrayList<Node>).getOrThrow())) {
               if ((directive._type == "ExpressionStatement" && (directive.expression.getOrThrow() as Node).getOrThrow()._type == "Literal")) {
                   if ((((directive.expression.getOrThrow() as Node).getOrThrow().value ?? "") as String == "use strict")) {
                       return true;
                   }
               } else {
                 break;
               }
           }
       }

       return false;
     }

    override public func isValidDirective( stmt: Node) : Bool {
       return stmt._type == "ExpressionStatement" &&
         (stmt.expression.getOrThrow() as Node).getOrThrow()._type == "Literal" &&
        (stmt.expression.getOrThrow() as Node).getOrThrow().value.getOrThrow() is String &&
        ((stmt.expression.getOrThrow() as Node).getOrThrow().extra.isNone() || ((stmt.expression.getOrThrow() as Node).getOrThrow().extra.getOrThrow().contains("parenthesized")))
     };

    override public func parseBlockBody( node: Node,  allowDirectives: ?Bool,  topLevel: Bool,  end: TokenType) {
       super.parseBlockBody(node, allowDirectives, topLevel, end)

        for (directive in node.directives.getOrThrow().reversed()) {
            var arr = (node.body.getOrThrow() as ArrayList<Node>).getOrThrow()
            arr.add(this.directiveToStmt(directive), at: 0)
            node.body = arr
        }
        
       node.directives = Option<ArrayList<Node>>.None
     }

    public open override func parseClassMethod( classBody: Node,  method: Node,  isGenerator: Bool,  isAsync: Bool) {
       super.parseClassMethod(classBody, method, isGenerator, isAsync)
       let body = (classBody.body.getOrThrow() as ArrayList<Node>).getOrThrow()
       body[body.size - 1]._type = "MethodDefinition"
     }

    public open func parseExprAtom0(refShorthandDefaultPos: ?ExpPos) : Node {
       match (state._type) {
         case tt_regexp where tt_regexp == getTT().regexp =>
           return estreeParseRegExpLiteral((state.value.getOrThrow() as RegConfig).getOrThrow());
         case tt_num where tt_num == getTT().num =>
           return estreeParseLiteral(state.value);
         case tt_string where tt_string == getTT().string =>
           return estreeParseLiteral(state.value);
         case tt_null where tt_null == getTT()._null =>
           return estreeParseLiteral(None);
         case tt_true where tt_true == getTT()._true =>
           return estreeParseLiteral(true);
         case tt_false where tt_false == getTT()._false =>
           return estreeParseLiteral(false);
         case _ =>
           return super.parseExprAtom(refShorthandDefaultPos).getOrThrow();
       }
     }

    override public func parseLiteral( value: ?Any,  _type: String,  startPos: ?Int64,  startLoc: ?Position0) : Node {
        let node = super.parseLiteral(value, _type, startPos, startLoc)
        node.raw = (node.extra.getOrThrow()["raw"] as String).getOrThrow()
        node.extra = Option<HashMap<String,ExtraValue>>.None
        return node
    }

    override public func parseMethod( node: Node,  isGenerator: ?Bool,  isAsync: ?Bool) : Node {
        var funcNode = startNode();
       funcNode.kind = node.kind; // provide kind, so inner method correctly sets state
       funcNode = super.parseMethod(node, isGenerator, isAsync)
       funcNode.kind = Option<String>.None
       node.value = finishNode(funcNode, "FunctionExpression");

       return node;
     }

    override public func parseObjectMethod( _prop: Node,  isGenerator: Bool,  isAsync: Bool,  isPattern: Bool) : ?Node {
       let node = super.parseObjectMethod(_prop, isGenerator, isAsync, isPattern)
        if ((node).isSome()) {
            if ((node.getOrThrow().kind == "method")) {
                node.getOrThrow().kind = "init";
           }
            node.getOrThrow()._type = "Property";
       }
        return node;
     }

    func parseObjectProperty( _prop: Node,  startPos: ?Int64,  startLoc: Position0,  isPattern: Bool,  refShorthandDefaultPos: ExpPos) : Node {
       let node = super.parseObjectProperty(_prop, startPos, startLoc, isPattern, refShorthandDefaultPos)
        if ((node).isSome()) {
         node.getOrThrow().kind = "init";
         node.getOrThrow()._type = "Property";
       }
       return node.getOrThrow()
     }

    open public func toAssignable( node: Node,  isBinding: ?Bool,  contextDescription: String) : Node {
       if (isSimpleProperty(node)) {
         toAssignable((node.value.getOrThrow() as Node).getOrThrow(), isBinding, contextDescription);

         return node;
       } else if ((node._type == "ObjectExpression")) {
         node._type = "ObjectPattern";
         for (_prop in node.properties.getOrThrow()) {
           if ((_prop.kind == "get" || _prop.kind == "set")) {
               raise(_prop.key.getOrThrow().start, "Object pattern can't contain getter or setter");
           } else if ((_prop.method.getOrThrow())) {
               raise(_prop.key.getOrThrow().start, "Object pattern can't contain methods");
           } else {
               toAssignable(_prop, isBinding, "object destructuring pattern");
           }
         }

         return node;
       }
        return super.toAssignable(node, isBinding, contextDescription).getOrThrow()
     }
    
}

public open class JSXParser <: ESTreeParser {
    init(options: ParserOptions, input: String) {
        super(options, input)
    }

    open public func jsxReadToken() {
        var out = "";
        var chunkStart = state.pos;
        while (true) {
            if ((state.pos >= input.size)) {
               raise(state.start, "Unterminated JSX contents");
            }
            
            var ch = input[state.pos+1]
            
            match (ch) {
            case 60 => // "<" // "{"
                
                if ((state.pos == state.start)) {
                    if ((ch == 60 && state.exprAllowed)) {
                        state.pos += 1
                        return finishToken(getTT().jsxTagStart.getOrThrow(), val: Option<Any>.None);
                    }
                    return getTokenFromCode(Int64(ch));
                }
                out += input.slice(chunkStart, state.pos);
                return finishToken(getTT().jsxText.getOrThrow(), val: out);
            case 123 => // "<" // "{"
                
                if ((state.pos == state.start)) {
                    if ((ch == 60 && state.exprAllowed)) {
                        state.pos += 1
                        return finishToken(getTT().jsxTagStart.getOrThrow(), val: Option<Any>.None);
                    }
                    return getTokenFromCode(Int64(ch));
                }
                out += input.slice(chunkStart, state.pos);
                return finishToken(getTT().jsxText.getOrThrow(), val: out);

            case 38 => // "&"
                out += input.slice(chunkStart, state.pos);
                out += jsxReadEntity();
                chunkStart = state.pos;
                
            case _ =>
                if ((isNewLine(Int64(ch)))) {
                    out += input.slice(chunkStart, state.pos);
                    out += jsxReadNewLine(true);
                    chunkStart = state.pos;
                } else {
                    state.pos += 1
                }
            }
        }
    }
    
    func jsxReadNewLine(normalizeCRLF: Bool): String {
        let ch = Int64(input[state.pos+1])
        let out: String;
        state.pos += 1
        if ((ch == INT_VAL_P_13 && Int64(input[state.pos+1]) == INT_VAL_P_10)) {
            state.pos += 1
            if (normalizeCRLF) {
                out = "\n";
            } else {
                out = "\r\n";
            }
        } else {
            out = codePointToString(ch)
        }
        state.curLine += 1
        state.lineStart = state.pos;
        
        return out;
    }
    
    func jsxReadString(`quote`: Int64) {
        var out = "";
        state.pos += 1
        var chunkStart = state.pos
        while (true) {
            if ((state.pos >= input.size)) {
               raise(state.start, "Unterminated string constant");
            }
            
            let ch = Int64(input[state.pos+1])
            if (ch == Int64(`quote`)) {
                break;
            }
            if ((ch == 38)) { // "&"
                out += input.slice(chunkStart, state.pos);
                out += jsxReadEntity();
                chunkStart = state.pos;
            } else if ((isNewLine(ch))) {
                out += input.slice(chunkStart, state.pos);
                out += jsxReadNewLine(false);
                chunkStart = state.pos;
            } else {
                state.pos += 1
            }
        }
        state.pos += 1
        out += input.slice(chunkStart, state.pos);
        return finishToken(getTT().string, val: out);
    }
    func jsxReadEntity() : String {
        var str = "";
        var count = 0;
        var entity: ?String = Option<String>.None
        var ch = input[state.pos]
        state.pos += 1
        let startPos = state.pos
        while ((state.pos < input.size && count < INT_VAL_P_10)) {
            count += 1
            state.pos += 1
            ch = input[state.pos]
            if (ch == UInt8(UInt32(r';'))) {
                if ((str[0] == UInt8(UInt32(r'#')))) {
                    if (str[1] == UInt8(UInt32(r'x'))) {
                        str = str[0..INT_VAL_P_2]
                        if (HEX_NUMBER.matcher(str).matchStart().isSome()) {
                            entity = String(Rune(parseInt1(str, INT_VAL_P_16)))
                        }
                    } else {
                        str = str[0..1]
                        if (DECIMAL_NUMBER.matcher(str).matchStart().isSome()) {
                            entity = String(Rune(parseInt1(str, INT_VAL_P_10)))
                        }
                    }
                } else {
                    entity = XHTMLEntities.getRawValue(str)
                }
                break;
            }
            str += String(Rune(ch))
        }
        if ((entity.isSome())) {
            state.pos = startPos
            return "&"
        }
        return entity ?? ""
    }
    func jsxReadWord() {
        var ch: Int64
        let start = state.pos
        do {
            state.pos += 1
            ch = Int64(input[state.pos+1])
        } while (isIdentifierChar(Int64(ch)) || ch == INT_VAL_P_45); // "-"
        
        return finishToken(getTT().jsxName.getOrThrow(), val: input.slice(start, state.pos));
    }
    func jsxParseIdentifier() : Node {
        let node = startNode();
        if ((matchX(getTT().jsxName.getOrThrow()))) {
            node.name = ((state.value ?? "") as String).getOrThrow();
        } else if ((state._type.keyword.isSome())) {
            node.name = state._type.keyword.getOrThrow()
        } else {
            unexpected(None, Option<Any>.None)
        }
        next();
        return finishNode(node, "JSXIdentifier")
    }
    func jsxParseNamespacedName() : Node {
        let startPos = state.start;
        let startLoc = state.startLoc;
        let name = jsxParseIdentifier();
        if ((!eat(getTT().colon))) {
            return name;
        }
        let node = startNodeAt(startPos, startLoc.getOrThrow());
        node.namespace = name;
        node.name = jsxParseIdentifier();
        return finishNode(node, "JSXNamespacedName");
    }
    func jsxParseElementName() : Node {
        let startPos = state.start;
        let startLoc = state.startLoc;
        var node = jsxParseNamespacedName();
        while ((eat(getTT().dot))) {
            let newNode = startNodeAt(startPos, startLoc.getOrThrow());
            newNode.object = node;
            newNode.property = jsxParseIdentifier();
            node = finishNode(newNode, "JSXMemberExpression");
        }
        return node;
    }
    func jsxParseAttributeValue() : Node {
        var node: Node;
        match (state._type) {
        case tt_braceL where tt_braceL == getTT().braceL =>
            node = jsxParseExpressionContainer();
            if ((((node.expression.getOrThrow() as Node)).getOrThrow()._type == "JSXEmptyExpression")) {
                raise(node.start, "JSX attributes must only be assigned a non-empty expression");
            } else {
                return node;
            }
            
        case tt_jsxTagStart where tt_jsxTagStart == getTT().jsxTagStart.getOrThrow() => 
            node = parseExprAtom0(None);
            node.extra = Option<HashMap<String,ExtraValue>>.None
            return node;

        case tt_string where tt_string == getTT().string =>
            node = parseExprAtom0(None);
            node.extra = Option<HashMap<String,ExtraValue>>.None
            return node;

        case _ =>
           raise(state.start, "JSX value should be either an expression or a quoted JSX text");
        }
        return Node()
    }
    func jsxParseEmptyExpression() : Node {
        let node = startNodeAt(state.lastTokEnd, state.lastTokEndLoc.getOrThrow());
        return finishNodeAt(node, "JSXEmptyExpression", state.start, state.startLoc.getOrThrow());
    }
    func jsxParseSpreadChild() : Node {
        let node = startNode();
        expect(getTT().braceL, pos: None);
        expect(getTT().ellipsis, pos: None);
        node.expression = match(parseExpression(noIn: None, refShorthandDefaultPos: None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
        expect(getTT().braceR);
        
        return finishNode(node, "JSXSpreadChild");
    }
    func jsxParseExpressionContainer() : Node {
        let node = startNode();
        next();
        if ((matchX(getTT().braceR))) {
            node.expression = jsxParseEmptyExpression();
        } else {
            node.expression = match(parseExpression(noIn: None, refShorthandDefaultPos: None)) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                };
        }
        expect(getTT().braceR, pos: None);
        return finishNode(node, "JSXExpressionContainer");
    }
    func jsxParseAttribute() : Node {
        let node = startNode();
        if ((eat(getTT().braceL))) {
            expect(getTT().ellipsis, pos: None);
            node.argument =  parseMaybeAssign( None, None, None, None);
            expect(getTT().braceR);
            return finishNode(node, "JSXSpreadAttribute");
        }
        node.name = jsxParseNamespacedName();
        if (eat(getTT().eq)) {
            node.value = jsxParseAttributeValue();
        } else {
            node.value = Option<Any>.None;
        }
        return finishNode(node, "JSXAttribute");
    }
    func jsxParseOpeningElementAt( startPos: Int64,  startLoc: Position0) : Node {
        let node = startNodeAt(Int64(startPos), startLoc);
        node.attributes = ArrayList<Node>();
        node.name = jsxParseElementName();
        while ((!matchX(getTT().slash) && !matchX(getTT().jsxTagEnd.getOrThrow()))) {
            node.attributes.getOrThrow().add(jsxParseAttribute());
        }
        node.selfClosing = eat(getTT().slash);
        expect(getTT().jsxTagEnd.getOrThrow());
        return finishNode(node, "JSXOpeningElement");
    }
    func jsxParseClosingElementAt( startPos: Int64,  startLoc: Position0) : Node {
        let node = startNodeAt(Int64(startPos), startLoc);
        node.name = jsxParseElementName();
        expect(getTT().jsxTagEnd.getOrThrow(), pos: None);
        return finishNode(node, "JSXClosingElement");
    }
    func jsxParseElementAt(startPosIn: Int64,  startLoc: Position0): (Node, Position0) {
        var startPos = startPosIn
        let node = startNodeAt(Int64(startPos), startLoc);
        var children: ArrayList<Node> = ArrayList<Node>([]);
        let openingElement = jsxParseOpeningElementAt(startPos, startLoc);
        var closingElement: ?Node = Option<Node>.None;
        
        var startLoc00 = startLoc
        if (!openingElement.selfClosing.getOrThrow()) {
            while (true) {
                match (state._type) {
                case tt_jsxTagStart where tt_jsxTagStart == getTT().jsxTagStart.getOrThrow() =>
                    startPos = state.start
                    startLoc00 = state.startLoc.getOrThrow();
                    next();
                    if (eat(getTT().slash)) {
                        closingElement = jsxParseClosingElementAt(startPos, startLoc00);
                    } else {
                        var (children_ele_node, startLoc0000) = jsxParseElementAt(startPos, startLoc00)
                        startLoc00 = startLoc0000
                        children.add(children_ele_node)
                    }

                case tt_jsxText where tt_jsxText == getTT().jsxText.getOrThrow() =>
                    children.add(parseExprAtom0(None))
                case tt_braceL where tt_braceL == getTT().braceL =>
                    if (refEq(lookahead()._type, getTT().ellipsis)) {
                        children.add(jsxParseSpreadChild())
                    } else {
                        children.add(jsxParseExpressionContainer())
                    }
                                        
                    // istanbul ignore next - should never happen
                case _ =>
                    unexpected(None, Option<Any>.None)
                }
            }
            
            
            if ((getQualifiedJSXName((closingElement.getOrThrow().name.getOrThrow() as Node).getOrThrow()) != getQualifiedJSXName((openingElement.name.getOrThrow() as Node).getOrThrow()))) {
                raise(
                    closingElement.getOrThrow().start,
                    "Expected corresponding JSX closing tag for <" + getQualifiedJSXName((openingElement.name.getOrThrow() as Node).getOrThrow()) + ">"
                );
            }
        }
        
        node.openingElement = openingElement;
        node.closingElement = closingElement;
        node.children = children;
        if ((matchX(getTT().relational) && (state.value ?? "") as String == "<")) {
            raise(state.start, "Adjacent JSX elements must be wrapped in an enclosing tag");
        }
        return (finishNode(node, "JSXElement"), startLoc00)
    }
    func jsxParseElement() : Node {
        let startPos = state.start
        var startLoc = state.startLoc.getOrThrow()
        next()
        var (node_in_jsxParseElement, _) = jsxParseElementAt(startPos, startLoc)
        return node_in_jsxParseElement
    }
    
    public open override func parseExprAtom0(refShorthandDefaultPos: ?ExpPos): Node {
        if ((matchX(getTT().jsxText.getOrThrow()))) {
            let node = parseLiteral(state.value, "JSXText", None, None);
            // https://github.com/babel/babel/issues/2078
            node.extra = Option<HashMap<String,ExtraValue>>.None
            return node;
        } else if ((matchX(getTT().jsxTagStart.getOrThrow()))) {
            return jsxParseElement();
        } else {
            return super.parseExprAtom0(refShorthandDefaultPos)
        }
    }
    
    open public func readToken( code: Int64) {
        if ((state.inPropertyName)) {
            return super.readToken(code)
        }
        
        let context = curContext();
        
        if (refEq(context.getOrThrow(), getTC().j_expr)) {
            return jsxReadToken();
        }
        
        if (refEq(context.getOrThrow(), getTC().j_oTag) || refEq(context.getOrThrow(), getTC().j_cTag)) {
            if ((isIdentifierStart(code))) {
                return jsxReadWord();
            }
            
            if ((code == INT_VAL_P_62)) {
                state.pos += 1
                return finishToken(getTT().jsxTagEnd.getOrThrow(), val: Option<Any>.None);
            }
            
            if (((code == INT_VAL_P_34 || code == INT_VAL_P_39) && refEq(context.getOrThrow(), getTC().j_oTag))) {
                return jsxReadString(code);
            }
        }
        
        if ((code == INT_VAL_P_60 && state.exprAllowed)) {
            state.pos += 1
            return finishToken(getTT().jsxTagStart.getOrThrow(), val: Option<Any>.None);
        }
        
        return super.readToken(code)
    }
    
    override public func updateContext( prevType: TokenType) {
        if ((matchX(getTT().braceL))) {
            let curContext = curContext();
            if (refEq(curContext.getOrThrow(), getTC().j_oTag)) {
                state.context.getOrThrow().add(getTC().braceExpression);
            } else if (refEq(curContext.getOrThrow(), getTC().j_expr)) {
                state.context.getOrThrow().add(getTC().templateQuasi);
            } else {
                super.updateContext(prevType)
            }
            state.exprAllowed = true;
        } else if (matchX(getTT().slash) && refEq(prevType, getTT().jsxTagStart.getOrThrow())) {
//            state.context.getOrThrow().size -= 2
            state.context.getOrThrow().add(getTC().j_cTag); // reconsider as closing tag context
            state.exprAllowed = false;
        } else {
            return super.updateContext(prevType)
        }
    }
}

public open class FlowParser <: JSXParser {
    init(options: ParserOptions, input: String) {
        super(options, input)
    }

    func flowParseTypeInitialiser( tok!: ?TokenType = Option<TokenType>.None) : Node {
        let oldInType = state.inType
        state.inType = true
        if (tok.isSome()) {
            expect(tok.getOrThrow())
        } else {
            expect(getTT().colon)
        }
        let _type = flowParseType()
        state.inType = oldInType
        return _type
    }
    
    func flowParsePredicate() : Node {
        let node = startNode()
        let moduloLoc = state.startLoc
        let moduloPos = state.start
        expect(getTT().modulo)
        let checksLoc = state.startLoc
        expectContextual("checks")
        if (((moduloLoc.getOrThrow().line != checksLoc.getOrThrow().line) || (moduloLoc.getOrThrow().col != checksLoc.getOrThrow().col - 1))) {
            raise(moduloPos, "Spaces between ´%´ and ´checks´ are not allowed here.")
        }
        if ((eat(getTT().parenL))) {
            node.expression = match(parseExpression()) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            expect(getTT().parenR)
            return finishNode(node, "DeclaredPredicate")
        } else {
            return finishNode(node, "InferredPredicate")
        }
    }
    
    func flowParseTypeAndPredicateInitialiser() : (?Node, ?Node) {
        let oldInType = state.inType
        state.inType = true
        expect(getTT().colon)
        var _type: ?Node = Option<Node>.None
        var predicate: ?Node = Option<Node>.None
        if ((matchX(getTT().modulo))) {
            state.inType = oldInType
            predicate = flowParsePredicate()
        } else {
            _type = flowParseType()
            state.inType = oldInType
            if ((matchX(getTT().modulo))) {
                predicate = flowParsePredicate()
            }
        }
        return (_type, predicate)
    }
    
    func flowParseDeclareClass( node: Node) : Node {
        next()
        flowParseInterfaceish(node, allowStatic: true)
        return finishNode(node, "DeclareClass")
    }
    
    func flowParseDeclareFunction( node: Node) : Node {
        next()
        node.id = parseIdentifier(None)
        let id = node.id
        let typeNode = startNode()
        let typeContainer = startNode()
        if ((isRelational("<"))) {
            typeNode.typeParameters = flowParseTypeParameterDeclaration()
        } else {
            typeNode.typeParameters = Option<Node>.None
        }
        expect(getTT().parenL, pos: None)
        let tmp = flowParseFunctionTypeParams()
        var tmp_params : ?ArrayList<?Node> = Some(ArrayList<?Node>())
        for (tmp_params_value in tmp.params) {
            tmp_params.getOrThrow().add(Some(tmp_params_value))
        }
        typeNode.params = tmp_params
        typeNode.rest = tmp.rest
        expect(getTT().parenR, pos: None)
        var predicate: ?Node = Option<Node>.None
        typeNode.returnType = flowParseTypeAndPredicateInitialiser()[0]
        predicate = flowParseTypeAndPredicateInitialiser()[1]
        typeContainer.typeAnnotation = finishNode(typeNode, "FunctionTypeAnnotation")
        typeContainer.predicate = predicate
        id.getOrThrow().typeAnnotation = finishNode(typeContainer, "TypeAnnotation")
        finishNode(id.getOrThrow(), id.getOrThrow()._type)
        semicolon()
        return finishNode(node, "DeclareFunction")
    }
    
    func flowParseDeclare( node: Node) : ?Node {
        if ((matchX(getTT()._class))) {
            return flowParseDeclareClass(node)
        } else if ((matchX(getTT()._function))) {
            return flowParseDeclareFunction(node)
        } else if ((matchX(getTT()._var))) {
            return flowParseDeclareVariable(node)
        } else if ((isContextual("module"))) {
            if (refEq(lookahead()._type, getTT().dot)) {
                return flowParseDeclareModuleExports(node)
            } else {
                return flowParseDeclareModule(node)
            }
        } else if ((isContextual("type"))) {
            return flowParseDeclareTypeAlias(node)
        } else if ((isContextual("interface"))) {
            return flowParseDeclareInterface(node)
        } else {
            unexpected(None, Option<Any>.None)
            return None
        }
    }
    
    func flowParseDeclareVariable( node: Node) : Node {
        next()
        node.id = flowParseTypeAnnotatableIdentifier()
        semicolon()
        return finishNode(node, "DeclareVariable")
    }
    
    func flowParseDeclareModule( node: Node) : Node {
        next()
        if ((matchX(getTT().string))) {
            node.id = parseExprAtom0(None)
        } else {
            node.id = parseIdentifier(Option<Bool>.None)
        }
        node.body = startNode()
        let bodyNode = (node.body.getOrThrow() as Node).getOrThrow()
        bodyNode.body = Array<Node>()
        var body: ArrayList<Node> = (bodyNode.body.getOrThrow() as ArrayList<Node>).getOrThrow()
        expect(getTT().braceL, pos: None)
        while ((!matchX(getTT().braceR))) {
            var bodyNode = startNode()
            if ((matchX(getTT()._import))) {
                let lookahead = lookahead()
                if ((((lookahead.value ?? "") as String).getOrThrow() != "type" && ((lookahead.value ?? "") as String).getOrThrow() != "typeof")) {
                    unexpected(None, "Imports within a `declare module` body must always be `import type` or `import typeof`")
                }
                parseImport(bodyNode)
            } else {
                expectContextual("declare", message: "Only declares and _type imports are allowed inside declare module")
                bodyNode = flowParseDeclare(bodyNode).getOrThrow()
            }
            body.add(bodyNode)
        }
        expect(getTT().braceR, pos: None)
        finishNode(bodyNode, "BlockStatement")
        return finishNode(node, "DeclareModule")
    }
    
    func flowParseDeclareModuleExports( node: Node) : Node {
        expectContextual("module", message: None)
        expect(getTT().dot, pos: None)
        expectContextual("exports", message: None)
        node.typeAnnotation = flowParseTypeAnnotation()
        semicolon()
        return finishNode(node, "DeclareModuleExports")
    }
    
    func flowParseDeclareTypeAlias( node: Node) : Node {
        next()
        flowParseTypeAlias(node)
        return finishNode(node, "DeclareTypeAlias")
    }
    
    func flowParseDeclareInterface( node: Node) : Node {
        next()
        flowParseInterfaceish(node)
        return finishNode(node, "DeclareInterface")
    }
    
    func flowParseInterfaceish( node: Node, allowStatic!: Bool = false) {
        node.id = parseIdentifier(None)
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterDeclaration()
        } else {
            node.typeParameters = Option<Node>.None
        }
        node.extendsArr = ArrayList<Node>()
        node.mixins = ArrayList<Node>()
        if ((eat(getTT()._extends))) {
            do {
                node.extendsArr.getOrThrow().add(flowParseInterfaceExtends());
            } while (eat(getTT().comma))
        }
        if ((isContextual("mixins"))) {
            next()
            do {
                node.mixins.getOrThrow().add(flowParseInterfaceExtends());
            } while (eat(getTT().comma))
        }
        node.body = flowParseObjectType(allowStatic)
    }
    
    func flowParseInterfaceExtends() : Node {
        let node = startNode()
        node.id = flowParseQualifiedTypeIdentifier(0, startLoc: None, id: None)
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterInstantiation()
        } else {
            node.typeParameters = Option<Node>.None
        }
        return finishNode(node, "InterfaceExtends")
    }
    
    func flowParseInterface( node: Node) : Node {
        flowParseInterfaceish(node, allowStatic: false)
        return finishNode(node, "InterfaceDeclaration")
    }
    
    func flowParseRestrictedIdentifier( liberal!: Bool = false) : Node {
        let index = primitiveTypes.firstIndex(((state.value ?? "") as String).getOrThrow())
        if ((index.isSome() && index.getOrThrow() > -1)) {
            raise(state.start, "Cannot overwrite primitive _type ${(state.value ?? "") as String ?? ""}")
        }
        return parseIdentifier(liberal)
    }
    
    func flowParseTypeAlias( node: Node) : Node {
        node.id = flowParseRestrictedIdentifier()
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterDeclaration()
        } else {
            node.typeParameters = Option<Node>.None
        }
        node.right = flowParseTypeInitialiser(tok:getTT().eq)
        semicolon()
        return finishNode(node, "TypeAlias")
    }
    
    func flowParseTypeParameter() : Node {
        let node = startNode()
        let variance = flowParseVariance()
        let ident = flowParseTypeAnnotatableIdentifier()
        node.name = ident.name
        node.variance = variance
        node.bound = ident.typeAnnotation
        if ((matchX(getTT().eq))) {
            eat(getTT().eq)
            node.`default` = flowParseType()
        }
        return finishNode(node, "TypeParameter")
    }
    
    func flowParseTypeParameterDeclaration() : Node {
        let oldInType = state.inType
        let node = startNode()
        node.params = ArrayList<?Node>()
        state.inType = true
        if ((isRelational("<") || matchX(getTT().jsxTagStart.getOrThrow()))) {
            next()
        } else {
            unexpected(None, None)
        }
        do {
            node.params.getOrThrow().add(flowParseTypeParameter())
            if ((!isRelational(">"))) {
                expect(getTT().comma)
            }
        } while (!isRelational(">"))
        expectRelational(">")
        state.inType = oldInType
        return finishNode(node, "TypeParameterDeclaration")
    }
    
    func flowParseTypeParameterInstantiation() : Node {
        let node = startNode()
        let oldInType = state.inType
        node.params = ArrayList<?Node>()
        state.inType = true
        expectRelational("<")
        while ((!isRelational(">"))) {
            node.params.getOrThrow().add(flowParseType())
            if ((!isRelational(">"))) {
                expect(getTT().comma, pos: None)
            }
        }
        expectRelational(">")
        state.inType = oldInType
        return finishNode(node, "TypeParameterInstantiation")
    }
    
    func flowParseObjectPropertyKey() : Node {
        if (matchX(getTT().num) || matchX(getTT().string)) {
            return parseExprAtom0(None)
        } else {
            return parseIdentifier(true)
        }
    }
    
    func flowParseObjectTypeIndexer( node: Node,  isStatic: Bool,  variance!: ?Node = Option<Node>.None) : Node {
        node.`static` = isStatic
        expect(getTT().bracketL, pos: None)
        if (refEq(lookahead()._type, getTT().colon)) {
            node.id = flowParseObjectPropertyKey()
            node.key = flowParseTypeInitialiser(tok: None)
        } else {
            node.id = Option<Node>.None
            node.key = flowParseType()
        }
        expect(getTT().bracketR, pos: None)
        node.value = flowParseTypeInitialiser(tok: None)
        node.variance = variance
        let indexer = finishNode(node, "ObjectTypeIndexer")
        flowObjectTypeSemicolon()
        return indexer
    }
    
    func flowParseObjectTypeMethodish( node: Node) : Node {
        node.params = ArrayList<?Node>()
        node.rest = Option<Node>.None
        node.typeParameters = Option<Node>.None
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterDeclaration()
        }
        expect(getTT().parenL)
        while ((matchX(getTT().name))) {
            node.params.getOrThrow().add(flowParseFunctionTypeParam())
            if ((!matchX(getTT().parenR))) {
                expect(getTT().comma, pos: None)
            }
        }
        if ((eat(getTT().ellipsis))) {
            node.rest = flowParseFunctionTypeParam()
        }
        expect(getTT().parenR, pos: None)
        node.returnType = flowParseTypeInitialiser(tok: None)
        return finishNode(node, "FunctionTypeAnnotation")
    }
    
    func flowParseObjectTypeMethod( startPos: Int64,  startLoc: Position0,  isStatic: Bool,  key: Node) : Node {
        let node = startNodeAt(startPos, startLoc)
        node.value = flowParseObjectTypeMethodish(startNodeAt(startPos, startLoc))
        node.`static` = isStatic
        node.key = key
        node.optional = false
        flowObjectTypeSemicolon()
        return finishNode(node, "ObjectTypeProperty")
    }
    
    func flowParseObjectTypeCallProperty( node: Node,  isStatic: Bool) : Node {
        let valueNode = startNode()
        node.`static` = isStatic
        node.value = flowParseObjectTypeMethodish(valueNode)
        flowObjectTypeSemicolon()
        return finishNode(node, "ObjectTypeCallProperty")
    }
    
    func flowParseObjectType( allowStatic: Bool,  allowExact!: Bool = false) : Node {
        let oldInType = state.inType;
        state.inType = true;
        let nodeStart = startNode()
        var node: Node
        var propertyKey: Node
        var isStatic = false
        nodeStart.callProperties = ArrayList<Node>()
        nodeStart.properties = ArrayList<Node>()
        nodeStart.indexers = ArrayList<Node>()
        var endDelim: TokenType
        var exact: Bool
        if ((allowExact && matchX(getTT().braceBarL))) {
            expect(getTT().braceBarL, pos: None)
            endDelim = getTT().braceBarR
            exact = true
        } else {
            expect(getTT().braceL, pos: None)
            endDelim = getTT().braceR
            exact = false
        }
        nodeStart.exact = exact
        while ((!matchX(endDelim))) {
            var optional = false
            let startPos = state.start
            let startLoc = state.startLoc
            node = startNode()
            if (allowStatic && isContextual("static") && lookahead()._type != getTT().colon) {
                next();
                isStatic = true
            }
            let variance = flowParseVariance()
            if ((matchX(getTT().bracketL))) {
                nodeStart.indexers.getOrThrow().add(flowParseObjectTypeIndexer(node, isStatic, variance: variance))
            } else if ((matchX(getTT().parenL) || isRelational("<"))) {
                if ((variance.isSome())) {
                    unexpected(variance.getOrThrow().start, Option<Any>.None);
                }
                nodeStart.callProperties.getOrThrow().add(flowParseObjectTypeCallProperty(node, isStatic))
            } else {
                propertyKey = flowParseObjectPropertyKey();
                if ((isRelational("<") || matchX(getTT().parenL))) {
                    if ((variance.isSome())) {
                        unexpected(variance.getOrThrow().start, Option<Any>.None);
                    }
                    nodeStart.properties.getOrThrow().add(flowParseObjectTypeMethod(startPos, startLoc.getOrThrow(), isStatic, propertyKey))
                } else {
                    if ((eat(getTT().question))) {
                        optional = true
                    }
                    node.key = propertyKey
                    node.value = flowParseTypeInitialiser(tok: None)
                    node.optional = optional
                    node.`static` = isStatic
                    node.variance = variance
                    flowObjectTypeSemicolon()
                    nodeStart.properties.getOrThrow().add(finishNode(node, "ObjectTypeProperty"))
                }
            }
            isStatic = false
        }
        expect(endDelim, pos: None)
        let out = finishNode(nodeStart, "ObjectTypeAnnotation")
        state.inType = oldInType
        return out
    }
    
    func flowObjectTypeSemicolon() {
        if (!eat(getTT().semi) && !eat(getTT().comma) &&
            !matchX(getTT().braceR) && !matchX(getTT().braceBarR)) {
            unexpected(None, Option<Any>.None)
        }
    }
    
    func flowParseQualifiedTypeIdentifier( startPos: Int64,  startLoc!: ?Position0 = Option<Position0>.None,  id!: ?Node = Option<Node>.None) : Node {
        let startPos1 : Int64
        if (startPos != 0) {
            startPos1 = startPos
        } else {
            startPos1 = state.start
        }
        let startLoc1 : Position0
        if (startLoc.isSome()) {
            startLoc1 = startLoc.getOrThrow()
        } else {
            startLoc1 = state.startLoc.getOrThrow()
        }
        var node : ?Node
        if (id.isSome()) {
            node = id
        } else {
            node = parseIdentifier(None)
        }
        while ((eat(getTT().dot))) {
            let node2 = startNodeAt(startPos, startLoc.getOrThrow())
            node2.qualification = node
            node2.id = parseIdentifier(None)
            node = finishNode(node2, "QualifiedTypeIdentifier")
        }
        return node.getOrThrow()
    }
    
    func flowParseGenericType( startPos: Int64,  startLoc: Position0,  id: Node) : Node {
        let node = startNodeAt(startPos, startLoc)
        node.typeParameters = Option<Node>.None
        node.id = flowParseQualifiedTypeIdentifier(startPos, startLoc: startLoc, id: id)
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterInstantiation()
        }
        return finishNode(node, "GenericTypeAnnotation")
    }
    
    func flowParseTypeofType() : Node {
        let node = startNode()
        expect(getTT()._typeof)
        node.argument = flowParsePrimaryType()
        return finishNode(node, "TypeofTypeAnnotation")
    }
    
    func flowParseTupleType() : Node {
        let node = startNode()
        node.types = ArrayList<Node>()
        expect(getTT().bracketL, pos: None)
        while ((state.pos < input.size && !matchX(getTT().bracketR))) {
            node.types.getOrThrow().add(flowParseType())
            if ((matchX(getTT().bracketR))) {
                break
            }
            expect(getTT().comma, pos: None);
        }
        expect(getTT().bracketR, pos: None);
        return finishNode(node, "TupleTypeAnnotation")
    }
    
    func flowParseFunctionTypeParam() : Node {
        var name: ?Node = Option<Node>.None
        var optional = false
        var typeAnnotation: ?Node = Option<Node>.None
        let node = startNode()
        let lh = lookahead()
        if (refEq(lh._type, getTT().colon) ||
            refEq(lh._type, getTT().question)) {
            name = parseIdentifier(None)
            if ((eat(getTT().question))) {
                optional = true
            }
            typeAnnotation = flowParseTypeInitialiser(tok: None)
        } else {
            typeAnnotation = flowParseType()
        }
        node.name = match(name) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
        node.optional = optional
        node.typeAnnotation = typeAnnotation
        return finishNode(node, "FunctionTypeParam")
    }
    
    func reinterpretTypeAsFunctionTypeParam( _type: Node) : Node {
        let node = startNodeAt(_type.start, _type.loc.start)
        node.name = Option<Any>.None
        node.optional = false
        node.typeAnnotation = _type
        return finishNode(node, "FunctionTypeParam")
    }
    
    func flowParseFunctionTypeParams( params!: ArrayList<Node> = ArrayList<Node>()) : ParamsObj {
        let ret = ParamsObj(params, rest: None)
        while ((!matchX(getTT().parenR) && !matchX(getTT().ellipsis))) {
            ret.params.add(flowParseFunctionTypeParam())
            if ((!matchX(getTT().parenR))) {
                expect(getTT().comma, pos: None)
            }
        }
        if (eat(getTT().ellipsis)) {
            ret.rest = flowParseFunctionTypeParam()
        }
        return ret
    }
    
    func flowIdentToTypeAnnotation( startPos: Int64,  startLoc: Position0,  node: Node,  id:Node) : Node {
        match ( (id.name.getOrThrow() as String).getOrThrow()) {
        case "any" =>
            return finishNode(node, "AnyTypeAnnotation");
        case "void" =>
            return finishNode(node, "UnitTypeAnnotation");
        case "bool" | "boolean" =>
            return finishNode(node, "BooleanTypeAnnotation");
        case "mixed" =>
            return finishNode(node, "MixedTypeAnnotation");
        case "empty" =>
            return finishNode(node, "EmptyTypeAnnotation");
        case "number" =>
            return finishNode(node, "NumberTypeAnnotation");
        case "string" =>
            return finishNode(node, "StringTypeAnnotation");
        case _ =>
            return flowParseGenericType(startPos, startLoc, id);
        }
    }
    
    func flowParsePrimaryType() : Node {
        let startPos = state.start
        let startLoc = state.startLoc
        let node = startNode()
        var tmp: ParamsObj
        var _type: ?Node = Option<Node>.None
        var isGroupedType = false
        let oldNoAnonFunctionType = state.noAnonFunctionType

        match (state._type) {
        case tt_name where tt_name == getTT().name =>
            return flowIdentToTypeAnnotation(startPos, startLoc.getOrThrow(), node, parseIdentifier(Option<Bool>.None))
        case tt_braceL where tt_braceL == getTT().braceL =>
            return flowParseObjectType(false, allowExact: false);
        case tt_braceBarL where tt_braceBarL == getTT().braceBarL =>
            return flowParseObjectType(false, allowExact: true);
        case tt_bracketL where tt_bracketL == getTT().bracketL =>
            return flowParseTupleType();
        case tt_relational where tt_relational == getTT().relational =>
            if ((((state.value ?? "") as String).getOrThrow() == "<")) {
                node.typeParameters = flowParseTypeParameterDeclaration()
                expect(getTT().parenL, pos: None)
                tmp = flowParseFunctionTypeParams()
                var tmp_params : ?ArrayList<?Node> = Some(ArrayList<?Node>())
                for (tmp_params_value in tmp.params) {
                    tmp_params.getOrThrow().add(Some(tmp_params_value))
                }
                node.params = tmp_params
                node.rest = tmp.rest
                expect(getTT().parenR, pos: None)
                expect(getTT().arrow, pos: None)
                node.returnType = flowParseType()
                return finishNode(node, "FunctionTypeAnnotation")
            }
        case tt_parenL where tt_parenL == getTT().parenL =>
            next()
            if ((!matchX(getTT().parenR) && !matchX(getTT().ellipsis))) {
                if ((matchX(getTT().name))) {
                    let token = lookahead()._type
		    isGroupedType = !refEq(token, getTT().question) && !refEq(token, getTT().colon)
                } else {
                    isGroupedType = true
                }
            }
            if (isGroupedType) {
                state.noAnonFunctionType = false
                _type = flowParseType()
                state.noAnonFunctionType = oldNoAnonFunctionType
                if (state.noAnonFunctionType ||
                    !(matchX(getTT().comma) ||
                      (matchX(getTT().parenR) && refEq(lookahead()._type, getTT().arrow)))) {
                    expect(getTT().parenR, pos: None)
                    return _type.getOrThrow()
                } else {
                    eat(getTT().comma);
                }
            }
            if (_type.isSome()) {
                tmp = flowParseFunctionTypeParams(params: ArrayList<Node>([reinterpretTypeAsFunctionTypeParam(_type.getOrThrow())]))
            } else {
                tmp = flowParseFunctionTypeParams()
            }
            var tmp_params : ?ArrayList<?Node> = Some(ArrayList<?Node>())
            for (tmp_params_value in tmp.params) {
                tmp_params.getOrThrow().add(Some(tmp_params_value))
            }
            node.params = tmp_params
            node.rest = tmp.rest
            expect(getTT().parenR, pos: None)
            expect(getTT().arrow, pos: None)
            node.returnType = flowParseType()
            node.typeParameters = Option<Node>.None
            return finishNode(node, "FunctionTypeAnnotation")
        case tt_string where tt_string == getTT().string =>
            return parseLiteral(((state.value ?? "") as String).getOrThrow(), "StringLiteralTypeAnnotation", None, None);
        case tt_true where tt_true == getTT()._true =>
            node.value = matchX(getTT()._true)
            next();
            return finishNode(node, "BooleanLiteralTypeAnnotation")
        case tt_false where tt_false == getTT()._false =>
            node.value = matchX(getTT()._true)
            next();
            return finishNode(node, "BooleanLiteralTypeAnnotation")       
        case tt_plusMin where tt_plusMin == getTT().plusMin =>
            if (((state.value ?? "") as String == "-")) {
                next()
                if (!matchX(getTT().num)){
                    unexpected(None, "Unexpected token, expected number")
                }
                return parseLiteral(-(state.value.getOrThrow() as Int64).getOrThrow(), "NumberLiteralTypeAnnotation", node.start, node.loc.start)
            }
            unexpected(None, Option<Any>.None)
        case tt_num where tt_num == getTT().num =>
            return parseLiteral(((state.value ?? "") as String).getOrThrow(), "NumberLiteralTypeAnnotation", None, None);
            
        case tt_null where tt_null == getTT()._null =>
            node.value = matchX(getTT()._null)
            next()
            return finishNode(node, "NullLiteralTypeAnnotation")
        case tt_this where tt_this == getTT()._this =>
            node.value = matchX(getTT()._this)
            next()
            return finishNode(node, "ThisTypeAnnotation")
        case tt_star where tt_star == getTT().star =>
            next()
            return finishNode(node, "ExistsTypeAnnotation")
        case _ =>
            if ((state._type.keyword == "typeof")) {
                return flowParseTypeofType()
            }
        }
        unexpected(None, Option<Any>.None)
        return Node()
    }
    
    func flowParsePostfixType(): Node {
        let startPos = state.start
        let startLoc = state.startLoc
        var _type = flowParsePrimaryType();
        while ((!canInsertSemicolon() && matchX(getTT().bracketL))) {
            let node = startNodeAt(startPos, startLoc.getOrThrow())
            node.elementType = _type
            expect(getTT().bracketL, pos: None)
            expect(getTT().bracketR, pos: None)
            _type = finishNode(node, "ArrayTypeAnnotation")
        }
        return _type
    }
    
    func flowParsePrefixType(): Node {
        let node = startNode()
        if ((eat(getTT().question))) {
            node.typeAnnotation = flowParsePrefixType()
            return finishNode(node, "NullableTypeAnnotation")
        } else {
            return flowParsePostfixType()
        }
    }
    
    func flowParseAnonFunctionWithoutParens(): Node {
        let param = flowParsePrefixType()
        if (!state.noAnonFunctionType && eat(getTT().arrow)) {
            let node  = startNodeAt(param.start, param.loc.start)
            var tmp_params : ?ArrayList<?Node> = Some(ArrayList<?Node>())
            for (tmp_params_value in ArrayList<Node>([reinterpretTypeAsFunctionTypeParam(param)])) {
                tmp_params.getOrThrow().add(Some(tmp_params_value))
            }
            node.params = tmp_params
            node.rest = Option<Node>.None
            node.returnType = flowParseType()
            node.typeParameters = Option<Node>.None
            return finishNode(node, "FunctionTypeAnnotation")
        }
        return param
    }
    
    func flowParseInt64ersectionType(): Node {
        let node = startNode()
        eat(getTT().bitwiseAND)
        let _type = flowParseAnonFunctionWithoutParens()
        node.types = ArrayList<Node>([_type])
        while ((eat(getTT().bitwiseAND))) {
            node.types.getOrThrow().add(flowParseAnonFunctionWithoutParens())
        }
        if (node.types.getOrThrow().size == 1) {
            return _type
        } else {
            return finishNode(node, "Int64ersectionTypeAnnotation")
        }
    }
    
    func flowParseUnionType() : Node {
        let node = startNode()
        eat(getTT().bitwiseOR)
        let _type = flowParseInt64ersectionType()
        node.types = ArrayList<Node>([_type])
        while ((eat(getTT().bitwiseOR))) {
            node.types.getOrThrow().add(flowParseInt64ersectionType())
        }
        
        if (node.types.getOrThrow().size == 1) {
            return  _type
        } else {
            return finishNode(node, "UnionTypeAnnotation")
        }
    }
    
    func flowParseType(): Node {
        let oldInType = state.inType
        state.inType = true
        let _type = flowParseUnionType()
        state.inType = oldInType
        return _type
    }
    
    func flowParseTypeAnnotation(): Node {
        let node = startNode()
        node.typeAnnotation = flowParseTypeInitialiser()
        return finishNode(node, "TypeAnnotation")
    }
    
    func flowParseTypeAndPredicateAnnotation(): Node {
        let node = startNode()
        node.typeAnnotation = flowParseTypeAndPredicateInitialiser()[0]
        node.predicate = flowParseTypeAndPredicateInitialiser()[1]
        return finishNode(node, "TypeAnnotation")
    }
    
    func flowParseTypeAnnotatableIdentifier(): Node {
        let ident = flowParseRestrictedIdentifier(liberal: false)
        if (matchX(getTT().colon)) {
            ident.typeAnnotation = flowParseTypeAnnotation()
            finishNode(ident, ident._type)
        }
        return ident
    }
    
    func typeCastToParameter(node: Node): Node {
        let nodeExp = (node.expression.getOrThrow() as Node).getOrThrow()
        nodeExp.typeAnnotation = node.typeAnnotation
        return finishNodeAt(
            nodeExp,
            nodeExp._type,
            node.typeAnnotation.getOrThrow().end,
            node.typeAnnotation.getOrThrow().loc.end.getOrThrow()
        )
    }
    
    func flowParseVariance() : ?Node {
        var variance: ?Node = Option<Node>.None
        if (matchX(getTT().plusMin)) {
            variance = startNode();
            if (((state.value ?? "") as String == "+")) {
                variance.getOrThrow().kind = "plus"
            } else {
                variance.getOrThrow().kind = "minus"
            }
            next()
            finishNode(variance.getOrThrow(), "Variance")
        }
        return variance
    }
    
    override public func parseFunctionBody(node: Node,  allowExpression: ?Bool): Unit {
        if ((matchX(getTT().colon) && !allowExpression.getOrThrow())) {
            node.returnType = flowParseTypeAndPredicateAnnotation();
        }
        return super.parseFunctionBody(node, allowExpression);
    }
    
    override public func parseStatement( declaration: Bool,  topLevel: ?Bool): Node {
        if ((state.strict && matchX(getTT().name) && (state.value ?? "") as String == "interface")) {
            let node = startNode()
            next()
            return flowParseInterface(node)
        } else {
            return super.parseStatement(declaration, topLevel)
        }
    }
    
    override public func parseExpressionStatement(node: Node,  expr: Node) : Node {
        if ((expr._type == "Identifier")) {
            if (((expr.name ?? "") as String == "declare")) {
                if ((matchX(getTT()._class) || matchX(getTT().name) || matchX(getTT()._function) || matchX(getTT()._var))) {
                    return flowParseDeclare(node).getOrThrow();
                }
            } else if (matchX(getTT().name)) {
                if (((expr.name ?? "") as String == "interface")) {
                    return flowParseInterface(node)
                } else if (((expr.name ?? "") as String == "type")) {
                    return flowParseTypeAlias(node)
                }
            }
        }
        return super.parseExpressionStatement(node, expr)
    }
    
    override public func shouldParseExportDeclaration() : Bool {
        return isContextual("type") || isContextual("interface") || super.shouldParseExportDeclaration()
    }
    
    override public func parseConditional( expr: Node,  noIn: ?Bool,  startPos: Int64,  startLoc: Position0,  refNeedsArrowPos: ?State)  : ?Node {
        if ((refNeedsArrowPos.isSome() && matchX(getTT().question))) {
            let state = state.clone()
            try {
                return super.parseConditional(expr, noIn, startPos, startLoc, Option<State>.None);
            } catch (err: ParserError) {
                this.state = state;
                
                if (err.pos.isSome()) {
                    refNeedsArrowPos.getOrThrow().start = err.pos.getOrThrow()
                } else {
                    refNeedsArrowPos.getOrThrow().start = state.start
                }
                return expr
            }
        }
        return  super.parseConditional(expr, noIn, startPos, startLoc, Option<State>.None)
    }
    
    override public func parseParenItem( node: Node,  startPos: ?Int64,  startLoc: ?Position0) : Node {
        let node1 = super.parseParenItem(node, startPos, startLoc)
        if ((eat(getTT().question))) {
            node1.optional = true
        }
        if ((matchX(getTT().colon))) {
            let typeCastNode = startNodeAt(startPos, startLoc)
            typeCastNode.expression = node1
            typeCastNode.typeAnnotation = flowParseTypeAnnotation()
            return finishNode(typeCastNode, "TypeCastExpression")
        }
        return node1
    }
    
    override public func parseExport( node: Node) : Node {
        let node1 = super.parseExport(node)
        if ((node._type == "ExportNamedDeclaration")) {
            if (node.exportKind.getOrThrow().size > 0) {
                node1.exportKind = node.exportKind
            } else {
                node1.exportKind = "value"
            }
        }
        return node1
    }
    
    override public func parseExportDeclaration( node: ?Node) : ?Node {
        if ((isContextual("type"))) {
            node.getOrThrow().exportKind = "type"
            let declarationNode = startNode()
            next()
            if ((matchX(getTT().braceL))) {
                node.getOrThrow().specifiers = parseExportSpecifiers()
                parseExportFrom(node.getOrThrow())
                return None
            } else {
                return flowParseTypeAlias(declarationNode)
            }
        } else if ((isContextual("interface"))) {
            node.getOrThrow().exportKind = "type"
            let declarationNode = startNode()
            next()
            return flowParseInterface(declarationNode)
        } else {
            return super.parseExportDeclaration(node.getOrThrow())
        }
    }
    
    override public func parseClassId( node: Node,  isStatement: Bool,  optionalId: ?Bool) {
        super.parseClassId(node, isStatement, optionalId)
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterDeclaration()
        }
    }
    
    override public func isKeyword( word: String) : Bool {
        if ((state.inType && word == "void")) {
            return false
        } else {
            return super.isKeyword(word)
        }
    }
    
    override public func readToken( code: Int64) {
        if ((state.inType && (code == INT_VAL_P_62 || code == INT_VAL_P_60))) {
          return finishOp(getTT().relational, 1)
        } else {
          return super.readToken(code)
        }
    }

    override public func jsxReadToken() {
        if ((!state.inType)) {
            return super.jsxReadToken()
        }
    }
    
    override public func toAssignable( node: Node,  isBinding: ?Bool,  contextDescription: String) : Node {
        if ((node._type == "TypeCastExpression")) {
            return super.toAssignable(typeCastToParameter(node), isBinding, contextDescription)
        } else {
            return super.toAssignable(node, isBinding, contextDescription)
        }
    }

    override public func toAssignableList( exprList: ?ArrayList<?Node>,  isBinding: Bool,  contextDescription: String) : ?ArrayList<?Node> {
        var exprListCopy = exprList
        for (i in 0..exprListCopy.getOrThrow().size) {
            let expr = exprListCopy.getOrThrow()[i];
            if (((expr.isSome()) && expr.getOrThrow()._type == "TypeCastExpression")) {
                exprListCopy.getOrThrow()[i] = typeCastToParameter(expr.getOrThrow());
            }
        }
        return super.toAssignableList(exprListCopy, isBinding, contextDescription)
    }
    
    override public func toReferencedList( exprList: ?ArrayList<Node>) : ?ArrayList<Node> {
        if ((exprList.getOrThrow().size > 0)) {
            var i = 0
            let expr = exprList?[i]
            while ((expr.isSome() && expr.getOrThrow().exprListItem.getOrThrow() && expr.getOrThrow()._type == "TypeCastExpression")) {
                 raise(expr.getOrThrow().start, "Unexpected _type cast")
                i += 1
            }
        }
        return exprList
    }

    override public func parseExprListItem( allowEmpty: ?Bool,  refShorthandDefaultPos: ?ExpPos,  refNeedsArrowPos: ?ExpPos) : ?Node {
        let container = startNode()
        let node = super.parseExprListItem(allowEmpty, refShorthandDefaultPos, refNeedsArrowPos)
        if ((matchX(getTT().colon))) {
            container.exprListItem = true
            container.expression = match(node) {
                    case Some(x) => Some(x)
                    case _ => Option<Any>.None
                }
            container.typeAnnotation = flowParseTypeAnnotation()
            return finishNode(container, "TypeCastExpression")
        } else {
            return node
        }
    }
    
    override public func checkLVal( node: Node,  isBinding: ?Bool,  checkClashes: ?HashMap<String,Bool>,  contextDescription: String) {
        if ((node._type != "TypeCastExpression")) {
            return super.checkLVal(node, isBinding, checkClashes, contextDescription);
        }
    }
    
    override public func parseClassProperty( node: Node) : Node {
        if ((matchX(getTT().colon))) {
            node.typeAnnotation = flowParseTypeAnnotation()
        }
        return super.parseClassProperty(node)
    }
    
    override public func isClassMethod() : Bool {
        return isRelational("<") || super.isClassMethod()
    }

    override public func isClassProperty() : Bool {
        return matchX(getTT().colon) || super.isClassProperty()
    }

    override public func parseClassMethod( classBody: Node,  method: Node,  isGenerator: Bool,  isAsync: Bool) {
        if ((method.variance.isSome())) {
            unexpected(method.variance.getOrThrow().start, Option<Any>.None)
        }
        method.variance = Option<Node>.None
        if ((isRelational("<"))) {
            method.typeParameters = flowParseTypeParameterDeclaration()
        }
        super.parseClassMethod(classBody, method, isGenerator, isAsync)
    }
    
    override public func parseClassSuper( node: Node,  isStatement: ?Bool) {
        super.parseClassSuper(node, isStatement)
        if ((node.superClass.isSome() && isRelational("<"))) {
            node.superTypeParameters = flowParseTypeParameterInstantiation()
        }
        if (isContextual("implements")) {
            next()
            node.implements = ArrayList<Node>()
            var implemented: ArrayList<Node> = ArrayList<Node>()
            do {
                let node = startNode()
                node.id = parseIdentifier(None)
                if ((isRelational("<"))) {
                    node.typeParameters = flowParseTypeParameterInstantiation()
                } else {
                    node.typeParameters = Option<Node>.None
                }
                implemented.add(finishNode(node, "ClassImplements"))
            }
            while (eat(getTT().comma))
        }
    }
    
    override public func parsePropertyName( _prop: Node) : ?Node {
        let variance = flowParseVariance()
        let key = super.parsePropertyName(_prop)
        _prop.variance = variance
        return key
    }
    
    func parseObjPropValue( _prop: Node,  startPos: Int64,  startLoc: Position0,  isGenerator: Bool,  isAsync: Bool,  isPattern: Bool,  refShorthandDefaultPos: ExpPos) : ?Node {
        if (((_prop.variance).isSome())) {
            unexpected(_prop.variance.getOrThrow().start, Option<Any>.None);
        }
        _prop.variance = Option<Node>.None;
        
        var typeParameters: ?Node = Option<Node>.None
        
        if (isRelational("<")) {
            typeParameters = flowParseTypeParameterDeclaration();
            if ((!matchX(getTT().parenL))) {
                unexpected(None, Option<Any>.None);
            }
        }
        super.parseObjPropValue(_prop, startPos, startLoc, isGenerator, isAsync, isPattern, refShorthandDefaultPos);

        if (typeParameters.isSome() && _prop.value.isSome()) {
            (_prop.value.getOrThrow() as Node).getOrThrow().setTypeParameters(typeParameters)
        }
        return None
    }
    
    override public func parseAssignableListItemTypes( param: Node) : Node {
        if (eat(getTT().question)) {
            param.optional = true
        }
        if (matchX(getTT().colon)) {
            param.typeAnnotation = flowParseTypeAnnotation()
        }
        finishNode(param, param._type)
        return param
    }
    
    override public func parseMaybeDefault(startPos: ?Int64, startLoc: ?Position0, left: ?Node): ?Node {
        let node = super.parseMaybeDefault(startPos, startLoc, left)
        if ((node.getOrThrow()._type == "AssignmentPattern" && (node.getOrThrow().typeAnnotation.isSome()) && (node.getOrThrow().right.getOrThrow().start < node.getOrThrow().typeAnnotation.getOrThrow().start))) {
             raise(node.getOrThrow().typeAnnotation.getOrThrow().start, "Type annotations must come before default assignments, e.g. instead of `age = 25: number` use `age: number = 25`");
        }
        return node
    }
    
    override public func parseImportSpecifiers( node: Node) {
        node.importKind = "value"
        var kind: ?String = Option<String>.None
        if ((matchX(getTT()._typeof))) {
            kind = "typeof"
        } else if ((isContextual("type"))) {
            kind = "type"
        }
        if ((kind.isSome())) {
            let lh = lookahead();
            if ((refEq(lh._type, getTT().name) && ((lh.value ?? "") as String).getOrThrow() != "from") || refEq(lh._type, getTT().braceL) || refEq(lh._type, getTT().star)) {
                next()
                node.importKind = kind
            }
        }
        super.parseImportSpecifiers(node)
    }
    
    override public func parseImportSpecifier( node: Node) {
        let specifier = startNode()
        let firstIdentLoc = state.start
        let firstIdent = parseIdentifier(true)
        var specifierTypeKind: ?String = Option<String>.None
        if ((((firstIdent.name ?? "")) as String == "type")) {
            specifierTypeKind = "type"
        } else if (((firstIdent.name ?? "") as String == "typeof")) {
            specifierTypeKind = "typeof"
        }
        var isBinding = false
        if ((isContextual("as"))) {
            let asident = parseIdentifier(true)
            if ((specifierTypeKind.isSome() && !matchX(getTT().name) && (state._type.keyword.isNone()))) {
                specifier.imported = asident
                specifier.importKind = specifierTypeKind
                specifier.local = asident.clone()
            } else {
                specifier.imported = firstIdent
                specifier.importKind = Option<String>.None
                specifier.local = parseIdentifier(Option<Bool>.None)
            }
        } else if ((specifierTypeKind.isSome() && (matchX(getTT().name) || (state._type.keyword.isSome())))) {
            specifier.imported = parseIdentifier(true)
            specifier.importKind = specifierTypeKind
            if ((eatContextual("as"))) {
                specifier.local = parseIdentifier(Option<Bool>.None)
            } else {
                isBinding = true
                specifier.local = specifier.imported.getOrThrow().clone()
            }
        } else {
            isBinding = true
            specifier.imported = firstIdent
            specifier.importKind = Option<String>.None
            specifier.local = specifier.imported.getOrThrow().clone()
        }
        if ((node.importKind == "type" || node.importKind == "typeof") &&
            (specifier.importKind == "type" || specifier.importKind == "typeof")) {
            raise(firstIdentLoc, "`The _type and `typeof` keywords on named imports can only be used on regular `import` statements. It cannot be used with `import type` or `import typeof` statements`")
        }
        if ((isBinding)) {
            checkReservedWord((specifier.local.getOrThrow().name as String).getOrThrow(), specifier.start, true, true)
        }
        checkLVal(specifier.local.getOrThrow(), true, None, "import specifier")
        node.specifiers.getOrThrow().add(finishNode(specifier, "ImportSpecifier"))
    }
    
    override public func parseFunctionParams( node: Node) {
        if ((isRelational("<"))) {
            node.typeParameters = flowParseTypeParameterDeclaration()
        }
        super.parseFunctionParams(node)
    }
    
    public open override func parseVarHead( decl: Node) {
        super.parseVarHead(decl)
        if ((matchX(getTT().colon))) {
            decl.id.getOrThrow().typeAnnotation = flowParseTypeAnnotation()
            finishNode(decl.id.getOrThrow(), decl.id.getOrThrow()._type)
        }
    }
    
    override public func parseAsyncArrowFromCallExpression( node: Node,  call: Node) : Node {
        if ((matchX(getTT().colon))) {
            let oldNoAnonFunctionType = state.noAnonFunctionType
            state.noAnonFunctionType = true
            node.returnType = flowParseTypeAnnotation()
            state.noAnonFunctionType = oldNoAnonFunctionType
        }
        return super.parseAsyncArrowFromCallExpression(node, call)
    }
    
    override public func shouldParseAsyncArrow() : Bool {
        if (matchX(getTT().colon)) {
            return matchX(getTT().colon)
        } else {
            return super.shouldParseAsyncArrow()
        }
    }
        
    override public func parseMaybeAssign( noIn: ?Bool,  refShorthandDefaultPosIn: ?ExpPos,  afterLeftParse: ?((Parser, Node, Int64, Position0) -> Node),  refNeedsArrowPos: ?ExpPos)  : ?Node {
        var jsxError: ?ParserError = Option<ParserError>.None
        if (((getTT().jsxTagStart.isSome()) && matchX(getTT().jsxTagStart.getOrThrow()))) {
            let state = state.clone()
            try {
                return super.parseMaybeAssign( noIn, refShorthandDefaultPosIn, afterLeftParse, refNeedsArrowPos);
            } catch (err: ParserError) {
                this.state = state
                jsxError = err
            }
        }
        if ((jsxError.isSome() || isRelational("<"))) {
            state.context.getOrThrow().add(getTC().parenExpression);
            var arrowExpression: ?Node
            let typeParameters: Node
            try {
                typeParameters = flowParseTypeParameterDeclaration()
                arrowExpression = super.parseMaybeAssign( noIn, refShorthandDefaultPosIn, afterLeftParse, refNeedsArrowPos)
                arrowExpression.getOrThrow().typeParameters = typeParameters
                resetStartLocationFromNode(arrowExpression.getOrThrow(), typeParameters)
            } catch (err: ParserError) {
                state.context.getOrThrow().removeLast()
                if (jsxError.isSome()) {
                    throw jsxError.getOrThrow()
                } else {
                    throw err
                }
            }
            state.context.getOrThrow().removeLast()
            if ((arrowExpression.getOrThrow()._type == "ArrowFunctionExpression")) {
                return arrowExpression
            } else if ((jsxError.isSome())) {
                throw jsxError.getOrThrow()
            } else {
                 raise(
                    typeParameters.start,
                    "Expected an arrow function after this _type parameter declaration"
                )
            }
        }
        return super.parseMaybeAssign( noIn, refShorthandDefaultPosIn, afterLeftParse, refNeedsArrowPos)
    }


    override public func parseArrow( node: Node) : ?Node {
        if ((matchX(getTT().colon))) {
            let state = state.clone()
            try {
                let oldNoAnonFunctionType = state.noAnonFunctionType
                state.noAnonFunctionType = true
                let returnType = flowParseTypeAndPredicateAnnotation()
                state.noAnonFunctionType = oldNoAnonFunctionType
                if ((canInsertSemicolon())) {
                    unexpected(None, Option<Any>.None)
                }
                if ((!matchX(getTT().arrow))) {
                    unexpected(None, Option<Any>.None)
                }
                node.returnType = returnType
            } catch (err: ParserError) {
                this.state = state
            }
        }
        return super.parseArrow(node)
    }
    
    override public func shouldParseArrow() : Bool {
        if (matchX(getTT().colon)) {
            return matchX(getTT().colon)
        } else {
            return super.shouldParseArrow()
        }
    }
}
