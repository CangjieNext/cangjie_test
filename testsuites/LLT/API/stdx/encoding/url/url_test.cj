/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class UrlTest {
    @TestCase
    func urlInit(): Unit {
        let url = URL(scheme: "http", hostName: "www.中/path%中%2F.com", path: "/path%中%2F")
        @Expect(url.scheme, "http")
        @Expect(url.host, "www.中/path%中%2f.com")
        @Expect(url.hostName, "www.中/path%中%2f.com")
        @Expect(url.path, "/path%中%2F")
        @Expect(url.rawPath, "/path%25%E4%B8%AD%252F")
        @Expect(url.toString(), "http://www.%E4%B8%AD%2Fpath%25%E4%B8%AD%252f.com/path%25%E4%B8%AD%252F")
    }

    @TestCase
    func urlInitError(): Unit {
        try {
            URL(scheme: "", hostName: "huawei.com", path: "/abc")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If a hostname exists, the scheme cannot be empty.")
        }

        try {
            URL(scheme: "https", hostName: "", path: "")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If the scheme exists, the hostname or path cannot be empty.")
        }

        try {
            URL(scheme: "12https", hostName: "huawei.com", path: "/abc")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "The first part of the scheme cannot be a non-letter. Input = 12https.")
        }

        try {
            URL(scheme: "ht@#tps", hostName: "huawei.com", path: "/abc")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "The scheme must be a combination of letters, digits, and +-. characters. Input = ht@#tps.")
        }

        try {
            URL(scheme: "https", hostName: "huawei.com", path: "abc")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Absolute URL requires an absolute path.")
        }
    }

    @TestCase
    func urlMergePaths(): Unit {
        var res = [["", "/a/b/c/./../../g", "/a/g"], ["/a/", "b/c/./../../g", "/a/g"], ["/a/b/c/", "./../../g", "/a/g"],
            ["/a/b/c/", "../../g", "/a/g"], ["/a/b/", "../g", "/a/g"], ["/a/", "g", "/a/g"], ["/a/g/", "", "/a/g/"],
            ["", "", ""], ["", "/", "/"], ["/", "", "/"], ["a/b/c/d;p", ".", "a/b/c/"], ["/b/c/d;p", "../..", "/"],
            ["/file/../../a/b/./c//d/", "", "/a/b/c/d/"], ["/file/../../a/b/./c//d/", "/e/f/../g", "/e/g"]]
        for (i in 0..res.size) {
            var url = URL.mergePaths(res[i][0], res[i][1])
            if (url != res[i][2]) {
                println("第 ${i} 个用例失败了")
            }
            @Expect(url == res[i][2])
        }
    }

    @TestCase
    func urlIsAbsoluteURL(): Unit {
        var url = URL(scheme: "", hostName: "", path: "/abc")
        @Expect(url.isAbsoluteURL(), false)

        url = URL(scheme: "", hostName: "", path: "abc")
        @Expect(url.isAbsoluteURL(), false)

        url = URL(scheme: "http", hostName: "huawei.com", path: "/abc")
        @Expect(url.isAbsoluteURL(), true)
    }

    @TestCase
    func urlStaticProp1(): Unit {
        var url = URL.parse("https:huawei.com")
        @Expect(url.opaque, "huawei.com")

        url = URL.parse(
            "https://myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord@huawei.com:1234/path%25%E4%B8%AD%252F?%25=%27#%7A%7B%7C")
        @Expect(url.scheme, "https")
        @Expect(url.userInfo.toString(), "myuser+￥？中name:mypassw^ord")
        @Expect(url.rawUserInfo.toString(), "myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord")
        @Expect(url.host, "huawei.com:1234")
        @Expect(url.hostName, "huawei.com")
        @Expect(url.port, "1234")
        @Expect(url.path, "/path%中%2F")
        @Expect(url.rawPath, "/path%25%E4%B8%AD%252F")
        @Expect(url.query, "%='")
        @Expect(url.rawQuery, "%25=%27")
        @Expect(url.fragment, "z{|")
        @Expect(url.rawFragment, "%7A%7B%7C")
        @Expect(url.queryForm.toEncodeString(), "%25=%27")
    }
    @TestCase
    func urlStaticProp2(): Unit {
        var url = URL.parse("https:huawei.com")
        @Expect(url.opaque, "huawei.com")

        url = URL.parse(
            "https://myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord@[fe80::1%252]:8080/path%25%E4%B8%AD%252F?%25=%27#%7A%7B%7C")
        @Expect(url.scheme, "https")
        @Expect(url.userInfo.toString(), "myuser+￥？中name:mypassw^ord")
        @Expect(url.rawUserInfo.toString(), "myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord")
        @Expect(url.host, "[fe80::1%2]:8080")
        @Expect(url.hostName, "fe80::1%2")
        @Expect(url.port, "8080")
        @Expect(url.path, "/path%中%2F")
        @Expect(url.rawPath, "/path%25%E4%B8%AD%252F")
        @Expect(url.query, "%='")
        @Expect(url.rawQuery, "%25=%27")
        @Expect(url.fragment, "z{|")
        @Expect(url.rawFragment, "%7A%7B%7C")
        @Expect(url.queryForm.toEncodeString(), "%25=%27")
    }
    @TestCase
    func urlStaticProp3(): Unit {
        var url = URL.parse("https:huawei.com")
        @Expect(url.opaque, "huawei.com")

        url = URL.parse(
            "https://myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord@[fe80::1%252]/path%25%E4%B8%AD%252F?%25=%27#%7A%7B%7C")
        @Expect(url.scheme, "https")
        @Expect(url.userInfo.toString(), "myuser+￥？中name:mypassw^ord")
        @Expect(url.rawUserInfo.toString(), "myuser+%EF%BF%A5%EF%BC%9F%E4%B8%ADname:mypassw%5Eord")
        @Expect(url.host, "[fe80::1%2]")
        @Expect(url.hostName, "fe80::1%2")
        @Expect(url.port, "")
        @Expect(url.path, "/path%中%2F")
        @Expect(url.rawPath, "/path%25%E4%B8%AD%252F")
        @Expect(url.query, "%='")
        @Expect(url.rawQuery, "%25=%27")
        @Expect(url.fragment, "z{|")
        @Expect(url.rawFragment, "%7A%7B%7C")
        @Expect(url.queryForm.toEncodeString(), "%25=%27")
    }
    @TestCase
    func urlParseRegHost(): Unit {
        var url = URL.parse("http://256.256.256.256/path")
        @Expect(url.hostName, "256.256.256.256")
        url = URL.parse("http://3333333333333333333333333/path")
        @Expect(url.hostName, "3333333333333333333333333")
    }

    @TestCase
    func urlParseSchemeError(): Unit {
        try {
            URL.parse("1http://www.example.com")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "The first part of the scheme cannot be a non-letter. Input = 1http.")
        }
        try {
            URL.parse(":80")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "The first part of the scheme cannot be a non-letter. Input = .")
        }
        try {
            URL.parse("h1@tp://www.example.com")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "The scheme must be a combination of letters, digits, and +-. characters. Input = h1@tp.")
        }
    }

    @TestCase
    func urlParseAuthorityError(): Unit {
        try {
            URL.parse("http://")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Missing the authority component. Input = http://.")
        }

        try {
            URL.parse("http://192.168.0.1/tes/d%h")
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Invalid URL escape. Input = /tes/d%h.")
        }
    }

    @TestCase[url in [ 
 "http://%E4%2F%AD:%E4%B8%AD@www.example.com", 
 "http://%E%2F%AD:%E4%B8%AD@www.example:8080/path/?q=v#G", 
 "http://abc:aa^g@www.example:8080/path/?q=v#G" 
 ] 
]
    func urlParseUserInfoError(url: String): Unit {
        try {
            URL.parse(url)
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "The userinfo contains an invalid encoding sequence.")
        }
    }

    @TestCase
    func urlParseIPv4HostError(): Unit {
        try {
            URL.parse("http1.://!$&-ab:12789@@@@www.example.com:14")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid url part. Input = @@@www.example.com.")
        }
    }

    @TestCase
    func urlParseIPv6HostError(): Unit {
        try {
            URL.parse("http://[2001:3CA1:010F:001A:121B:0000:0000:0010]a")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "A colon connection is required between the host and the port. Input = [2001:3CA1:010F:001A:121B:0000:0000:0010]a.")
        }

        try {
            URL.parse("http://[fe80::1%40%25en0]:8080")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Invalid url part. Input = fe80::1%40.")
        }

        try {
            URL.parse("http://[]:80")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "IPv6 address in [] can't be empty Input = [.")
        }

        try {
            URL.parse("http://[12:8080")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Missing r']' in host. Input = [12:8080.")
        }

        try {
            URL.parse("http://[1000::1]:qq")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid url part. Input = qq.")
        }
    }

    @TestCase
    func urlParsePortError(): Unit {
        try {
            URL.parse(
                "ftp://renyidezhanghaomimafeichangchang:12345678910112eqwrqwer1oi23u98q7dfkjbzdsf@momingqimiaodewangzhi.com:/nihao^")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Invalid url part. Input = /nihao^.")
        }
    }

    @TestCase
    func urlParseFragmentError(): Unit {
        try {
            URL.parse("http1.://!$&-ab:12789@www#.example.com:14?1@=3b#@17")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid url part. Input = .example.com:14?1@=3b#@17.")
        }
    }

    @TestCase
    func urlParsePathError(): Unit {
        try {
            URL.parse("http1.://user:password@www.example.com:14/abc/:^123/1?12=3b#17")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid url part. Input = /abc/:^123/1.")
        }

        try {
            URL.parse("http1.://user:password@www.example.com:14/abc/%QW123/1?12=3b#17")
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid URL escape. Input = /abc/%QW123/1.")
        }
    }

    @TestCase
    func urlParseQueryError(): Unit {
        try {
            URL.parse("http1.://user:password@www.example.com:14/abc/123/1?`!=3b#17").query
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid url part. Input = `!=3b.")
        }

        try {
            URL.parse("http1.://user:password@www.example.com:14/abc/123/1?+-=%qE#17").query
            @Expect(false)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid URL escape. Input = +-=%qE.")
        }
    }
    @TestCase[str in [ "", "/", "*", "example.com", "http://25a.256.256.256", "http://[::192.168.1.1]", "http://192.168.1.2:8080", 
 "http://[::200.0.0.10]:8080", "http://[::]:8080", "/foo?query=http://bad", 
 "file:///C:/FooBar/Baz.txt", "mailto:webmaster@cangjie.org#yui", "http://%3Fam:pa%3Fsword@xinhuanet.com", 
 "mysql://a,b,c/bar@", "scheme://!$&'()*+,;=hello!:8008/path", "http://host/!$&'()*+,;=:@hello", 
 "http://[fe80::1]/", "http://[fe80::1]:8080/", "http://[fe80::1%25en0]/+qwe", "mailto:?subject=hi", 
 "magnet:?xt=urn:btih:c12fe1c06bba254a9dc9f519b335aa7c1367a88a&dn", 
 "http://rest.rsc.io/foo%2fbar/baz%2Fquux?alt=media", 
 "http://121www.asd12.com:789ewweq@www.baadsd.com:8080#123", 
 "file://renyi123@shiw_odemimailea/nihao", 
 "http5+://~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#:Ab9!$&-8a", 
 "http://www.xinhuanet.com#%232%E4%BD%A0Ab%25", 
 "http://121www.asd12.%E4%BD%A0com%40:789ad@110.8.8.10:50", 
 "http5+://*+,9_Ab:2a_4*+,@www.example.com:78/a/b" ] 
]
    func urlParse_1(str: String): Unit {
        var url = URL.parse(str)
        @Expect(url.toString(), str)
    }

    @TestCase[str in [ "http5+://[2001:010F:001A:121B::0010]:8080", 
 "http5://[2002::FFFF]:8080", 
 "http://[2001:3CA1:010F:001A:121B:0000:0010:0000]:8080" ] 
]
    func urlParse_1_hostname_to_lower(str: String): Unit {
        var url = URL.parse(str)
        @Expect(url.toString(), str.toAsciiLower())
    }

    @TestCase
    func urlParse_2(): Unit {
        var url = URL.parse("//user@foo/path?a=b")
        @Expect(url.toString(), "/path?a=b")

        url = URL.parse("///threeslashes")
        @Expect(url.toString(), "/threeslashes")

        url = URL.parse("http://[fe80::1%25%65%6e%301-._~]:8080/")
        @Expect(url.toString(), "http://[fe80::1%25en01-._~]:8080/")

        url = URL.parse("MaIlTo:webmaster@cangjie.org")
        @Expect(url.toString(), "mailto:webmaster@cangjie.org")

        url = URL.parse("http://192.168.0.2:/foo")
        @Expect(url.toString(), "http://192.168.0.2/foo")

        url = URL.parse("http://[fe80::1]:/")
        @Expect(url.toString(), "http://[fe80::1]/")

        url = URL.parse("http://hello.%e4%b8%96%e7%95%8c.com/foo")
        @Expect(url.toString(), "http://hello.%E4%B8%96%E7%95%8C.com/foo")

        url = URL.parse("http://?:")
        @Expect(url.toString(), "http:?:")

        url = URL.parse("http://121www.asd12.com:@")
        @Expect(url.toString(), "http://121www.asd12.com@")
    }

    @TestCase
    func urlResolve(): Unit {
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g:h"), URL.parse("g:h")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g"), URL.parse("http://a/b/c/g")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("./g"), URL.parse("http://a/b/c/g")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g/"), URL.parse("http://a/b/c/g/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("/g"), URL.parse("http://a/g")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("//g"), URL.parse("http://g")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("?y"), URL.parse("http://a/b/c/d;p?y")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("#s"), URL.parse("http://a/b/c/d;p?q#s")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g#s"), URL.parse("http://a/b/c/g#s")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g?y#s"), URL.parse("http://a/b/c/g?y#s")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse(";x"), URL.parse("http://a/b/c/;x")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g;x"), URL.parse("http://a/b/c/g;x")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("g;x?y#s"), URL.parse("http://a/b/c/g;x?y#s")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse(""), URL.parse("http://a/b/c/d;p?q")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("."), URL.parse("http://a/b/c/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("./"), URL.parse("http://a/b/c/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse(".."), URL.parse("http://a/b/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("../"), URL.parse("http://a/b/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("../g"), URL.parse("http://a/b/g")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("../.."), URL.parse("http://a/")))
        @Expect(checkResolveURL(URL.parse("http://a/b/c/d;p?q"), URL.parse("../../"), URL.parse("http://a/")))
        @Expect(checkResolveURL(URL.parse("http://example"),       URL.parse("?"), URL.parse("http://example?")))
        @Expect(checkResolveURL(URL.parse("http://foo.com?a="), URL.parse("https://bar.com/"), URL.parse("https://bar.com/")))
        @Expect(checkResolveURL(URL.parse("http://foo.com/bar?a=b#f"), URL.parse("/baz?c=d"), URL.parse("http://foo.com/baz?c=d")))
        @Expect(checkResolveURL(URL.parse("https://foo.com/bar?a="), URL.parse("//bar.com/quux"), URL.parse("https://bar.com/quux")))
        @Expect(checkResolveURL(URL.parse("http://foo.com/dot/./dotdot/../foo/bar"), URL.parse(".#frag"), URL.parse("http://foo.com/dot/foo/#frag")))
        @Expect(checkResolveURL(URL.parse("http://foo.com/1/2%2f/3%2f4/5"), URL.parse("./a%2f../b/../c"), URL.parse("http://foo.com/1/2%2f/3%2f4/a%2f../c")))
        @Expect(checkResolveURL(URL.parse("http://foo.com/bar/baz"), URL.parse("quux/./dotdot/.././tail"), URL.parse("http://foo.com/bar/quux/tail")))
    }

    @TestCase
    func urlReplace(): Unit {
        var url = URL.parse("http://myusername:mypassword@www.example.com:1010/abc/?id=123#node")
        var urlReplace = url.replace(scheme: "https", userInfo: "Lily:123", hostName: "www.example.com", port: "8080",
            path: "/path", query: "table=234", fragment: "a23e")
        @Expect(urlReplace.toString(), "https://Lily:123@www.example.com:8080/path?table=234#a23e")
    }

    @TestCase
    func urlReplaceError(): Unit {
        try {
            var url = URL(scheme: "https", hostName: "huawei.com", path: "/abc")
            url.replace(scheme: "")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If a hostname exists, the scheme cannot be empty.")
        }

        try {
            var url = URL.parse("https://myusername:mypassword@www.example.com:1010/abc/?id=123#node")
            url.replace(hostName: "")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If a userInfo exists, the host name cannot be empty.")
        }

        try {
            var url = URL.parse("https://www.example.com:1010/abc/?id=123#node")
            url.replace(hostName: "")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If a port exists, the host name cannot be empty.")
        }

        try {
            var url = URL.parse("https://www.example.com:1010/abc/?id=123#node")
            url.replace(hostName: "", path: "")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "If the scheme exists, the host name and path cannot be empty at the same time.")
        }

        try {
            var url = URL.parse("https://www.example.com:1010/abc/?id=123#node")
            url.replace(path: "path")
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Absolute URL requires an absolute path.")
        }
    }
}

@Test
class URLEncode {
    @TestCase
    public func encode01(): Unit {
        let str = "hello123"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode02(): Unit {
        let str = "#$&+,/:;=?@"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode04(): Unit {
        let str = "你好"
        let str_right = URL.encode(str)
        @Assert("%E4%BD%A0%E5%A5%BD", str_right)
    }

    @TestCase
    public func encode05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str_right = URL.encode(sb.toString())
        @Assert("%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%7F", str_right)
    }
}

@Test
class URLEncodeComponent {
    @TestCase
    public func encodeComponent01(): Unit {
        let str = "hello123"
        let str_right = URL.encodeComponent(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encodeComponent02(): Unit {
        let str = "#$&+,/:;=?@"
        let str_right = URL.encodeComponent(str)
        @Assert("%23%24%26%2B%2C%2F%3A%3B%3D%3F%40", str_right)
    }

    @TestCase
    public func encodeComponent03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.encodeComponent(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encodeComponent04(): Unit {
        let str = "你好"
        let str_right = URL.encodeComponent(str)
        @Assert("%E4%BD%A0%E5%A5%BD", str_right)
    }

    @TestCase
    public func encodeComponent05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str_right = URL.encodeComponent(sb.toString())
        @Assert("%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%7F", str_right)
    }
}

@Test
class URLDecode {
    @TestCase
    public func decode01(): Unit {
        let str = "hello123"
        let str_right = URL.decode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func decode02(): Unit {
        let str = "%23%24%26%2B%2C%2F%3A%3B%3D%3F%40"
        let str_right = URL.decode(str)
        @Assert("%23%24%26%2B%2C%2F%3A%3B%3D%3F%40", str_right)
    }

    @TestCase
    public func decode03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.decode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func decode04(): Unit {
        let str = "%E4%BD%A0%E5%A5%BD"
        let str_right = URL.decode(str)
        @Assert("你好", str_right)
    }

    let HEX_TEST = "0123456789ABCDEF".toArray()

    @TestCase
    public func decode05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            if ("#$&+,/:;=?@".contains(Rune(i).toString())) {
                let buf = Array<Byte>(3, repeat: b'%')
                buf[1] = HEX_TEST[Int64(i >> 4)]
                buf[2] = HEX_TEST[Int64(i & 0xF)]
                unsafe { sb.appendFromUtf8Unchecked(buf) }
            } else {
                sb.append(Rune(i))
            }
        }
        let str = "%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20%21%22%23%24%25%26%27%28%29%2A%2B%2C%2D%2E%2F%30%31%32%33%34%35%36%37%38%39%3A%3B%3C%3D%3E%3F%40%41%42%43%44%45%46%47%48%49%4A%4B%4C%4D%4E%4F%50%51%52%53%54%55%56%57%58%59%5A%5B%5C%5D%5E%5F%60%61%62%63%64%65%66%67%68%69%6A%6B%6C%6D%6E%6F%70%71%72%73%74%75%76%77%78%79%7A%7B%7C%7D%7E%7F"
        let str_right = URL.decode(str)
        @Assert(sb.toString(), str_right)
    }
}

@Test
class URLDecodeComponent {
    @TestCase
    public func decodeComponent01(): Unit {
        let str = "hello123"
        let str_right = URL.decodeComponent(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func decodeComponent02(): Unit {
        let str = "%23%24%26%2B%2C%2F%3A%3B%3D%3F%40"
        let str_right = URL.decodeComponent(str)
        @Assert("#$&+,/:;=?@", str_right)
    }

    @TestCase
    public func decodeComponent03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.decodeComponent(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func decodeComponent04(): Unit {
        let str = "%E4%BD%A0%E5%A5%BD"
        let str_right = URL.decodeComponent(str)
        @Assert("你好", str_right)
    }

    @TestCase
    public func decodeComponent05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str = "%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20%21%22%23%24%25%26%27%28%29%2A%2B%2C%2D%2E%2F%30%31%32%33%34%35%36%37%38%39%3A%3B%3C%3D%3E%3F%40%41%42%43%44%45%46%47%48%49%4A%4B%4C%4D%4E%4F%50%51%52%53%54%55%56%57%58%59%5A%5B%5C%5D%5E%5F%60%61%62%63%64%65%66%67%68%69%6A%6B%6C%6D%6E%6F%70%71%72%73%74%75%76%77%78%79%7A%7B%7C%7D%7E%7F"
        let str_right = URL.decodeComponent(str)
        @Assert(sb.toString(), str_right)
    }
}

func checkResolveURL(baseUrl: URL, refUrl: URL, expectUrl: URL): Bool {
    var result = baseUrl.resolveURL(refUrl)
    if (result.toString() != expectUrl.toString()) {
        println(result.toString())
        println(expectUrl.toString())
        return false
    }
    return true
}
