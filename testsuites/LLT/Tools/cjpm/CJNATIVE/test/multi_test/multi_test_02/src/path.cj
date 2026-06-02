// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.io.*

public class lazybuf <: ToString {
    var s: String
    var buf: Array<Byte>
    var w: Int64
    init(s: String) {
        this.s = s
        this.buf = Array()
        this.w = 0
    }
    func index(i: Int64): Byte {
        if (this.buf.size > 0) {
            return this.buf[i]
        }
        return this.s[i]
    }

    func append(b: Byte) {
        if (this.buf.size == 0) {
            if (this.w < this.s.size && this.s[this.w] == b) {
                this.w++
                return
            }
            this.buf = Array<Byte>(this.s.size, {
                i => this.s[i]
            })
        }
        this.buf[this.w] = b
        this.w++
    }

    public func toString(): String {
        if (this.buf.size == 0) {
            return this.s[..this.w]
        }
        return String.fromUtf8(this.buf[..this.w])
    }
}

public func Clean(path: String): String {
    if (path == "") {
        return "."
    }
    let rooted = path[0] == UInt8(UInt32(r'/'))
    let n = path.size
    let out = lazybuf(path)
    var r = 0
    var dotdot = 0
    if (rooted) {
        out.append(UInt8(UInt32(r'/')))
        r = 1
        dotdot = 1
    }
    while (r < n) {
        if (path[r] == UInt8(UInt32(r'/'))) {
            r++
        } else if (path[r] == UInt8(UInt32(r'.')) && (r + 1 == n || path[r + 1] == UInt8(UInt32(r'/')))) {
            r++
        } else if (path[r] == UInt8(UInt32(r'.')) && path[r + 1] == UInt8(UInt32(r'.')) && (r + 2 == n || path[r + 2] ==
            UInt8(UInt32(r'/')))) {
            r += 2
            if (out.w > dotdot) {
                out.w--
                while (out.w > dotdot && out.index(out.w) != UInt8(UInt32(r'/'))) {
                    out.w--
                }
            } else if (!rooted) {
                if (out.w > 0) {
                    out.append(UInt8(UInt32(r'/')))
                }
                out.append(UInt8(UInt32(r'.')))
                out.append(UInt8(UInt32(r'.')))
                dotdot = out.w
            }
        } else {
            if (rooted && out.w != 1 || !rooted && out.w != 0) {
                out.append(UInt8(UInt32(r'/')))
            }
            while (r < n && path[r] != UInt8(UInt32(r'/'))) {
                out.append(path[r])
                r++
            }
        }
    }

    if (out.w == 0) {
        return "."
    }

    return out.toString()
}

func lastSlash(s: String): Int64 {
    var i = s.size - 1
    while (i >= 0 && s[i] != UInt8(UInt32(r'/'))) {
        i--
    }
    return i
}

public func Split(path: String): (String, String) {
    let i = lastSlash(path)
    if (path.size == i + 1) {
        return (path[..i + 1], "")
    }
    return (path[..i + 1], path[i + 1..])
}

public func Join(elem: Array<String>): String {
    var size = 0
    for (e in elem) {
        size += e.size
    }
    if (size == 0) {
        return ""
    }
    var buf = String()
    for (e in elem) {
        if (buf.size > 0 || e != "") {
            if (buf.size > 0) {
                buf += "/"
            }
            buf += e
        }
    }
    return Clean(buf)
}

public func Ext(path: String): String {
    var i = path.size - 1
    while (i >= 0 && path[i] != UInt8(UInt32(r'/'))) {
        if (path[i] == UInt8(UInt32(r'.'))) {
            return path[i..]
        }
        i--
    }
    return ""
}

public func Base(path: String): String {
    var l_path: String = path
    if (l_path == "") {
        return "."
    }
    while (l_path.size > 0 && l_path[l_path.size - 1] == UInt8(UInt32(r'/'))) {
        l_path = l_path[0..l_path.size - 1]
    }
    let i = lastSlash(l_path)
    if (i >= 0) {
        l_path = l_path[i + 1..]
    }
    if (l_path == "") {
        return "/"
    }
    return l_path
}

public func IsAbs(path: String): Bool {
    return path.size > 0 && path[0] == UInt8(UInt32(r'/'))
}

public func Dir(path: String): String {
    let (dir, _) = Split(path)
    return Clean(dir)
}
