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


let ARRAY_DEFAULT = 11
let RUN_NUM = 14

func sign(x: Int64) : Float64 {
    if (x > 0) {
        return 1.0
    } else {
        if (x < 0) {
            return -1.0
        } else {
            return 0.0
        }
    }
}

class CaselessMap  {

    private var _map: HashMap<String, Any> = HashMap<String, Any>()

    init(otherMap: ?CaselessMap)
    {
        if (let Some(otherMap) <- otherMap) {
            this._map = otherMap._map
        } else {
            this._map = HashMap<String,Any>()
        }
    }

    func set(key: String, value: Any)
    {
       this._map.add(key.toAsciiLower(), value)
    }

    func has(key: String) : Bool
    {
        return this._map.get(key.toAsciiLower()).isSome()
    }

    func get(key: String) : ?Any
    {
        return this._map.get(key.toAsciiLower())
    }


}

open interface Statement {
    public mut prop lineNumber: Int64

    public mut prop sourceLineNumber: Int64
}

open interface VoidStatement <:Statement {

    open public func process(state: State): Unit

}

open interface OutputStatement <:Statement {

    open public func process(state: State): HashMap<String,String>

}

open class LetStatement <: VoidStatement {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var variable: Variable

    var expression: NumericExpression

    init(lineNumber: Int64, sourceLineNumber: Int64, expression: NumericExpression, variable: Variable) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
        this.expression = expression
        this.variable = variable
    }
    
    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
        }
        set(v) {
        }
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
        }
        set(v) {
        }
    }

    override public open func process(state: State): Unit {
        this.variable.evaluate(state).assign(expression.evaluate(state))
    }

}

open class IfStatement <: VoidStatement {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var target: Int64

    var condition: RelationalExpression

    init(lineNumber: Int64, sourceLineNumber: Int64, target: Int64, condition: RelationalExpression) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
        this.target = target
        this.condition = condition
    }
    
    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
        set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }


    override public open func process(state: State): Unit {
        if (condition.evaluate(state)) {
            state.nextLineNumber = target
        }
    }

}

class ForStatementStep {

    var value = 1

    func evaluate() : Int64 {
        return value
    }

}

open class ForStateItem{

    var variable: ?NumberValue = None

    public var initialValue: ?Float64 = None

    public var limitValue: ?Float64 = None

    public var stepValue: ?Float64 = None

    open public mut prop shouldStop: Bool {
        get() {
            (variable.getOrThrow().value - limitValue.getOrThrow()) * sign(Int64(stepValue.getOrThrow())) > 0.0;
	}
	set(v) {
	}
    }
}

open class ForStatement <: VoidStatement & Hashable & Equatable<ForStatement> {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var nextLineNumber: Int64 = 0

    var variable: String

    var initial: NumericExpression

    var limit: NumericExpression

    var step: Any

    var target: ?NextStatement = Option<NextStatement>.None

    init(lineNumber: Int64, sourceLineNumber: Int64, variable: String, initial: NumericExpression, limit: NumericExpression, step: Any) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
        this.variable = variable
        this.initial = initial
        this.limit = limit
        this.step = step
    }
    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
	set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }


    override public open func process(state: State) {
        let sideState = state.getSideState(this)
        sideState.variable = (state.getValue(variable, 0) as NumberValue).getOrThrow().leftApply(state, ArrayList<Float64>([]));
        sideState.initialValue = initial.evaluate(state);
        sideState.limitValue = limit.evaluate(state);
        if (let Some(step) <- (step as NumericExpression)) {
            sideState.stepValue = step.evaluate(state);
        } else {
            sideState.stepValue = 1.0
        }
        sideState.variable.getOrThrow().assign(sideState.initialValue.getOrThrow());
        if (sideState.shouldStop) {
            nextLineNumber = target.getOrThrow().lineNumber + 1
        }
    }
    public open func hashCode(): Int64 {
        return 0
    }

    public operator func == (that: ForStatement) : Bool {
        this.lineNumber == that.lineNumber && this.sourceLineNumber == that.sourceLineNumber
    }

    public operator func != (that: ForStatement): Bool {
        return !(this == that)
    }
}

class NextStatement <: VoidStatement {

    var target: ?ForStatement = Option<ForStatement>.None

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var variable: String

    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
	set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }

    override public open func process(state: State) {
        let sideState = state.getSideState(target.getOrThrow())
        sideState.variable.getOrThrow().assign(sideState.variable.getOrThrow().value + sideState.stepValue.getOrThrow())
        if (sideState.shouldStop) {
            return
        }
        state.nextLineNumber = target.getOrThrow().lineNumber + 1
    }

    init(lineNumber: Int64, sourceLineNumber: Int64, variable: String) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
        this.variable = variable
    }

}

class PrintStatementItem {
    var kind: String

    var value: ?Expression

    init(kind: String, value: ?Expression) {
        this.kind = kind
        this.value = value
    }

}

/// 打印语句
class PrintStatement <: OutputStatement {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var items: ArrayList<PrintStatementItem> = ArrayList<PrintStatementItem>()

    override public open func process(state: State) : HashMap<String,String> {
        var string = ""
        for (item in items) {
            match(item.kind) {
                case "comma" =>
                    while (string.size % RUN_NUM != 0) {
                        string += " "
                    }                   
                case "string" =>
                    string += (item.value.getOrThrow() as StringExpression).getOrThrow().evaluate(state).toString()                   
                case "number" =>
                    string += (item.value.getOrThrow() as NumericExpression).getOrThrow().evaluate(state).toString()
                case _ =>
                    throw NormalError("Bad item kind: " + item.kind);
            }
        }
        return HashMap<String,String>([("output", string)])
    }

    init(lineNumber: Int64, sourceLineNumber: Int64) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
    }

    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
	set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }

}

class DimStatement <: VoidStatement {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    var items: ArrayList<(name: String, bounds: ArrayList<Float64>)> = ArrayList<(name: String, bounds: ArrayList<Float64>)>()

    init(lineNumber: Int64, sourceLineNumber: Int64) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
    }
    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
	set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }


    override public open func process(state: State) {
        for ((name, bounds) in items) {
            let vals = (state.values as CaselessMap).getOrThrow()
            state.validate(!vals.has(name), "Variable ${name} already exists")
            state.validate(bounds.size > 0, "Dim statement is for arrays")
            vals.set(name, NumberArray(dim:map(bounds)))
        }
    }

    func map(array: ArrayList<Float64>): Array<Int64> {
        var arr = ArrayList<Int64>()
        var temp:Int64
       for (i in array) {
            temp = Int64(i) + 1
           arr.add(temp)  
       }
       return arr.toArray()
    }

}

class EndStatement <: VoidStatement {

    var _lineNumber: Int64

    var _sourceLineNumber: Int64

    init(lineNumber: Int64,sourceLineNumber: Int64) {
        this._lineNumber = lineNumber
        this._sourceLineNumber = sourceLineNumber
    }

    open public mut prop lineNumber: Int64 {
        get(){
            this._lineNumber
	}
	set(v) {
	}
    }
    
    open public mut prop sourceLineNumber: Int64 {
        get(){
            this._sourceLineNumber
	}
	set(v) {
	}
    }

    override public open func process(state: State) {
        state.nextLineNumber = Option<Int64>.None
    }

}

class State {

    var values: Any 

    var stringValues: CaselessMap 

    var sideState: HashMap<ForStatement, ForStateItem>

    var statement: ?Statement = Option<Statement>.None

    var nextLineNumber: ?Int64

    var program: Program 

    var rngGenner: RandomGenerator = RandomGenerator()

    init(program: Program) {
        values = CaselessMap(None)
        stringValues = CaselessMap(None)
        sideState = HashMap<ForStatement, ForStateItem>()
        nextLineNumber = 0
        this.program = program
        addNative("abs") { x =>
            if ((x[0]) > 0.0){
                return x[0]
            } else {
                return -x[0]
            }
        }
        addNative("atn") { x => atan(x[0])}
        addNative("cos") { x => cos(x[0])}
        addNative("exp") { x => exp(x[0])}
        addNative("int") { x => Float64(Int64(x[0]))}
        addNative("log") { x => log(x[0])}
        addNative("rnd") {_ =>
            if ( let tmp <- this){
                return rngGenner.createRNGWithFixedSeed()()
            } else {
	    
                return 0.0
	    }
        }
        addNative("sgn") { x => sign(Int64(x[0]))}
        addNative("sin") { x => sin(x[0])}
        addNative("sqr") { x => sqrt(x[0])}
        addNative("tan") { x => tan(x[0])}
    }
    public func addNative(name: String, callback: (Array<Float64>) -> Float64) {
        (values as CaselessMap).getOrThrow().set(name, NativeFunction(callback));
    }

    func getValue(name: String, numParameters: Int64) : Any {
        let values = (values as CaselessMap).getOrThrow()
        var numParameters_l = numParameters
        if (values.has(name)) {
            return values.get(name).getOrThrow()
        }

        let result: ?Any
        if (numParameters == 0) {
            result = NumberValue()
        }
        else {
            var dim = ArrayList<Int64>()
            while (numParameters > 0) {
                numParameters_l -= 1
                dim.add(ARRAY_DEFAULT)
            }
            result = NumberArray(dim:dim.toArray())
        }
        values.set(name, result.getOrThrow())
        return result.getOrThrow()
    }

    func getSideState(key: ForStatement) : ForStateItem {
        if (sideState.get(key).isNone()) {
            let result = ForStateItem()
            sideState[key] = result
            return result
        }
        return sideState[key]
    }

    func abort(text: String):String {
        if (statement.isNone()) {
            throw NormalError("At beginning of execution: ${text}")
        }
        throw NormalError("At ${statement.getOrThrow().sourceLineNumber}:  ${text}");
    }

    func validate(predicate: Bool, text: String) {
        if (!predicate) {
            try{
                abort(text)
            }catch(e:Exception){
	    
           }
        }
    }
}

/// 数字元素
open class NumberValue {
    var _value: Float64

    open public mut prop value: Float64 {
        get() {
	    this._value
	}
	set(v) {
	    _value = v
	}
    }


    init(value!: Float64 = 0.0) {
        _value = value
    }

    public open func apply(state: State, parameters: Array<Float64>): Float64 {
        state.validate(parameters.size == 0, "Should not pass arguments to simple numeric variables")
        return this._value
    }

    public open func leftApply(state: State, parameters: ArrayList<Float64>): NumberValue {
        state.validate(Int32(parameters.size) == 0, "Should not pass arguments to simple numeric variables")
        return this
    }

    public open func assign(value: Float64): Unit {
        this._value = value
    }
}

// 多维数组
class NumberArray {

    var _dim: Array<Int64>

    var _array: Array<Any>  /// NumberValue | NumberArray

    init(dim!: Array<Int64> = [ARRAY_DEFAULT]) {
        func allocateDim(index: Int64) : Array<Any>
        {
            var result = Array<Any>(dim[index], repeat: Int64(0))
            if (index + 1 < dim.size) {
                for (i in 0..dim[index]){
                    result[i] = allocateDim(index + 1)
                }
            } else {
                for (i in 0..dim[index]) {
                    result[i] = NumberValue()
                }
            }
            return result
        }
        _array = allocateDim(0);
        _dim = dim;
    }

     public open func apply(state: State, parameters: Array<Float64>): Float64 {
        return this.leftApply(state, parameters).apply(state, [])
    }

    func leftApply(state: State, parameters: Array<Float64>): NumberValue
    {
        if (_dim.size != parameters.size) {
            state.abort("Expected ${_dim.size} arguments but ${parameters.size} were passed.")
        }
        var result: Any = _array
        for (i in 0..parameters.size) {
            let index = Int64(parameters[i])
            if (!(index >= state.program.base) || !(index < (result as Array<Any>).getOrThrow().size)) {
                try{
                    state.abort("Index out of bounds: ${index}")
                }catch(e:Exception){
                }
            }
            result = (result as Array<Any>).getOrThrow()[index]
        }
        return (result as NumberValue).getOrThrow()
    }

}

class NativeFunction {

    var _callback: (Array<Float64>) -> Float64

    init(callback: (Array<Float64>) -> Float64)
    {
        _callback = callback
    }

    func apply(state: State, parameters: Array<Float64>): Float64
    {
        return _callback(parameters);
    }

    func leftApply(state: State, parameters: ?Float64)
    {
        state.abort("Cannot use a native function as an lvalue")
    }
}

abstract class Expression {}

/// 数字表达式
abstract class NumericExpression <: Expression {

    public func evaluate(state: State) : Float64

}

/// 字符串表达式
abstract class StringExpression <: Expression {

    public func evaluate(state: State): String

}

class PrimaryExpression <: NumericExpression {

    var name: String

    var parameters: ArrayList<NumericExpression>

    init(name: String, parameters: ArrayList<NumericExpression>) {
        this.name = name
        this.parameters = parameters
    }

    public func evaluate(state: State): Float64 {
        let parameters = map(this.parameters,state)
        let fun = state.getValue(name, parameters.size)
        if (let Some(fun) <- (fun as NumberValue)) {
            return fun.apply(state, parameters)
        }
        if (let Some(fun) <- (fun as NumberArray)) {
            return fun.apply(state, parameters)
        }
        if (let Some(fun) <- (fun as NativeFunction)) {
            return fun.apply(state, parameters)
        }
        return 0.0
    }
    func map(array: ArrayList<NumericExpression>,state: State): Array<Float64> {
       var arr = ArrayList<Float64>()
       for (e in array) {
            var temp = e.evaluate(state)
            arr.add(temp)  
       }
       return arr.toArray()
    }

}

/// Factor pow表达式
class FactorExpression <: NumericExpression {

    var left: NumericExpression

    var right: NumericExpression

    public func evaluate(state: State) : Float64 {
        let lf = left.evaluate(state)
        let rg = right.evaluate(state)
        return pow(lf, rg)
    }

    init(left: NumericExpression, right: NumericExpression) {
        this.left = left
        this.right = right
    }

}

class NumberNegExpression <: NumericExpression {

    var term: NumericExpression

    public func evaluate(state: State) : Float64 {
        return -term.evaluate(state)
    }

    init(term: NumericExpression) {
        this.term = term
    }

}

class NumberAddExpression <: NumericExpression {

    var left:NumericExpression

    var right:NumericExpression

    init(left:NumericExpression, right: NumericExpression) {
        this.left = left
        this.right = right
    }

    public func evaluate(state: State) : Float64 {
        let lf = left.evaluate(state)
        let rg = right.evaluate(state)
        return lf + rg
    }

}

class NumberSubExpression <: NumericExpression {

    var left: NumericExpression

    var right: NumericExpression

    init(left:  NumericExpression, right: NumericExpression) {
        this.left = left
        this.right = right
    }

    public func evaluate(state: State) : Float64 {
        let lf = left.evaluate(state)
        let rg = right.evaluate(state)
        return lf - rg
    }

}


class Variable {

    var name: String

    var parameters: ArrayList<NumericExpression>

    init(name: String, parameters: ArrayList<NumericExpression>) {
        this.name = name
        this.parameters = parameters
    }

    public func evaluate(state: State) : NumberValue {
        let parameters = map(this.parameters,state)
        let val = state.getValue(name, parameters.size)
        if (let Some(val) <- (val as NumberArray)) {
            return val.leftApply(state, parameters)
        }
        return (val as NumberValue).getOrThrow()
    }
    func map(array: ArrayList<NumericExpression>,state: State): Array<Float64> {
       var arr = ArrayList<Float64>()
       for (e in array) {
            var temp = e.evaluate(state)
            arr.add(temp)  
       }
       return arr.toArray()
    }

}

/// 数字常量 在这里确定数字具体类型
class ConstNumberExpression <: NumericExpression {

    var value: Float64

    init(value: Float64) {
        this.value = value
    }

    public func evaluate(state: State) : Float64 {
        return value
    }

}

/// 乘法表达式
class NumberMulExpression <: NumericExpression {

    var left: NumericExpression

    var right: NumericExpression

    public func evaluate(state: State) : Float64 {
        let lf = left.evaluate(state)
        let rg = right.evaluate(state)
        return lf * rg
    }

    init(left: NumericExpression, right: NumericExpression) {
        this.left = left
        this.right = right
    }

}

/// 除法表达式
class NumberDivExpression <: NumericExpression {

    var left: NumericExpression

    var right: NumericExpression

    public func evaluate(state: State) : Float64 {
        let lf = left.evaluate(state)
        let rg = right.evaluate(state)
        return lf / rg
    }

    init(left: NumericExpression, right: NumericExpression) {
        this.left = left
        this.right = right
    }

}

class StringConstExpression <: StringExpression {

    var value: String

    init(value: String) {
        this.value = value
    }

    override public open func evaluate(state: State) : String {
        return value
    }

}

class StringVarExpression <: StringExpression {

    var name: String

    init(name: String) {
        this.name = name
    }

    public func evaluate(state: State) : String {
        if (let Some(value) <- state.stringValues.get(name)) {
            return (value as String).getOrThrow()
        } else {
            state.abort("Could not find string variable ${name}")
            return ""
        }
    }

}

/// 关系表达式
class RelationalExpression <: Expression {

    var identify: String

    var left: Expression

    var right: Expression

    init(identify: String, left: Expression, right: Expression) {
        this.identify = identify
        this.left = left
        this.right = right
    }

    
    func evaluate(state: State) : Bool {
         let lf = left as NumericExpression
         let rg = right as NumericExpression
	  
         if (lf.isSome() && rg.isSome()) {            
            let lfr = lf.getOrThrow().evaluate(state)
            let rgr = rg.getOrThrow().evaluate(state)
            match (identify) {
            case "=" =>
                return lfr == rgr
            case "<>" =>
                return lfr != rgr
            case "<" =>
                return lfr < rgr
            case ">" =>
                return lfr > rgr
            case "<=" =>
                return lfr <= rgr
            case ">=" =>
                return lfr >= rgr
            case _ =>
                return false
            }
        }else {
            let lf = (left as StringExpression).getOrThrow()
            let rg = (left as StringExpression).getOrThrow()
            let lfs = lf.evaluate(state)
            let rgs = rg.evaluate(state)
            match (identify) {
            case "=" =>
                return lfs == rgs
            case "<>" =>
                return lfs != rgs
            case _ =>
                return false
            }
        }
    }

}

class Parse {

    var program: Program

    var lexer: Lexer

    var pushBackBuffer: ArrayList<Token> = ArrayList<Token>()
    init(lexer: Lexer) {
        this.lexer = lexer
        this.program = Program()
    }

    func nextToken() : Token {
        if (pushBackBuffer.size > 0) {
            return pushBackBuffer.remove(at: pushBackBuffer.size-1)
        }
        let result = lexer.next()
        if (let result <- result) {
            return result.getOrThrow()
        } else {
            return Token("endOfFile", "<end of file>", Option<Int64>.None, Option<Int64>.None)
        }
    }

    func pushToken(token: Token) {
        pushBackBuffer.add(token)
    }

    func peekToken() : Token {
        let result = nextToken()
        pushToken(result)
        return result
    }

    func consumeKind(kind: String): Token {
        let token = nextToken()
        if (token.kind != kind) {
            throw NormalError("kAt ${token.sourceLineNumber ?? -1}: expected ${kind} but got: ${token.string}")
        }
        return token
    }

    func consumeToken(string: String) : Token {
        let token = nextToken()
        if (token.string.toAsciiLower() != string.toAsciiLower()) {
            throw NormalError("At ${token.sourceLineNumber ?? -1}: expected ${string} but got: ${token.string}")
        }
        return token
    }

    func parseVariable(): Variable {
        let name = consumeKind("identifier").string
        let result = Variable(name, ArrayList<NumericExpression>())
        if (peekToken().string == "(") {
            do {
                _ = nextToken()
                result.parameters.add(parseNumericExpression())
            } while (peekToken().string == ",")
            _ = consumeToken(")")
        }
        return result
    }

    func parseNumericExpression():NumericExpression {
        var negate = false
        match (peekToken().string) {
        case "+" =>
            _ = nextToken()
        case "-" =>
            negate = true
            _ = nextToken()
        case _ => ()
        }
        var term: NumericExpression = parseTerm()
        if (negate) {
            term = NumberNegExpression(term)
        }
        var ok = true
        while (ok) {
            match (peekToken().string) {
            case "+" =>
                _ = nextToken()
                term = NumberAddExpression(term, parseTerm())
            case "-" =>
                _ = nextToken()
                term = NumberSubExpression(term, parseTerm())
            case _ =>
                ok = false
            }
        }
        return term

    }

    func parsePrimary(): NumericExpression {
        let token = nextToken()
        match (token.kind) {
        case "identifier" =>
            let result = PrimaryExpression(token.string, ArrayList<NumericExpression>())
            if (peekToken().string == "(") {
                do {
                    _ = nextToken()
                    result.parameters.add(parseNumericExpression())
                } while (peekToken().string == ",")
                _ = consumeToken(")")
            }

            return result
        case "number" =>
            return ConstNumberExpression((token.value.getOrThrow() as Float64).getOrThrow())
        case "operator" =>
            match (token.string) {
            case "(" =>
                let result = parseNumericExpression()
                _ = consumeToken(")")
                return result
            case _ => ()
            }
        case _ => ()
        }
        throw NormalError("At ${token.sourceLineNumber.getOrThrow()}: expected identifier, number, or (, but got: ${token.string}")
    }

    /// factor => primary (^ primary)...
    func parseFactor() : NumericExpression {
        var primary: NumericExpression = parsePrimary()
        var ok = true
        while (ok) {
            match (peekToken().string) {
            case "^" =>
                _ = nextToken()
                    primary = FactorExpression(primary, parsePrimary())
            case _ =>
                ok = false
            }
        }
        return primary
    }

    /// term = factor (*|/ factor)...
    func parseTerm(): NumericExpression {
        var factor: NumericExpression = parseFactor()
        var ok = true
        while (ok) {
            match (peekToken().string) {
            case "*" =>
                _ = nextToken()
                factor = NumberMulExpression(factor, parseFactor())
            case "/" =>
                _ = nextToken()
                factor = NumberDivExpression(factor, parseFactor())
            case _ =>
                ok = false
            }
        }
        return factor
    }

    func parseStringExpression() : StringExpression {
        let token = nextToken()
        let tokenValue = match (token as Token){
            case Some(v) => v.value
            case None => throw Exception("Not Token")
        }
        match (token.kind) {
        case "string" =>
            return StringConstExpression((token.value.getOrThrow() as String).getOrThrow())
        case "identifier" =>
            _ = consumeToken("$")
            return StringVarExpression(token.string)
        case _ =>
            throw NormalError("At ${token.sourceLineNumber.getOrThrow()}: expected string expression but got ${token.string}")
        }
    }

    func isStringExpression() : Bool {
        let token = nextToken()
        if (token.kind == "string") {
            pushToken(token)
            return true
        }
        if (token.kind == "identifier") {
            let result = peekToken().string == "$"
            pushToken(token)
            return result
        }
        pushToken(token)
        return false
    }

    func parseRelationalExpress() : RelationalExpression {
        if (isStringExpression()) {
            let left = parseStringExpression()
            let op = nextToken()
            return RelationalExpression(op.string, left, parseStringExpression())
        }
        let left = parseNumericExpression()
        let op = nextToken()
        return RelationalExpression(op.string, left, parseNumericExpression())
    }

    func parseNonNegativeInteger(): Float64 {
        let token = nextToken()
        let reg = Regex("^[0-9]+$")
        if (reg.matcher(token.string).matchStart().isNone()){
            throw NormalError("At ${token.sourceLineNumber.getOrThrow()}: expected a line number but got: ${token.string}")
        }
        return (token.value.getOrThrow() as Float64).getOrThrow()
    }

    func parseStatement(): Statement {
        var statement: ?Statement = Option<Statement>.None
        let lineNumber = consumeKind("userLineNumber").userLineNumber
        let command = nextToken()
        let sourceLineNumber = command.sourceLineNumber.getOrThrow()
        match (command.kind) {
        case "keyword" =>
            match (command.string.toAsciiLower()) {
            case "let" =>
                let variable = parseVariable()
                _ = consumeToken("=")
                statement = LetStatement(lineNumber.getOrThrow(), sourceLineNumber, parseNumericExpression(), variable)
            case "if" =>
                let condition = parseRelationalExpress()
                _ = consumeToken("then")
                statement = IfStatement(lineNumber.getOrThrow(), sourceLineNumber, Int64(parseNonNegativeInteger()), condition)
            case "for" =>
                return parseForStatements(lineNumber.getOrThrow(), sourceLineNumber)
            case "next" =>
                statement = NextStatement(lineNumber.getOrThrow(), sourceLineNumber, consumeKind("identifier").string)
            case "print" =>        
                statement = parsePrintStatements(lineNumber.getOrThrow(), sourceLineNumber)
            case "dim" =>
                statement = parseDimStatement(lineNumber.getOrThrow(), sourceLineNumber)
            case "end" =>
                statement = EndStatement(lineNumber.getOrThrow(), sourceLineNumber)
            case _ =>
                throw NormalError("At ${command.sourceLineNumber.getOrThrow()}: unexpected command but got: ${command.string}");
            }
        case "remark" => ()
        case _ =>
            throw NormalError("cAt ${command.sourceLineNumber.getOrThrow()}: expected command but got: ${command.string} (of kind ${command.kind})")
        }
        _ = consumeKind("newLine")

        program.statements.add(Int64(statement.getOrThrow().lineNumber), statement.getOrThrow())
        return statement.getOrThrow()
    }

    func parseForStatements(lineNumber: Int64, sourceLineNumber: Int64) : Statement {
        let variable = consumeKind("identifier").string
        _ = consumeToken("=")
        let initial = parseNumericExpression()
         _ = consumeToken("to")
        let limit = parseNumericExpression()
        var step: Any
        if (peekToken().string == "step"){
            _ = nextToken()
            step = parseNumericExpression()
        } else {
            step = 1
        }
        let statement = ForStatement(lineNumber, sourceLineNumber, variable, initial, limit, step)
        _ = consumeKind("newLine")
        let lastStatement = parseStatements()
        if (let Some(lastStatement) <- (lastStatement as NextStatement)) {
            if (lastStatement.variable != (statement as ForStatement).getOrThrow().variable) {
                throw NormalError("At ${lastStatement.sourceLineNumber}: expected next for ${(statement as ForStatement).getOrThrow().variable} but got ${lastStatement.variable}");
            } else {
                lastStatement.target = (statement as ForStatement).getOrThrow()
                match(statement as ForStatement){
                    case Some(v) => v.target = lastStatement
                    case None => throw Exception("Not ForStatement")
                }
                program.statements[lineNumber] = statement
                return statement

            }
        } else {
            throw NormalError("At ${lastStatement.sourceLineNumber.toString()}: expected next statement")
        }
    }

    func parsePrintStatements(lineNumber: Int64, sourceLineNumber: Int64) : Statement {
        let statement = PrintStatement(lineNumber, sourceLineNumber)
        var ok = true
        while (ok) {
            match (peekToken().string) {
            case "," =>
                _ = nextToken()
                statement.items.add(PrintStatementItem("comma", Option<Expression>.None))
            case ";" =>
                _ = nextToken()
            case "tab" =>
                _ = nextToken()
                try {_ = consumeToken("(")}catch(e:Exception){}
                statement.items.add(PrintStatementItem("tab", Some(parseNumericExpression())))
            case "\n" =>
                ok = false
            case _ =>
                if (isStringExpression()) {
                    statement.items.add(PrintStatementItem("string", Some(parseStringExpression())))
                    break
                } else {
                    statement.items.add(PrintStatementItem("number", Some(parseNumericExpression())))
                    break
                }
            }
        }
        return statement
    }

    func parseDimStatement(lineNumber: Int64, sourceLineNumber: Int64) : Statement {
        let statement = DimStatement(lineNumber, sourceLineNumber)
        while (true) {
            let name = consumeKind("identifier").string
            _ = consumeToken("(")
            var bounds = ArrayList<Float64>()
            bounds.add(parseNonNegativeInteger())
            if (peekToken().string == ",") {
                _ = nextToken()
                bounds.add(parseNonNegativeInteger())
            }
            _ = consumeToken(")")
            statement.items.add((name, bounds))
            if (peekToken().string != ",") {
                break
            }
            _ = consumeToken(",")
        }
        return statement
    }

    func parseStatements() : Statement {
        var statement_: Statement
        do {
            statement_ = parseStatement()

        } while (!(statement_ is EndStatement) && !(statement_ is NextStatement))
        return statement_
    }

    func parse() : Program{
        let lastStatement = parseStatements()
        if (!(lastStatement is EndStatement)) {
            throw NormalError("At ${lastStatement.sourceLineNumber.toString()}: expected end")
        }
        return program
    }
}

class Program {

    var base = 0
    var count:Int64 = 0
    var statements: HashMap<Int64, Statement>

    init() {
        statements = HashMap<Int64,Statement>()
    }

    func process(state: State) {
        state.validate(refEq(state.program, this), "State must match program")
        let maxLineNumber = max(statements.keys())
        while (state.nextLineNumber.isSome()) {
            state.validate(state.nextLineNumber.getOrThrow() <= maxLineNumber, "Went out of bounds of the program")
            var statement = statements.get(state.nextLineNumber.getOrThrow())

            state.nextLineNumber = Some(state.nextLineNumber.getOrThrow() + 1)
            if (statement.isNone()) {
                continue
            }
            state.statement = statement
            if (let Some(statement) <-(statement.getOrThrow() as PrintStatement)){
               
                let output:HashMap<String,String> = statement.process(state)
                if (DEBUG) {
                    print((output.values() |> first).getOrThrow())
                }
            } else if ( let Some(statement) <-(statement.getOrThrow() as VoidStatement) ){
                statement.process(state)
            } else {
                continue
            }

        }
    }

    func max(array:EquatableCollection<Int64>):Int64{
        var arr:ArrayList<Int64> = ArrayList<Int64>()
        for (a in array){
            arr.add(a)
        }
        arr.sortBy(stable: false){
            rht: Int64,lht:Int64 =>
            if (rht < lht){
                return Ordering.LT
            }
            if (rht > lht){
                return Ordering.GT
            }
            return Ordering.EQ
        }
        var maxValue = arr[arr.size-1]
        return maxValue
    }
}
