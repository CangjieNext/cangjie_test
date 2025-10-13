// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package serializers

internal import std.convert.*
internal import stdx.encoding.json.*
internal import std.io.*
internal import std.collection.*
internal import types.*
internal import types.LinkedListNode as TLinkedListNode

public func serialize(obj: Int64): String {
    return obj.toString()
}

public func serialize(obj: Float64): String {
    return obj.format(".5")
}

public func serialize(obj: String): String {
    return JsonString(obj).toString()
}

public func serialize(obj: Rune): String {
    return "\"${obj.toString()}\""
}

public func serialize(obj: Bool): String {
    return JsonBool(obj).toString()
}

public func serialize(obj: ?TreeNodeSer): String {
    let is_none = {
        obj: ?TreeNodeSer => match (obj) {
            case Some(a) => false
            case None => true
        }
    }
    if (is_none(obj)) {
        return "[]"
    }
    let q = ArrayList<?TreeNodeSer>([obj])
    let res = StringBuilder("[")
    var null_tail = StringBuilder()
    var isFirstElement = true
    var i = 0
    while (true) {
        if (i == q.size) {
            break
        }
        let node = q.get(i).getOrThrow()
        if (!is_none(node)) {
            if (null_tail.size > 0) {
                res.append(null_tail)
                null_tail.reset()
            }
            if (isFirstElement) {
                isFirstElement = false
            } else {
                res.append(r',')
            }
            let n = node.getOrThrow()
            q.add(n.left)
            q.add(n.right)
            res.append("${n.val}")
        } else {
            if (isFirstElement) {
                isFirstElement = false
            } else {
                null_tail.append(r',')
            }
            null_tail.append("null")
        }
        i++
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: ?TLinkedListNode): String {
    let is_none = match (obj) {
        case Some(a) => false
        case None => true
    }
    if (is_none) {
        return "[]"
    }
    let res = StringBuilder("[")
    var head = obj
    var isFirstElement = true
    while (true) {
        let tmp = match (head) {
            case Some(nd) => nd
            case None => break
        }
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${tmp.val}")
        head = tmp.next
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: NestedInteger): String {
    if (obj.isInteger()) {
        return serialize(obj.getInteger())
    } else {
        return serialize(obj.getList())
    }
}

public func serialize(obj: Iterable<NestedInteger>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<Float64>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<ArrayList<Float64>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Array<Array<Float64>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<Int64>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Array<Array<Int64>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<ArrayList<Int64>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<String>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<ArrayList<String>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Array<Array<String>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<?TreeNodeSer>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<?TLinkedListNode>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<Rune>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Array<Array<Rune>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<ArrayList<Rune>>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}

public func serialize(obj: Iterable<Bool>): String {
    let res = StringBuilder("[")
    var isFirstElement = true
    for (i in obj) {
        if (isFirstElement) {
            isFirstElement = false
        } else {
            res.append(r',')
        }
        res.append("${serialize(i)}")
    }
    res.append(r']')
    return res.toString()
}
