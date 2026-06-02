// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.net.*
internal import std.time.*

var time1 = Time(2022, January, 19)
var cookie = Cookie("0123456789", "789", path: "/a1/", domain: ".xinhuanet.com", expires: time1, rawExpires: "time1",
    maxAge: -1, secure: true, httpOnly: true, sameSite: SameSite.Lax, raw: "Lax", unparsed: ["HTTP/1.1"])
var cookie1 = Cookie("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "", path: "/a1/", domain: ".xinhuanet.com", expires: time1,
    rawExpires: "time1", maxAge: -1, secure: true, httpOnly: true, sameSite: SameSite.Lax, raw: "Lax",
    unparsed: ["HTTP/1.1"])
var cookie2 = Cookie("abcdefghijklmnopqrstuvwxyz", "9", path: "/a1/", domain: ".xinhuanet.com", expires: time1,
    rawExpires: "time1", maxAge: -1, secure: true, httpOnly: true, sameSite: SameSite.Lax, raw: "Lax",
    unparsed: ["HTTP/1.1"])
var cookie3 = Cookie("!#$%&*+-.^_`|~", "", path: "/a1/", domain: ".xinhuanet.com", expires: time1, rawExpires: "time1",
    maxAge: -1, secure: true, httpOnly: true, sameSite: SameSite.Lax, raw: "Lax", unparsed: ["HTTP/1.1"])

main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    var a2 = cookie2.toString()
    var a3 = cookie3.toString()
    if (a.contains("0123456789=789; Path=/a1/; Domain=xinhuanet.com; Expires=") != true) {
        return 1
    }
    if (a.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true) {
        return 2
    }
    if (a1.contains("ABCDEFGHIJKLMNOPQRSTUVWXYZ=; Path=/a1/; Domain=xinhuanet.com; Expires=") != true) {
        return 3
    }
    if (a1.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true) {
        return 4
    }
    if (a2.contains("abcdefghijklmnopqrstuvwxyz=9; Path=/a1/; Domain=xinhuanet.com; Expires=") != true) {
        return 5
    }
    if (a2.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true) {
        return 6
    }
    if (a3.contains("!#$%&*+-.^_`|~=; Path=/a1/; Domain=xinhuanet.com; Expires=") != true) {
        return 7
    }
    if (a3.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true) {
        return 8
    }
    return 0
}
