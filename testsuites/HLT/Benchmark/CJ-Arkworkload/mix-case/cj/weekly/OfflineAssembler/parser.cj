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

let GlobalAnnotation :String = "global"
let LocalAnnotation : String = "local"


/*
 * Create IncludeFile File Class Splice
 */
class IncludeFile {
    var includeDirs: String = ""
    var fileName: String = ""
    
    init( moduleName: String,  defaultDir: ?String) {
        fileName = moduleName  + ".asm"
    }
    
    func toString() : String {
        return fileName
    }
}

/*
 * Define Token Class
 */
class Token {
    var codeOrigin: CodeOrigin
    var string: String = ""
    init( codeOrigi: CodeOrigin,  strin: String) {
        codeOrigin = codeOrigi
        string = strin
    }
    
    func isEqualTo( other: Any) : Bool {
        if ( (other is Token)) {
            return string == (other as Token).getOrThrow().string
        } else{
            return string == (other as String).getOrThrow()
        }
    }
    
    func isNotEqualTo( other: Any) : Bool {
        return !isEqualTo(other)
    }
    
    func toString() : String {
        return "" + string + "\\at" + codeOrigin.toString();
    }
    
    func parseError( comment: ?Any) {
        print("Parse error: " + "${((comment ?? "") as ToString).toString()}")
    }
}

/*
 * Define Annotation class
 */
class Annotation {
    var codeOrigin: CodeOrigin
    var string: String = ""
    var vartype: String
    
    init( codeOrigi: CodeOrigin,  typ: String,  strin: String) {
        this.codeOrigin = codeOrigi
        this.vartype = typ
        this.string = strin
    }
    
    func isEqualTo( other: Any) : Bool {
        if ( (other is Token)) {
            return string == (other as Token).getOrThrow().string
        } else{
            return string == (other as String).getOrThrow()
        }
    }
    
    func isNotEqualTo( other: Any) : Bool {
        return !isEqualTo(other)
    }
    
    func toString() : String {
        return "" + string + "\\at" + codeOrigin.toString();
    }
    
    func parseError( comment: ?Any) {
        print("Annotation error: " + "${((comment ?? "") as ToString).toString()}")
    }
}

/*
 * Returns a Token Array
 */
func lex( strs: String,  file: SourceFile) : Array<Any> {
    // Regex gets a data array containing a character
    func scanRegExp( source: String,  regexp: String) : ?Array<String> {
        return source.matche(regexp)
    }
    
    // The lexer. Takes a string and returns an array of tokens.
    var result : ArrayList<Any> = ArrayList<Any>()
    var lineNumber = 1
    var whitespaceFound : Bool = false
    var str = strs
    while (str.size > 0){
        var tokenMatch : ?Array<String> = []
        var annotation : ?Any = Option<Any>.None
        var annotationType : String = ""
        
        if ( let Some(tokens) <- scanRegExp(str, "^#([^\n]*)") ) {
            // comment, ignore
            tokenMatch = tokens
        } else if ( let Some(tokens) <- scanRegExp(str,  "^\\/\\/ ?([^\n]*)")) {
            // annotation
            tokenMatch = tokens
            annotation = tokenMatch.getOrThrow()[0]
            if (whitespaceFound){
                annotationType = LocalAnnotation
            }else{
                annotationType = GlobalAnnotation
            }
        } else if ( let Some(tokens) <- scanRegExp(str, "^\n")) {
            /* We've found a '\n'.  Emit the last comment recorded if appropriate:
             * We need to parse annotations regardless of whether the backend does
             * anything with them or not. This is because the C++ backend may make
             * use of this for its cloopDo debugging utility even if
             * enableInstrAnnotations is not enabled.
             */
            tokenMatch = tokens            
            if ( (annotation.isSome())) {
                result.add(Annotation(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), annotationType, (annotation as String).getOrThrow()))
                annotation = Option<Any>.None;
            }
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
            lineNumber += 1;
        } else if ( let Some(tokens) <- scanRegExp(str, "^[a-zA-Z]([a-zA-Z0-9_.]*)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "^\\.([a-zA-Z0-9_]*)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "^_([a-zA-Z0-9_]*)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "^([ \t]+)")) {
            // whitespace, ignore
            whitespaceFound = true;
            // str = String(str.suffix(from: tokens[0].endIndex))
            str = str[str.indexOf(tokens[0]).getOrThrow() + tokens[0].size..str.size]
            continue;
        } else if ( let Some(tokens) <- scanRegExp(str, "^0x([0-9a-fA-F]+)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), "${UInt64.parse(tokens[0])}"))
        } else if ( let Some(tokens) <- scanRegExp(str, "^0([0-7]+)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), "${Int64.parse(tokens[0])}"))
        } else if ( let Some(tokens) <- scanRegExp(str, "^([0-9]+)")) {
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "^::")) {
            // Match with double colons:: Text line at the beginning
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "^[:,\\(\\)\\[\\]=+-\\~\\|&^*]")) {
            // ^[:,\(\)\[\]=\+\-~\|&^*] Matches strings starting with colon, comma, parenthesis, square brackets, equals, plus, minus, tilde, pipe, and, or characters, or asterisks
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else if ( let Some(tokens) <- scanRegExp(str, "\"([^\"]*)\"")) {
            // Matches strings enclosed in double quotes
            tokenMatch = tokens
            result.add(Token(CodeOrigin(file, (lineNumber as Int64).getOrThrow()), tokenMatch.getOrThrow()[0]))
        } else {
            print("Lexer error at " + "${(CodeOrigin(file, (lineNumber as Int64).getOrThrow()) as ToString).toString()}")
        }
        
        whitespaceFound = false
        str = str[tokenMatch.getOrThrow()[0].size..str.size]
    }
    

    return result.toArray()
}

// Token identification.
func isRegister( token: Token) : Bool {
    return registerPattern.test(token.string)
}

func isInstruction( token: Token) : Bool {
    return instructionSet.contains(token.string)
}

func isKeyword( token: Token) : Bool {
    return "^((true)|(false)|(if)|(then)|(else)|(elsif)|(end)|(and)|(or)|(not)|(global)|(macro)|(const)|(constexpr)|(sizeof)|(error)|(include))$".test(token.string)
    || isRegister(token)
    || isInstruction(token)
}

func isIdentifier( token: Token) : Bool {
    return "^[a-zA-Z]([a-zA-Z0-9_.]*)$".test(token.string) && !isKeyword(token)
}

func isLabel( token:Any) : Bool {
    var tokenString: String
    if ( (token is Token)) {
        tokenString = (token as Token).getOrThrow().string
    } else {
        tokenString = (token as String).getOrThrow()
    }
    // Matches regular expressions that start with an underscore followed by letters, numbers, or underscores
    return "^_([a-zA-Z0-9_]*)$".test(tokenString)
}

func isLocalLabel( token:Any) : Bool {
    var tokenString : String
    if ( (token is Token)) {
        tokenString = (token as Token).getOrThrow().string
    } else {
        tokenString = (token as String).getOrThrow();
    }
    return "^\\.([a-zA-Z0-9_]*)$".test(tokenString)
}

func isVariable( token:Token) : Bool {
    return isIdentifier(token) || isRegister(token)
}

func isInteger( token:Token) : Bool {
    return "^[0-9]".test(token.string)
}

func isString( token:Token) : Bool {
    return #"^".*""#.test(token.string)
}


// The parser. Takes an array of tokens and returns an AST. Methods
// other than parse(tokens) are not for public consumption.
class Parser{
    var tokens = Array<?Token>()
    var idx: Int64 = 0
    var annotation: ?String
    
    init( data: String ,  fileName: SourceFile) {
        var tmp : Array<Any> = lex(data, fileName)
        var tmp1 : ArrayList<?Token> = ArrayList<?Token>()
        for (each in tmp) {
            tmp1.add(each as Token)

        }
        tokens = tmp1.toArray()
        idx = 0
        annotation = Option<String>.None
    }
    
    func parseError( comment: ?Any) {
        if (tokens[idx].isSome()){
            tokens[idx].getOrThrow().parseError(comment as Any)
        } else {
            if (comment.isSome()) {
                print("Parse error at end of file")
            } else {
                print("Parse error at end of file: " + "${(comment as ToString).toString()}")
            }
        }
    }
    
    func consume( regexp: ?String) {
        if (regexp.isSome()) {
            if (!regexp.getOrThrow().test(tokens[idx].getOrThrow().string)) {
                parseError(Option<Any>.None)
            }
        } else if (idx != tokens.size) {
            parseError(Option<Any>.None)
        }
        idx += 1
    }
    
    func skipNewLine(){
        while (tokens[idx].getOrThrow().isEqualTo("\n")) {
            idx += 1
        }
    }
    
    func parsePredicateAtom() : ?Node {
        if (tokens[idx].getOrThrow().isEqualTo("not")) {
            let codeOrigin = tokens[idx].getOrThrow().codeOrigin
            idx += 1
            let par = parsePredicateAtom()
            if (par.isSome()) {
                return Not(codeOrigin, par.getOrThrow())
            }
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("(")) {
            idx += 1
            skipNewLine()
            let result = parsePredicate();
            if (tokens[idx].getOrThrow().isNotEqualTo(")")) {
                parseError(Option<Any>.None)
            }
            idx += 1
            return result
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("true")) {
            let result = True.instance()
            idx += 1
            return result
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("false")) {
            let result = False.instance()
            idx += 1
            return result
        }
        
        if (isIdentifier(tokens[idx].getOrThrow())) {
            let result = Setting.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string)
            idx += 1
            return result
        }
        parseError(Option<Any>.None)
        return Option<Node>.None
    }
    
    func parsePredicateAnd() : ?Node {
        var result = parsePredicateAtom();
        while (tokens[idx].getOrThrow().isEqualTo("and")) {
            let codeOrigin = tokens[idx].getOrThrow().codeOrigin
            idx += 1
            skipNewLine();
            let right = parsePredicateAtom()
            if (right.isSome()) {
                result = And(codeOrigin, result.getOrThrow(), right.getOrThrow())
            }
        }
        
        return result
    }
    
    func parsePredicate() : ?Node {
      
        
        var result = parsePredicateAnd()
        while (tokens[idx].getOrThrow().isEqualTo("or")) {
            let codeOrigin = tokens[idx].getOrThrow().codeOrigin
            idx += 1
            skipNewLine();
            let right = parsePredicateAnd();
            if (result.isSome() && right.isSome()) {
                result = Or(codeOrigin, result.getOrThrow(), right.getOrThrow())
            }
        }
        
        return result;
    }
    
    func parseVariable() : Node{
        var result: Node = Node(Option<CodeOrigin>.None)
        if (isRegister((tokens[idx].getOrThrow()))) {
            if (fprPattern.test(tokens[idx].getOrThrow().toString() )) {
                result = FPRegisterID.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string)
            } else {
                result = RegisterID.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string)
            }
        } else if (isIdentifier(tokens[idx].getOrThrow())) {
            result = Variable.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string)
        } else {
            parseError(Option<Any>.None)
        }
        
        idx += 1
        return result
    }
    
    // Resolution address
    func parseAddress( offset: Node) : Node{
        if ( tokens[idx].getOrThrow().isNotEqualTo("[")) {
            parseError(Option<Any>.None)
        }
        
        let codeOrigin = tokens[idx].getOrThrow().codeOrigin
        var result : ?Node
        
        // Three possibilities:
        // []       : AbsoluteAddress
        // [a]      : Address
        // [a,b]    : BaseIndex with scale = 1
        // [a,b,c]  : BaseIndex
        
        idx += 1
        if (tokens[idx].getOrThrow().isEqualTo("]")) {
            idx += 1
            return AbsoluteAddress(codeOrigin, offset)
        }
        
        let a = parseVariable()
        if (tokens[idx].getOrThrow().isEqualTo("]")) {
            result =  Address(codeOrigin, a, offset)
        } else {
            if (tokens[idx].getOrThrow().isNotEqualTo(",")) {
                parseError(Option<Any>.None)
            }
            idx += 1
            let b = parseVariable()
            if (tokens[idx].getOrThrow().isEqualTo("]")) {
                result = BaseIndex(codeOrigin, a , b , 1, offset )
            } else {
                if (tokens[idx].getOrThrow().isNotEqualTo(",")) {
                    parseError(Option<Any>.None)
                }
                idx += 1
                if (!["1", "2", "4", "8"].contains(tokens[idx].getOrThrow().string)) {
                    parseError(Option<Any>.None)
                }
                let c =  parseInt(tokens[idx].getOrThrow().toString())
                idx += 1
                if (tokens[idx].getOrThrow().isNotEqualTo("]")) {
                    parseError(Option<Any>.None)
                }
                result = BaseIndex(codeOrigin, a, b, c, offset)
            }
            
        }
        idx += 1
        return result.getOrThrow()
    }
    
    func parseColonColon() : HashMap<String, Any> {
        skipNewLine()
        let firstToken = tokens[idx].getOrThrow()
        let codeOrigin = tokens[idx].getOrThrow().codeOrigin;
        if ( !isIdentifier(firstToken)) {
            parseError(Option<Any>.None)
        }
        
        var names : ArrayList<String> = ArrayList<String>([tokens[idx].getOrThrow().string])
        idx += 1
        while (tokens[idx].getOrThrow().isEqualTo("::")) {
            idx += 1
            if (!isIdentifier(tokens[idx].getOrThrow())) {
                parseError(Option<Any>.None)
            }
            names.add(tokens[idx].getOrThrow().string)
            idx += 1
        }
        if (names.size == 0) {
            firstToken.parseError(Option<Any>.None)
        }
   
        return HashMap<String,Any>([("codeOrigin", codeOrigin), ("names", names.toArray())])
    }
    
    func parseTextInParens() : HashMap<String,Any> {
        skipNewLine()
        let codeOrigin = tokens[idx].getOrThrow().codeOrigin
        if (tokens[idx].getOrThrow().isNotEqualTo("(")){
            print("Missing ( at " + "${codeOrigin.toString()}")
        }
        idx += 1
        // need at least one item
        if (tokens[idx].getOrThrow().isEqualTo(")")) {
            print("No items in list at" + "${codeOrigin.toString()}")
        }
        var numEnclosedParens: Int64 = 0
        var text = ArrayList<String>()
        while ( tokens[idx].getOrThrow().isNotEqualTo(")") || numEnclosedParens > 0) {
            if (tokens[idx].getOrThrow().isEqualTo("(")) {
                numEnclosedParens += 1
            } else if (tokens[idx].getOrThrow().isEqualTo(")")) {
                numEnclosedParens -= 1
            }
            
            text.add(tokens[idx].getOrThrow().string)
            idx += 1
        }
        idx += 1
        return HashMap<String,Any>([("codeOrigin", codeOrigin), ("text", text)])
    }
    
    func parseExpressionAtom() : ?Node {
        var result: ?Node
        skipNewLine()
        if (tokens[idx].getOrThrow().isEqualTo("-")) {
            idx += 1
            return NegImmediate((tokens[idx-1].getOrThrow().codeOrigin), parseExpressionAtom().getOrThrow())
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("~")) {
            idx += 1
            return BitnotImmediate((tokens[idx-1].getOrThrow().codeOrigin), parseExpressionAtom().getOrThrow())
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("(")) {
            idx += 1
            result = parseExpression()
            if (tokens[idx].getOrThrow().isNotEqualTo(")")) {
                parseError(Option<Any>.None)
            }
            idx += 1
            return result
        }
        
        if (isInteger(tokens[idx].getOrThrow())) {
            result = Immediate((tokens[idx].getOrThrow().codeOrigin), UInt64.parse(tokens[idx].getOrThrow().string))
            idx += 1
            return result
        }
        
        if (isString(tokens[idx].getOrThrow())) {
            result = StringLiteral((tokens[idx].getOrThrow().codeOrigin), (tokens[idx].getOrThrow().string))
            idx += 1
            return result
        }
        
        if ( isIdentifier(tokens[idx].getOrThrow())) {
            let dic = parseColonColon()
            let names = (dic["names"] as Array<String>).getOrThrow()
            
            if (names.size > 1) {
                return StructOffset.forField((dic["codeOrigin"] as CodeOrigin).getOrThrow(), String.join(names[0..=names.size - 2],delimiter: "::"), names[names.size - 1]).getOrThrow() as Node
            }
            return Variable.forName((dic["codeOrigin"] as CodeOrigin).getOrThrow(), names[0])
        }
        
        if (isRegister(tokens[idx].getOrThrow())) {
            return parseVariable()
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("sizeof")) {
            idx += 1
            let dic = parseColonColon()
            let co = (dic["codeOrigin"] as CodeOrigin).getOrThrow()
            let names = (dic["names"] as Array<String>).getOrThrow()
            return Sizeof.forName(co, String.join(names,delimiter: "::"))
        }
        
        if (tokens[idx].getOrThrow().isEqualTo("constexpr")) {
            idx += 1
            skipNewLine()
            var codeOrigin: ?CodeOrigin
            var text: ?Array<String>
            var names: ?Array<String>
            var textStr: String = ""
            
            if  (tokens[idx].getOrThrow().isEqualTo("(")) {
                let dic :HashMap<String,Any> = parseTextInParens()
                codeOrigin = (dic["codeOrigin"] as CodeOrigin).getOrThrow()
                text = (dic["text"] as Array<String>).getOrThrow()
      
                textStr = String.join(text.getOrThrow(),delimiter: "::")
            } else {
                let dic :HashMap<String,Any> = parseColonColon()
                codeOrigin = (dic["codeOrigin"] as CodeOrigin).getOrThrow()
                names = (dic["names"] as Array<String>).getOrThrow()
           
                textStr = String.join(names.getOrThrow(),delimiter: "::")
            }
            return ConstExpr.forName(codeOrigin.getOrThrow(), textStr)
        }
        
        if (isLabel(tokens[idx].getOrThrow())) {
            result = LabelReference(tokens[idx].getOrThrow().codeOrigin, Label.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string))
            idx += 1
            return result;
        }
        
        if (isLocalLabel(tokens[idx].getOrThrow() as Any)) {
            result = LocalLabelReference(tokens[idx].getOrThrow().codeOrigin, LocalLabel.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string))
            idx += 1
            return result;
        }
        parseError(Option<Any>.None)
        return Option<Node>.None
    }
    
    func parseExpressionMul() : Node {
        skipNewLine()
        var result = parseExpressionAtom()
        while (tokens[idx].getOrThrow().isEqualTo("*")) {
            if (tokens[idx].getOrThrow().isEqualTo("*")) {
                idx += 1
                result = MulImmediates(tokens[idx-1].getOrThrow().codeOrigin, result.getOrThrow(), parseExpressionAtom().getOrThrow())
            } else {
                print("Invalid token " + "${tokens[idx].getOrThrow().toString()}" + " in multiply expression")
            }
        }
        return result.getOrThrow()
    }
    
    func couldBeExpression() : Bool{
        return tokens[idx].getOrThrow().isEqualTo("-") || tokens[idx].getOrThrow().isEqualTo("~") || tokens[idx].getOrThrow().isEqualTo("constexpr") || tokens[idx].getOrThrow().isEqualTo("sizeof") || isInteger(tokens[idx].getOrThrow()) || isString(tokens[idx].getOrThrow()) || isVariable(tokens[idx].getOrThrow()) || tokens[idx].getOrThrow().isEqualTo("(")
    }
    
    func parseExpressionAdd() : Node {
        skipNewLine()
        var result = parseExpressionMul()
        while (tokens[idx].getOrThrow().isEqualTo("+")  || tokens[idx].getOrThrow().isEqualTo("-")) {
            if (tokens[idx].getOrThrow().isEqualTo("+")){
                idx += 1
                result = AddImmediates(tokens[idx-1].getOrThrow().codeOrigin, result, parseExpressionMul())
            } else if (tokens[idx].getOrThrow().isEqualTo("-")) {
                idx += 1
                result = SubImmediates(tokens[idx-1].getOrThrow().codeOrigin, result , parseExpressionMul())
            } else {
                print("Invalid token " + "${tokens[idx].getOrThrow().toString()}" + " in addition expression")
            }
        }
        return result
    }
    
    func parseExpressionAnd() : Node {
        skipNewLine()
        var result = parseExpressionAdd()
        while (tokens[idx].getOrThrow().isEqualTo("&")) {
            idx += 1
            result = AndImmediates(tokens[idx-1].getOrThrow().codeOrigin, result , parseExpressionAdd())
        }
        return result
    }
    
    func parseExpression() : Node {
        skipNewLine();
        var result = parseExpressionAnd()
        while (tokens[idx].getOrThrow().isEqualTo("|") || tokens[idx].getOrThrow().isEqualTo("^")) {
            if (tokens[idx].getOrThrow().isEqualTo("|")) {
                idx += 1
                result = OrImmediates(tokens[idx-1].getOrThrow().codeOrigin, result, parseExpressionAnd())
            } else if (tokens[idx].getOrThrow().isEqualTo("^")) {
                idx += 1
                result = XorImmediates(tokens[idx-1].getOrThrow().codeOrigin, (result as Immediate).getOrThrow(), (parseExpressionAnd() as Immediate).getOrThrow())
            } else {
                print("Invalid token " + "${ tokens[idx].getOrThrow().toString()}" + " in expression")
            }
        }
        return result
    }
    
    func parseOperand( comment: Any) : Node {
        skipNewLine()
        if (couldBeExpression()) {
            let expr = parseExpression()
            if (tokens[idx].getOrThrow().isEqualTo("[")) {
                return parseAddress(expr)
            }
            return expr
        }
        if (tokens[idx].getOrThrow().isEqualTo("[")) {
            return parseAddress(Immediate(tokens[idx].getOrThrow().codeOrigin, 0))
        }
        if (isLabel(tokens[idx].getOrThrow())) {
            let result = LabelReference(tokens[idx].getOrThrow().codeOrigin, Label.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string))
            idx += 1
            return result
        }
        
        if (isLocalLabel(tokens[idx].getOrThrow())) {
            let result = LocalLabelReference(tokens[idx].getOrThrow().codeOrigin, LocalLabel.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string))
            idx += 1
            return result
        }
        
        parseError(comment)
        return Node(Option<CodeOrigin>.None)
    }
    
    func parseMacroVariables() : Array<Variable> {
        skipNewLine()
        consume("^\\($")
        var variables = ArrayList<Variable>()
        while (true) {
            skipNewLine()
            if ( tokens[idx].getOrThrow().isEqualTo(")")) {
                idx += 1
                break
            } else if (isIdentifier(tokens[idx].getOrThrow())) {
                variables.add(Variable.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string))
                idx += 1
                skipNewLine()
                if ( tokens[idx].getOrThrow().isEqualTo(")")) {
                    idx += 1
                    break
                } else if ( tokens[idx].getOrThrow().isEqualTo(",")) {
                    idx += 1
                } else {
                    parseError(Option<Any>.None)
                }
            } else {
                parseError(Option<Any>.None)
            }
        }
        return variables.toArray()
    }
    
    func parseSequence( final: ?String,  comment: ?Any) : Sequence {
        let firstCodeOrigin = tokens[idx].getOrThrow().codeOrigin
        var list: ArrayList<?Node> = ArrayList<?Node>()
        while (true) {
            if ((idx == tokens.size && final.getOrThrow().size == 0) || (final.getOrThrow().size > 0 && final.getOrThrow().test(tokens[idx].getOrThrow().string))){
                break
            } else if (tokens[idx].getOrThrow() is Annotation) {
                // This is the only place where we can encounter a global
                // annotation, and hence need to be able to distinguish between
                // them.
                // globalAnnotations are the ones that start from column 0. All
                // others are considered localAnnotations.  The only reason to
                // distinguish between them is so that we can format the output
                // nicely as one would expect.
                
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                list.add(Instruction(codeOrigin, "localAnnotation", [], annotatio:tokens[idx].getOrThrow().string))
                annotation = Option<String>.None
                idx += 2
            } else if (tokens[idx].getOrThrow().isEqualTo("\n")) {
                idx += 1
            } else if (tokens[idx].getOrThrow().isEqualTo("const")) {
                idx += 1
                if ( !isVariable(tokens[idx].getOrThrow())) {
                    parseError(Option<Any>.None)
                }
                let variable = Variable.forName(tokens[idx].getOrThrow().codeOrigin, tokens[idx].getOrThrow().string)
                idx += 1
                if (tokens[idx].getOrThrow().isNotEqualTo("=")) {
                    parseError(Option<Any>.None)
                }
                idx += 1
                let value = parseOperand("while inside of const " + "${variable.name}")
                list.add(ConstDecl(tokens[idx].getOrThrow().codeOrigin, variable, value))
            } else if (tokens[idx].getOrThrow().isEqualTo("error")) {
                list.add(Error(tokens[idx].getOrThrow().codeOrigin))
                idx += 1
            } else if ( tokens[idx].getOrThrow().isEqualTo("if")) {
                var codeOrigin = tokens[idx].getOrThrow().codeOrigin
                idx += 1
                skipNewLine()
                var predicate = parsePredicate();
                consume("^((then)|(\n))$")
                skipNewLine()
                var ifThenElse = IfThenElse(codeOrigin, predicate.getOrThrow(), parseSequence("^((else)|(end)|(elsif))$", "while inside of \"if " + predicate.getOrThrow().dump() + "\""))
                list.add(ifThenElse)
                while ( tokens[idx].getOrThrow().isEqualTo("elsif")) {
                    let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                    idx += 1
                    skipNewLine()
                    predicate = parsePredicate()
                    consume("^((then)|(\n))$")
                    skipNewLine()
                    if ( predicate.isSome()) {
                        let elseCase = IfThenElse(codeOrigin, predicate.getOrThrow(), parseSequence("^((else)|(end)|(elsif))$", "while inside of \"if " + predicate.getOrThrow().dump() + "\""))
                        ifThenElse.elseCase = elseCase
                        ifThenElse = elseCase
                    }
                }
                if (tokens[idx].getOrThrow().isEqualTo("else")) {
                    idx += 1
                    ifThenElse.elseCase = parseSequence("^end$", "while inside of else case for \"if " + predicate.getOrThrow().dump() + "\"")
                    idx += 1
                } else {
                    if (tokens[idx].getOrThrow().isNotEqualTo("end")) {
                        parseError(Option<Any>.None)
                    }
                    idx += 1
                }
            } else if (tokens[idx].getOrThrow().isEqualTo("macro")) {
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                idx += 1
                skipNewLine()
                if (!isIdentifier(tokens[idx].getOrThrow())) {
                    parseError(Option<Any>.None)
                }
                let name = tokens[idx].getOrThrow().string
                idx += 1
                let variables = parseMacroVariables();
                let body = parseSequence("^end$", "while inside of macro " + name);
                idx += 1
                list.add(Macro(codeOrigin, name, variables, body))
            } else if (tokens[idx].getOrThrow().isEqualTo("global")) {
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                idx += 1
                skipNewLine()
                let name = tokens[idx].getOrThrow().string
                idx += 1
                Label.setAsGlobal(codeOrigin, name)
            } else if (isInstruction(tokens[idx].getOrThrow())) {
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                let name = tokens[idx].getOrThrow().string
                idx += 1
                if ( (final.getOrThrow().size > 0 && idx == tokens.size) || (final.getOrThrow().size > 0 && final.getOrThrow().test(tokens[idx].getOrThrow().toString()))) {
                    // Zero operand instruction, and it's the last one.
                    list.add(Instruction(codeOrigin, name, [] ,annotatio:annotation))
                    annotation = Option<String>.None
                    break
                } else if (tokens[idx].getOrThrow() is Annotation) {
                    list.add(Instruction(codeOrigin, name, [] ,annotatio:tokens[idx].getOrThrow().string))
                    annotation = Option<String>.None
                    idx += 2  // Consume the newline as well.
                } else if (tokens[idx].getOrThrow().isEqualTo("\n")) {
                    // Zero operand instruction.
                    list.add(Instruction(codeOrigin, name, [], annotatio:annotation))
                    annotation = Option<String>.None
                    idx += 1
                } else {
                    // It's definitely an instruction, and it has at least one operand.
                    var operands: ArrayList<?Node> = ArrayList<?Node>()
                    var endOfSequence = false
                    while (true) {
                        operands.add(parseOperand("while inside of instruction " + name))
                        if ( (final.getOrThrow().size > 0 && idx == tokens.size) || (final.getOrThrow().size > 0 && final.getOrThrow().test(tokens[idx].getOrThrow().string))) {
                            // The end of the instruction and of the sequence.
                            endOfSequence = true;
                            break
                        } else if (tokens[idx].getOrThrow().isEqualTo(",")) {
                            // Has another operand.
                            idx += 1
                        } else if (tokens[idx].getOrThrow() is  Annotation) {
                            annotation = tokens[idx].getOrThrow().string;
                            idx += 2; // Consume the newline as well.
                            break;
                        } else if (tokens[idx].getOrThrow().isEqualTo("\n")) {
                            // The end of the instruction.
                            idx += 1
                            break;
                        } else {
                            print("Expected a comma, newline, or: " + "${final}")
                        }
                    }
                    list.add(Instruction(codeOrigin, name, operands.toArray() , annotatio:annotation))
                    annotation = Option<String>.None
                    if (endOfSequence) {
                        break
                    }
                }
            } else if (isIdentifier(tokens[idx].getOrThrow())) {
                // Check for potential macro invocation:
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                let name = tokens[idx].getOrThrow().string
                idx += 1
                if (tokens[idx].getOrThrow().isEqualTo("(")) {
                    // Macro invocation.
                    idx += 1
                    var operands = ArrayList<?Node>()
                    skipNewLine()
                    if (tokens[idx].getOrThrow().isEqualTo(")")) {
                        idx += 1
                    } else {
                        while (true) {
                            skipNewLine()
                            if (tokens[idx].getOrThrow().isEqualTo("macro")) {
                                // It's a macro lambda!
                                let codeOriginInner = tokens[idx].getOrThrow().codeOrigin
                                idx += 1
                                let variables = parseMacroVariables();
                                let body = parseSequence("^end$", "while inside of anonymous macro passed as argument to " + name)
                                idx += 1
                                operands.add(Macro(codeOriginInner, "", variables, body))
                            } else {
                                operands.add(parseOperand("while inside of macro call to " + name))
                            }
                            
                            skipNewLine()
                            if (tokens[idx].getOrThrow().isEqualTo(")")) {
                                idx += 1
                                break
                            } else if (tokens[idx].getOrThrow().isEqualTo(",")) {
                                idx += 1
                            } else {
                                print("Unexpected " + "${tokens[idx].getOrThrow().toString()}" + "  while parsing invocation of macro " + "${name}")
                            }
                        }
                    }
                    
                    if (tokens[idx].getOrThrow() is Annotation) {
                        annotation = tokens[idx].getOrThrow().string
                        idx += 2
                    }
                    list.add(MacroCall(codeOrigin, name, operands.toArray(), annotation ?? ""))
                    annotation = Option<String>.None
                } else {
                    print("Expected after" + "${name}")
                }
            } else if (isLabel(tokens[idx].getOrThrow()) || isLocalLabel(tokens[idx].getOrThrow())) {
                let codeOrigin = tokens[idx].getOrThrow().codeOrigin
                let name = tokens[idx].getOrThrow().string
                idx += 1
                if (tokens[idx].getOrThrow().isNotEqualTo(":")){
                    parseError(Option<Any>.None)
                }
                if ( isLabel(name)) {
                    list.add(Label.forName(codeOrigin, name, definedInFile:true))
                } else {
                    list.add(LocalLabel.forName(codeOrigin, name))
                }
                idx += 1
            } else if (tokens[idx].getOrThrow().isEqualTo("include")) {
                idx += 1
                if (!isIdentifier(tokens[idx].getOrThrow())) {
                    parseError(Option<Any>.None)
                }
                let moduleName = tokens[idx].getOrThrow().string
                let fileName = IncludeFile(moduleName, tokens[idx].getOrThrow().codeOrigin.fileName()).fileName
                idx += 1
                list.add(parse(fileName))
            } else {
                print("Expecting terminal " + "${final.toString()}" + "${(comment as ToString).toString()}")
            }
        }
        return Sequence(firstCodeOrigin, list.toArray())
    }
    
    func parseIncludes( final: String,  comment: Any) : Array<String> {
        let firstCodeOrigin = tokens[idx].getOrThrow().codeOrigin
        var fileList = ArrayList<String>()
        fileList.add(tokens[idx].getOrThrow().codeOrigin.fileName())
        while (true) {
            if ((idx == tokens.size && final.size > 0) || (final.size > 0 && final.test(tokens[idx].getOrThrow().toString()))) {
                break
            } else if (tokens[idx].getOrThrow().isEqualTo("include")) {
                idx += 1
                if (!isIdentifier(tokens[idx].getOrThrow())) {
                    parseError(Option<Any>.None)
                }
                let moduleName = tokens[idx].getOrThrow().string
                let fileName = IncludeFile(moduleName, tokens[idx].getOrThrow().codeOrigin.fileName()).fileName
                idx += 1
                fileList.add(fileName)
            } else {
                idx += 1
            }
        }
        
        return fileList.toArray()
    }
}

func parseData( data: String,  fileName: String) : Sequence {
    let parser = Parser(data, SourceFile(fileName, Option<Array<String>>.None, Option<Int64>.None))
    return parser.parseSequence("", "")
}

func parse( fileName: String) : Sequence {

    return parseData(File.open(fileName).read(), fileName)
}
