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
import std.convert.*
import std.regex.*
import std.math.*
import std.random.*


/*
 * Base utility types for the AST.
 *
 * Valid methods for Node:
 *
 * node.children : Returns an array of immediate children.  It has been modified
 *     from the original Ruby version to dump directly nearly the original source.
 *
 * node.descendents : Returns an array of all strict descendants (children
 *     and children of children, transitively).
 *
 */

class SourceFile {
    var fileName: String
    var fileNames = ArrayList<String>()
    var fileNumber: Int64
    
    init(fileNam: String, fileNams: ?Array<String>, fileNumbe: ?Int64) {
        fileName = fileNam
        var fileNum = indexFirst(fileNames, fileNam)
        if ( (fileNum.isNone())) {
            fileNames.add(fileName)
            fileNum = fileNames.size
        } else {
            fileNum = Some(fileNum.getOrThrow() + 1)  // File numbers are 1 based
        }
        fileNumber = fileNum.getOrThrow()
    }
    
    func name() : String {
        return fileName
    }
}

public func indexFirst(arr:ArrayList<String>,target:String):?Int64{
    var first = -1
    var flg = false
    for(i in 0..arr.size){
        if(arr[i] == target && !flg){
            first = i
            flg = true
            break
        }
    }
    return first
}

/*
 * Define CodeOrigin class for w file path data processing
 */
class CodeOrigin {
    var sourceFile: SourceFile
    var lineNumber: Int64
    
    init(sourceFil: SourceFile, lineNumbe: Int64) {
        this.sourceFile = sourceFil
        this.lineNumber = lineNumbe
    }
    
    func fileName() : String {
        return sourceFile.name()
    }
    
    func toString() : String {
        return fileName() + ":" + lineNumber.toString()
    }
}

public open class Node {
    let codeOrigin: ?CodeOrigin
    var isAddress: Bool = false
    var isLabel: Bool = false
    var isImmediate: Bool = false
    var isImmediateOperand: Bool = false
    var isRegister: Bool = false
    
    init(codeOrig  : ?CodeOrigin) {
        codeOrigin = codeOrig
    }
    
    func codeOriginString() : String {
        if (codeOrigin.isSome()){
            return codeOrigin.getOrThrow().toString()
        }else{
            return ""
        }
    }
    
    public open func children() : Array<?Node> {
        return Array<?Node>()
    }
    
    public open func dump() : String {
        return codeOriginString()
    }
    
    public open func value() : String {
        return ""
    }
}

/*
 * NoChild class, that is, leaf node of tree structure
 */
public open class NoChildren <: Node {
    init(codeOrig: ? CodeOrigin) {
        super(codeOrig)
    }
    override public open func children() : Array<?Node> {
        return Array<?Node>()
    }
}

func structOffsetKey(astStruct: String, field: String) : String {
    return astStruct + "::" + field
}

class StructOffset <: NoChildren {
    static var mapping = HashMap<String, StructOffset>()
    var astStruct: String
    var field: String
    
    init(codeOrigin:CodeOrigin, astStruc: String, fiel: String) {
        super(codeOrigin)
        astStruct = astStruc
        field = fiel
                
        isAddress = false
        isLabel = false
        isImmediate = true
        isRegister = false
    }
    
    static func forField(codeOrigin: CodeOrigin, astStruct: String, field: String) : ?StructOffset {
        let key = structOffsetKey(astStruct, field)
        if ( (StructOffset.mapping.get(key).isNone())) {
            StructOffset.mapping.add(key ,StructOffset(codeOrigin,  astStruct,  field))
        }
        return StructOffset.mapping.get(key)
    }
    
    static func resetMappings() {
        StructOffset.mapping = HashMap<String, StructOffset>()
    }
    
    override public func dump() : String {
        return astStruct + "::" + field
    }
}

class Sizeof <: NoChildren {
    static var mapping = HashMap<String, Sizeof>()
    let astStruct: String
    
    init(codeOrigin: CodeOrigin, astStruc: String) {
        super(codeOrigin)    
        astStruct = astStruc
        
    }
    
    static func forName(codeOrigin: CodeOrigin, astStruct: String) : Sizeof {
        if ( (Sizeof.mapping.get(astStruct).isNone())) {
            Sizeof.mapping.add(astStruct, Sizeof(codeOrigin, astStruct))
        }
        return Sizeof.mapping.get(astStruct).getOrThrow()
    }
    
    static func resetMappings() {
        Sizeof.mapping = HashMap<String, Sizeof>()
    }
    
    override public func dump() : String {
        return "sizeof " + astStruct
    }
}

class Immediate <: NoChildren {
    let values: UInt64
    
    init(codeOrigin: ?CodeOrigin, valu: UInt64) {
        super(codeOrigin.getOrThrow())
        values = valu
        
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = true
        isRegister = false
    }
    
    override public func dump() : String {
        return values.toString()
    }
    
    func equals(other: Immediate) : Bool {
        return other.values == this.values
    }
}

class AddImmediates <: Node {
    var left: ?Node
    var right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node, righ: ?Node) {
        super(codeOrigin)
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = true
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        return [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " + " + "${right.getOrThrow().dump()}" + ")"
    }
    
    override public func value() : String {
        return left.getOrThrow().value() + right.getOrThrow().value()
    }
}

class SubImmediates <: Node {
    let left: ?Node
    let right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node, righ: ?Node) {
        super(codeOrigin)
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = true
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " - " + "${right.getOrThrow().dump()}" + ")"
    }
    
    override public func value() : String {
        return left.getOrThrow().value() + "-" + right.getOrThrow().value()
    }
}

class MulImmediates <: Node {
    let left: ?Node
    let right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node, righ: ?Node) {
        super(codeOrigin)
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " * " + "${right.getOrThrow().dump()}" + ")"
    }
}

class NegImmediate <: Node {
    let child: ?Node
    
    init(codeOrigin: CodeOrigin, chil: ?Node) {
        super(codeOrigin)
        child = chil
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        return [this.child]
    }
    
    override public func dump() : String {
        return "(-" + child.getOrThrow().dump() + ")"
    }
}

class OrImmediates <: Node {
    var left: ?Node
    var right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node, righ: ?Node) {
        super(codeOrigin)
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        return [this.left, this.right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " | " + "${right.getOrThrow().dump()}" + ")"
    }
}

class AndImmediates <: Node {
    let left: ?Node
    let right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node, righ: ?Node) {
        super(codeOrigin) 
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
        
    }
    
    override public func children() : Array<?Node> {
        [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " & " + "${right.getOrThrow().dump()}" + ")"
    }
}

class XorImmediates <: Node {
    let left: ?Node
    let right: ?Node
    
    init(codeOrigin: CodeOrigin, lef: ?Node,righ: ?Node) {
        super(codeOrigin)
        left = lef
        right = righ
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " ^ " + "${right.getOrThrow().dump()}" + ")"
    }
}

class BitnotImmediate <: Node {
    let child: ?Node
    
    init(codeOrigin: CodeOrigin,chil: ?Node) {
        super(codeOrigin)
        child = chil
	
        isAddress = false
        isLabel = false
        isImmediate = true
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        return [child]
    }
    
    override public func dump() : String {
        return "(~" + "${child.getOrThrow().dump()}" + ")"
    }
}

class StringLiteral <: NoChildren {
    let values: String
    
    init(codeOrigin: CodeOrigin,valu: String) {
        super(codeOrigin)
        values = valu[1..Int64(Int32(valu.size) - 1)]
        
        
        if ( (!valu.startsWith("\"") || !valu.endsWith("\""))) {
            print("Bad string literal " + "${values}" + " at " + "${codeOriginString()}")
        }
        
        isAddress = false
        isLabel = false
        isImmediate = false
        isImmediateOperand = false
        isRegister = false
    }
    
    override public func dump() : String {
        return "\"" + "${values}" + "\""
    }
    
    func equals(other: StringLiteral) : Bool {
        return other.values == values
    }
}

class RegisterID <: NoChildren {
    static var mapping = HashMap<String, RegisterID>()
    let name: String
    
    init(codeOrigin: CodeOrigin,nam: String) {
        super(codeOrigin)
        name = nam
	
        isAddress = false
        isLabel = false
        isImmediate = false
        isRegister = true
    }
    
    static func forName(codeOrigin: CodeOrigin,name: String) : RegisterID {
        if ( (RegisterID.mapping.get(name).isNone())) {
            RegisterID.mapping.add(name, RegisterID( codeOrigin, name))
        }
        return RegisterID.mapping.get(name).getOrThrow()
    }
    
    override public func dump() : String {
        return name
    }
}

class FPRegisterID <: NoChildren {
    static var mapping = HashMap<String, FPRegisterID>()
    let name: String
    
    init(codeOrigin: CodeOrigin, nam: String) {
        super(codeOrigin)
        name = nam
	
        isAddress = false
        isLabel = false
        isImmediate = false
        isImmediateOperand = false
        isRegister = true
    }
    
    static func forName(codeOrigin: CodeOrigin, name: String) : FPRegisterID {
        if ( (FPRegisterID.mapping.get(name).isNone())) {
            FPRegisterID.mapping.add(name, FPRegisterID(codeOrigin, name))
        }
        return FPRegisterID.mapping.get(name).getOrThrow()
    }
    
    override public func dump() : String {
        return name
    }
}

class SpecialRegister <: NoChildren {
    let name: String
    
    init(nam: String) {
        super(Option<CodeOrigin>.None)
        name = nam
	
        isAddress = false
        isLabel = false
        isImmediate = false
        isImmediateOperand = false
        isRegister = true
    }
}

class Variable <: NoChildren {
    static var mapping = HashMap<String, Variable>()
    let name: String
    
    init(codeOrigin: CodeOrigin, nam: String) {
        super(codeOrigin)
        name = nam
	
    }
    
    static func forName(codeOrigin: CodeOrigin,name: String) : Variable {
        if ( (Variable.mapping.get(name).isNone())) {
            Variable.mapping.add(name, Variable( codeOrigin,  name))
        }
        return Variable.mapping.get(name).getOrThrow()
    }
    
    override public func dump() : String {
        return name
    }
    
    func inspect() : String {
        return "<variable " + "${name}" + " at " + "\${String(describing: codeOriginString)}"
    }
}

class Address <: Node {
    let base: Node
    let offset: ?Node
    
    init(codeOrigin: ?CodeOrigin, bas: Node, offse: ?Node) {
        super(codeOrigin)
        base = bas
        offset = offse
	
        if ( (!(base is Variable) && !base.isRegister) ) {
            print("Bad base for address " + "${(base.codeOriginString as ToString).toString()}" + " at " + "${codeOrigin?.toString() ?? ""}")
        }
        if ( (!(offset.getOrThrow() is Variable) && !offset.getOrThrow().isImmediate)) {
            print("Bad offset for address " + "${(offset.getOrThrow().codeOriginString() as String).toString()}" + " at " + "${codeOrigin?.toString() ?? ""}")
        }
        
        isAddress = true
        isLabel = false
        isImmediate = false
        isImmediateOperand = true
        isRegister = false
    }
    
    override public func children() : Array<?Node> {
        return [base, offset]
    }
    
    override public func dump() : String {
        return offset.getOrThrow().dump() + "[" + "${base.dump()}" + "]"
    }
}

class BaseIndex <: Node {
    let base: Node
    let index: Node
    let scale: Int64
    let offset: ?Node
    
    init(codeOrigin: ?CodeOrigin, bas: Node, inde: Node, scal: Int64, offse: ?Node) {
        super(codeOrigin)
        base = bas
        index = inde
        scale = scal
        offset = offse
	
        
        
        if ( (![1, 2, 4, 8].contains(scale))) {
            print("Bad scale " + "${scale}" + " at " + "${(codeOriginString as ToString).toString()}")
        }
        isAddress = true
        isLabel = false
        isImmediate = false
        isImmediateOperand = false
        isRegister = false
    }
    
    func scaleShift() : ?Int64 {
        match (scale) {
        case 1 =>
            return 0
        case 2 =>
            return 1
        case 4 =>
            return 2
        case 8 =>
            return 3
        case _ =>
            print("Bad scale " + "${scale}" + " at " + "${(codeOriginString as ToString).toString()}")
            return Option<Int64>.None
        }
    }
    
    override public func children() : Array<?Node> {
        return [base, index, offset]
    }
    
    override public func dump() : String {
        return offset.getOrThrow().dump() + "[" + "${base.dump()}" + ", " + "${index.dump()}" + ", " + "${scale}" + "]"
    }
}

class AbsoluteAddress <: NoChildren {
    var address: ?Node
    
    init(codeOrigin: ?CodeOrigin,addres: ?Node) {
        super(codeOrigin.getOrThrow())
        address = addres
	
        isAddress = true
        isLabel = false
        isImmediate = false
        isImmediateOperand = true
        isRegister = false
    }
    
    override public func dump() : String {
        return address.getOrThrow().dump() + "[]"
    }
}

class Instruction <: Node {
    let opcode: String
    let operands: Array<?Node>
    let annotation: ?String
    
    init(codeOrigin: CodeOrigin, opcod: String,  operand: Array<?Node>, annotatio!: ?String = Option<String>.None) {
        super(codeOrigin)
        this.opcode = opcod
        this.operands = operand
        this.annotation = annotatio
	
    }
    
    override public func children() : Array<?Node> {
        return Array<?Node>()
    }
    
    override public func dump() : String {
        return "    " + "${opcode} " + "${String.join(map(operands) ,delimiter: ", ")}"
    }

    public func map(op: Array<?Node>):Array<String>{
        var arr :ArrayList<String> = ArrayList<String>()
        for (x in op){
            var y = x.getOrThrow().dump()
            arr.add(y)
        }
        return arr.toArray()
    }
}

class Error <: NoChildren {
    public init(codeOrigin: CodeOrigin) {
        super(codeOrigin)
    }

    override public func dump() : String {
        return "    error"
    }
}

class ConstExpr <: NoChildren {
    let values: String
    static var mapping = HashMap<String, ConstExpr>()
    
    init(codeOrigin: CodeOrigin, valu: String) {
        super(codeOrigin)
        values = valu
	
    }
    
    static func forName(codeOrigin: CodeOrigin, text: String) : ConstExpr {
        if ( ConstExpr.mapping.get(text).isNone()) {
            ConstExpr.mapping.add(text, ConstExpr(codeOrigin, text))
        }
        return ConstExpr.mapping.get(text).getOrThrow()
    }
    
    static func resetMappings() {
        ConstExpr.mapping = HashMap<String, ConstExpr>()
    }
    
    override public func dump() : String {
        return "constexpr (" + "${values}" + ")"
    }
    
    func compare(other: ConstExpr) : Bool {
        return values == other.values
    }
    
    func isImmediates() : Bool {
        return true
    }
}

class ConstDecl <: Node {
    let variable: ?Variable
    let valueDecl: ?Node
    
    init(codeOrigin: CodeOrigin, variabl: ?Variable, valueDec: Node) {
        super(codeOrigin)
        variable = variabl
        valueDecl = valueDec
	
        
    }
    
    override public func children() : Array<?Node> {
        return [variable.getOrThrow() as Node, valueDecl]
    }
    
    override public func dump() : String {
        return "const " + variable.getOrThrow().dump() + " = " + valueDecl.getOrThrow().dump()
    }
}

/*
 * The global variable
 */
var labelMapping = HashMap<String, Node>()
var referencedExternLabels = ArrayList<Label>()

open class Label <: NoChildren {
    let name: String
    var extern: Bool = true
    var global: Bool = false
    
    init(codeOrigin: ?CodeOrigin, nam: String) {
        super(codeOrigin.getOrThrow())
        name = nam
        
    }
    
    static func forName(codeOrigin: CodeOrigin, name: String,definedInFile!: Bool = false) : Label {
        if ( (labelMapping.get(name).isNone())) {
            labelMapping.add(name, Label(codeOrigin, name))
        }
        
        if ( definedInFile) {
            (labelMapping.get(name).getOrThrow() as Label).getOrThrow().clearExtern()
        }
        
        return (labelMapping.get(name).getOrThrow() as Label).getOrThrow()
    }
    
    static func setAsGlobal(codeOrigin: CodeOrigin,name: String) {
        if ( (labelMapping.get(name).isSome())) {
            let label = labelMapping.get(name).getOrThrow() as Label
            if ( (label.getOrThrow().isGlobal())) {
                print("Label: " + "${name}" + " declared global multiple times")
            }
            label.getOrThrow().setGlobal()
        } else {
            let newLabel = Label(codeOrigin,  name)
            newLabel.setGlobal()
            labelMapping.add(name , newLabel)
        }
    }
    
    static func resetMappings() {
        labelMapping = HashMap<String, Node>()
        referencedExternLabels = ArrayList<Label>()
    }
    
    static func resetReferenced() {
        referencedExternLabels = ArrayList<Label>()
    }
    
    func clearExtern() {
        extern = false
    }
    
    func isExtern() : Bool {
        return extern
    }
    
    func setGlobal() {
        global = true
    }
    
    func isGlobal() : Bool {
        return global
    }
    
    override public func dump() : String {
        return name + ":"
    }
	
	public operator func == (that: Label): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Label): Bool {
        return !(this == that)
    }
}

class LocalLabel <: NoChildren {
    static var uniqueNameCounter: Int64 = 0
    var extern: Bool = true
    var name: String
    
    init(codeOrigin: ?CodeOrigin,nam: String) {
        super( codeOrigin.getOrThrow())
        name = nam
        
    }
    
    static func forName(codeOrigin: ?CodeOrigin,name: String) : LocalLabel {
        if ( (labelMapping.get(name).isNone())) {
            labelMapping.add(name , LocalLabel( codeOrigin,  name))
        }
        return (labelMapping.get(name).getOrThrow() as LocalLabel).getOrThrow()
    }
    
    func unique(comment: String) : LocalLabel {
        var newName = "" + comment
        if ( (labelMapping.get(newName).isSome())) {
            newName = "_#" + "${LocalLabel.uniqueNameCounter}" + "_" + comment
            while ( (labelMapping.get(newName).isSome())) {
                LocalLabel.uniqueNameCounter += 1
            }
        }
        return LocalLabel.forName(Option<CodeOrigin>.None,  newName)
    }
    
    static func resetMappings() {
        LocalLabel.uniqueNameCounter = 0
    }
    
    func cleanName() : String {
        if ( name.startsWith(".")) {
            return "_" + name[1..]
        }
        return name
    }
    
    func isGlobal() : Bool {
        return false
    }
    
    override public func dump() : String {
        return name + ":"
    }
}

open class LabelReference <: Node {
    var label: Label
    
    init(codeOrigin: CodeOrigin,labe: Label) {
        super(codeOrigin)
        label = labe
        isAddress = false
        isLabel = true
        isImmediate = false
        isImmediateOperand = true
    }
    
    override public func children() : Array<?Node> {
        return [label]
    }
    
    func name() : String {
        return label.name
    }
    
    func isExtern() : Bool {
        return (labelMapping[name()] as Label).getOrThrow().isExtern()
    }
    
    func used() {
        var flg = false
        for(i in 0..referencedExternLabels.size){
            if(referencedExternLabels[i] == label){
                flg = true
                break
            }
		}
        if ((!flg)&&(isExtern())) {
            referencedExternLabels.add(label)
        }
    }
    
    override public func dump() : String {
        return label.name
    }
}






class LocalLabelReference <: NoChildren {
    var label: LocalLabel
    
    init(codeOrigin: CodeOrigin, labe: LocalLabel) {
        super(codeOrigin)
        label = labe
        isAddress = false
        isLabel = true
        isImmediate = false
        isImmediateOperand = true
        
    }
    
    override public func children() : Array<?Node> {
        return [label]
    }
    
    func name() : String {
        return label.name
    }
    
    override public func dump() : String {
        return label.name
    }
}

class Sequence <: Node {
    let list: Array<?Node>
    
    init( codeOrigin: CodeOrigin,  lis: Array<?Node>) {
        super(codeOrigin)
        list = lis
        
    }
    
    override public func children() : Array<?Node> {
        return list
    }
    
    override public func dump() : String {
        return String.join(map(list) , delimiter: "\n")
    }

    public func map(_list: Array<?Node>):Array<String>{
        var arr: ArrayList<String> = ArrayList<String>()
        for (x in _list){
            var y = x.getOrThrow().dump()
            arr.add(y)
        }
        return arr.toArray()
    }
}

class True <: NoChildren {
    init(codeOrig: ? CodeOrigin) {
        super(codeOrig.getOrThrow())
    }

    static func instance() : True {
        return True(Option<CodeOrigin>.None)
    }
    
    public open func values() : Bool {
        return true
    }
    
    override public func dump() : String {
        return "true"
    }
}

class False <: NoChildren {
    init(codeOrig: ?CodeOrigin) {
        super(codeOrig.getOrThrow())
    }

    static func instance() : False {
        return False(Option<CodeOrigin>.None)
    }
    
    public open func values() : Bool {
        return false
    }
    
    override public func dump() : String {
        return "false"
    }
}

class Setting <: NoChildren {
    static var mapping = HashMap<String, Setting>()
    var name: String
    
    init( codeOrigin: CodeOrigin, nam: String) {
        super(codeOrigin)
        name = nam
        
    }
    
    static func forName( codeOrigin: CodeOrigin,  name: String) : Setting {
        if ( Setting.mapping.get(name).isNone()) {
            Setting.mapping.add(name , Setting(codeOrigin, name))
        }
        return Setting.mapping.get(name).getOrThrow()
    }
    
    static func resetMappings() {
        Setting.mapping = HashMap<String, Setting>()
    }
    
    override public func dump() : String {
        return name
    }
}

class And <: Node {
    var left: ?Node
    var right: Node
    
    init( codeOrigin: CodeOrigin,  lef: ?Node,  righ: Node) {
        super( codeOrigin)
        left = lef
        right = righ
        
    }
    
    override public func children() : Array<?Node> {
        return [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.getOrThrow().dump()}" + " and " + "${right.dump()}" + ")"
    }
}

class Or <: Node {
    var left: Node
    var right: Node
    
    init( codeOrigin: CodeOrigin,  lef: Node,  righ: Node) {
        super( codeOrigin)
        this.left = lef
        this.right = righ
        
    }
    
    override public func children() : Array<?Node> {
        return [left, right]
    }
    
    override public func dump() : String {
        return "(" + "${left.dump()}" + " or " + "${right.dump()}" + ")"
    }
}

class Not <: Node {
    var child: Node
    
    init( codeOrigin: CodeOrigin,  chil: Node) {
        super( codeOrigin)
        child = chil
        
    }
    
    override public func children() : Array<?Node> {
        return [child]
    }
    
    override public func dump() : String {
        return "(not" + "${child.dump()}" + ")"
    }
}

class Skip <: NoChildren {
    init(codeOrigin: CodeOrigin) {
        super(codeOrigin)
    }

    override public func dump() : String {
        return "    skip"
    }
}

class IfThenElse <: Node {
    var predicate: Node
    var thenCase: Node
    var elseCase: Node
    
    init( codeOrigin: CodeOrigin,  predicat: Node,  thenCas: Node) {
        super(codeOrigin)
        predicate = predicat
        thenCase = thenCas
        elseCase = Skip(codeOrigin)
        
    }
    
    override public func dump() : String {
        return "if " + "${predicate.dump()}" + "\n" + "${thenCase.dump()}" + "\nelse\n" + "${elseCase.dump()}" + "\nend"
    }
}

class Macro <: Node {
    var name: String
    var variables: Array<Variable>
    var body: Node
    
    init( codeOrigin: CodeOrigin, nam: String, variable: Array<Variable>, bod: Node) {
        super(codeOrigin)
        name = nam
        variables = variable
        body = bod
        
    }
    
    override public func dump() : String {
        return "macro " + "${name}" + "(" + "${String.join(map(variables) , delimiter: ", ")}" + ")\n" + "${body.dump()}" + "\nend"
    }

    public func map(va: Array<Variable>):Array<String>{
        var arr :ArrayList<String> = ArrayList<String>()
        for (x in va){
            var y = x.dump()
            arr.add(y)
        }
        return arr.toArray()
    }
}

class MacroCall <: Node {
    var name: String
    var operands: Array<?Node>
    var annotation: ?String
    
    init( codeOrigin: CodeOrigin,  nam: String,  operand: Array<?Node>,  annotatio: String) {
        super(codeOrigin)
        name = nam
        operands = operand
        annotation = annotatio
        
    }
    
    override public func children() : Array<?Node> {
        return Array<?Node>()
    }
    
    override public func dump() : String {
        return "    " + "${name}" + "(" + "${String.join(map(operands) , delimiter: ", ")}" + ")"
    }

    public func map(op: Array<?Node>):Array<String>{
        var arr :ArrayList<String> = ArrayList<String>()
        for (x in op){
            var y = x.getOrThrow().dump()
            arr.add(y)
        }
        return arr.toArray()
    }

}

/*
 * Reset the static mapping property of the following node classes
 */
func resetAST(){
    StructOffset.resetMappings();
    Sizeof.resetMappings();
    ConstExpr.resetMappings();
    Label.resetMappings();
    LocalLabel.resetMappings();
    Setting.resetMappings();
}
