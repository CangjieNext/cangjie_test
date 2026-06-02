// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package view

internal import std.ast.*

// ============================================================================
// 1.user DSL parse
enum NodeType {
    Empty | Var | If(Array<String>) | For(Array<String>) | Simple(Array<String>) | Params(Array<String>)
}

class NodeModifier {
    public var function: String
    public var parameters: String

    public init() {
        this.function = ""
        this.parameters = ""
    }

    public init(function: String, parameters: String) {
        this.function = function
        this.parameters = parameters
    }
}

class Node {
    public var name: String
    public var node_type: NodeType
    public var modifiers: Array<NodeModifier>
    public var children: Array<Node>

    public init() {
        this.name = ""
        this.node_type = Empty
        this.modifiers = []
        this.children = []
    }

    public init(name: String, node_type: NodeType, modifiers: Array<NodeModifier>, children: Array<Node>) {
        this.name = name
        this.node_type = node_type
        this.modifiers = modifiers
        this.children = children
    }
}

func compile_mods(modifiers: Array<NodeModifier>) {
    var res: String = "\n"
    if (modifiers[0].function == "none") {
        return ""
    } else {
        for (nodemodifiers in modifiers) {
            if (nodemodifiers.function == "") {
                return res
            }
            res = res + "o." + nodemodifiers.function + "(" + nodemodifiers.parameters + ")"
        }
    }
    return res
}

func compile_children(children: Array<Node>): String {
    var res: String = "\n"
    if (children[0].name == "none") {
        return ""
    } else {
        for (node in children) {
            if (node.name == "") {
                break
            }
            res = match (node.node_type) {
                case If(args) => res + "if (" + args[0] + ") {" + compile_children(node.children) + "}"
                case For(args) => res + "for ((" + args[0] + ")) {" + compile_children(node.children) + "}\n"
                case _ => res + "a.add_view_child(" + compile_user_node(node) + ")\n"
            }
        }
    }
    return res
}

func compile_user_node(node: Node): String {
    if (node.name == "") {
        return ""
    }
    var mods = compile_mods(node.modifiers)
    var cc = compile_children(node.children)
    var str: String = match (node.node_type) {
        case Empty => "var a = " + node.name + "()" + mods + cc + "\n"
        case Params(args) => "var a = " + node.name + "(" + args[0] + ")" + mods + cc
        case Simple(args) => node.name + "(" + args[0] + ")"
        case _ => node.name + "\n"
    }
    return str
}

func parse_view_node_children(input: Tokens): Array<Node> {
    var lCurl = 0
    var count = 0
    var children = Array<Node>(5, repeat: Node())
    children[0].name = "none"
    var it = input.iterator()
    it.next()
    if (!it.seeing(TokenKind.LCURL)) {
        return children
    }
    lCurl++
    it.next()
    while (lCurl != 0) {
        children[count] = parse_view_node(input)
        count++
        if (it.seeing(TokenKind.RCURL)) {
            lCurl--
            it.next()
        }
    }
    return children
}

func parse_view_node_args(input: Tokens): Array<String> {
    var it = input.iterator()
    it.next()
    if (!it.seeing(TokenKind.LPAREN)) {
        return Array<String>(2, repeat: "none")
    }
    var lPa = 0
    it.next()
    var has_structured: String = ""
    var args = Array<String>(2, repeat: "")
    var string: String = ""
    do {
        let n: Token = match (it.peek()) {
            case Some(obj) => obj
            case _ => Token()
        }
        if (it.seeing(TokenKind.COLON)) {
            has_structured = "true"
        }
        if (it.seeing(TokenKind.STRING_LITERAL)) {
            string = string + "\"" + n.value + "\""
        } else {
            string = string + n.value
        }
        if (it.seeing(TokenKind.LPAREN)) {
            lPa++
        }
        if (it.seeing(TokenKind.RPAREN)) {
            lPa--
        }
        it.next()
    } while (!(it.seeing(TokenKind.RPAREN) && lPa == 0))
    it.next()
    args[0] = string
    args[1] = has_structured
    return args
}

func parse_view_node_mods(input: Tokens): Array<NodeModifier> {
    var count = 0
    var mods = Array<NodeModifier>(2, repeat: NodeModifier())
    mods[0].function = "none"
    var it = input.iterator()
    it.next()
    if (!it.seeing(TokenKind.DOT)) {
        return mods
    }
    do {
        it.next()
        if (!it.seeing(TokenKind.LPAREN)) {
            mods[count].function = match (it.peek()) {
                case Some(obj) => obj.value
                case _ => ""
            }
            it.next()
            if (it.seeing(TokenKind.LPAREN)) {
                var agrs = parse_view_node_args(input)
                mods[count].parameters = agrs[0]
            }
            count++
        }
    } while (it.seeing(TokenKind.DOT))
    return mods
}

func parse_if_view(input: Tokens): Node {
    let args: Array<String> = parse_view_node_args(input)
    if (args[0] == "none") {
        return Node()
    }
    let mod = parse_view_node_mods(input)
    let children = parse_view_node_children(input)
    if (children[0].name == "none") {
        return Node()
    }
    var nd = Node("If", If([args[0]]), mod, children)
    return nd
}

func parse_for_view(input: Tokens): Node {
    let args: Array<String> = parse_view_node_args(input)
    if (args[0] == "none") {
        print("for requires arguments");
        return Node()
    }
    let mod = parse_view_node_mods(input)
    let children = parse_view_node_children(input)
    if (children[0].name == "none") {
        print("for requires children");
        return Node()
    }
    var nd = Node("For", For([args[0]]), mod, children)
    return nd
}

func parse_user_view(name: String, input: Tokens): Node {
    let args: Array<String> = parse_view_node_args(input)
    let mods = parse_view_node_mods(input);
    let children = parse_view_node_children(input);
    if (args[0] != "none") {
        if (args[1] == "true") {
            var nd = Node(name, Params([args[0]]), mods, children)
            return nd
        }
        var nd = Node(name, Simple([args[0]]), mods, children)
        return nd
    }
    var nd = Node(name, Empty, mods, children)
    return nd
}

func parse_view_node(input: Tokens): Node {
    var name = ""
    var it = input.iterator()
    it.next()
    if (!it.seeing(TokenKind.LCURL)) {
        name = match (it.peek()) {
            case Some(obj) => obj.value
            case _ => ""
        }
    }
    it.next()
    if (name == "If") {
        return parse_if_view(input)
    } else if (name == "For") {
        return parse_for_view(input)
    } else {
        return parse_user_view(name, input)
    }
}
// ============================================================================

// ============================================================================
// 2.macro definition
public macro callView(input: Tokens): Tokens {
    let user_node = parse_view_node(input)
    let char_str = compile_user_node(user_node)
    let token = cangjieLex(char_str)
    return token
}
// ============================================================================
