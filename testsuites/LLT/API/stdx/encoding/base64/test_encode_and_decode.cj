/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import stdx.encoding.base64.*
import std.unittest.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

@Test
class encodeAndDecode {
    @TestCase
    func inputNullStringReturnNullArray(): Unit {
        var str = ""
        var result = 1
        var res = fromBase64String(str)
        match (res) {
            case Some(x) => result = 0
            case None => result = 1
        }
        @Expect(result, 0)
    }

    @TestCase[str in [ "abc@", "eGllA", "Y2Fu==Z2ppZ" ] 
]
    func inputInvalidStringReturnNone(str: String): Unit {
        var res = fromBase64String(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Expect(arr.size, 0)
    }

    @TestCase
    func inputStringReturnArray(): Unit {
        var str = "Y2FuZ2ppZQ=="
        var res = fromBase64String(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        var tmp: Array<UInt8> = [99, 97, 110, 103, 106, 105, 101] //"cangjie"
        @Assert(arr.size, tmp.size)
        for (i in 0..arr.size) {
            @Assert(arr[i], tmp[i])
        }

        str = "Mi4xLjEuMSBOdW1lcmljIExpdGVyYWxzDQpUZXJtcyBzdWNoIGFzICA1ICwgIDI0ICwgIDIuOSAsIGFuZCAgMy4xNCBhcmUgcmVmZXJyZWQgdG8gYXMgbnVtZXJpYyBsaXRlcmFscy4gTGl0ZXJhbHMgY2FuIGJlIHJlZmVycmVkDQp0byBvbmx5IGJ5IHRoZWlyIHZhbHVlcyBhbmQgdGhlaXIgdmFsdWVzIGNhbm5vdCBiZSBjaGFuZ2VkLg0KSW4gdGhlIGZvbGxvd2luZywgd2UgaW50cm9kdWNlIHRoZSBpbnRlZ2VyIGxpdGVyYWxzIGFzIHdlbGwgYXMgdGhlIGZsb2F0aW5nIHBvaW50IGxpdGVyYWxzLg0KSW50ZWdlciBsaXRlcmFscyBjYW4gYmUgd3JpdHRlbiBpbiBmb3VyIGJhc2VzOiBiaW5hcnksIG9jdGFsLCBkZWNpbWFsLCBhbmQgaGV4YWRlY2ltYWwuIEJpbmFyeQ0KbGl0ZXJhbHMgbXVzdCBzdGFydCB3aXRoICAwYiAob3IgIDBCICksIG9jdGFsIGxpdGVyYWxzIG11c3Qgc3RhcnQgd2l0aCAgMG8gKG9yICAwTyApLCBhbmQgaGV4YWRlY2ltYWwNCmxpdGVyYWxzIG11c3Qgc3RhcnQgd2l0aCAgMHggKG9yICAwWCApLiBEZWNpbWFsIGxpdGVyYWxzIGRvIG5vdCByZXF1aXJlIGEgcHJlZml4LiBGb3IgZXhhbXBsZSwgdGhlDQpkZWNpbWFsIHZhbHVlICAyNCBtYXkgYmUgd3JpdHRlbiBpbiBhbnkgb25lIG9mIHRoZSBmb2xsb3dpbmcgZm91ciBmb3JtcywgaW4gd2hpY2ggdGhlIHVuZGVybGluZQ0KXyBhY3RzIGFzIGEgc2VwYXJhdG9yIGZvciByZWFkYWJpbGl0eToNClNlZSBzZWN0aW9uIEludGVnZXIgTGl0ZXJhbHMgZm9yIHRoZSBzeW50YXggb2YgaW50ZWdlciBsaXRlcmFscy4NCkZsb2F0aW5nLXBvaW50IHR5cGVzIGluIHRoZSBDYW5namllIHByb2dyYW1taW5nIGxhbmd1YWdlIGNvbmZvcm0gdG8gdGhlIElFRUUgNzU0IHN0YW5kYXJkLiBJbg0KcGFydGljdWxhciwgIEZsb2F0MTYgY29ycmVzcG9uZHMgdG8gdGhlIGhhbGYtcHJlY2lzaW9uIGZvcm1hdCAoMTYtYml0KSBpbiBJRUVFIDc1NDsgIEZsb2F0MzINCmNvcnJlc3BvbmRzIHRvIHRoZSBzaW5nbGUtcHJlY2lzaW9uIGZvcm1hdCAoMzItYml0KSBpbiBJRUVFIDc1NCwgYW5kICBGbG9hdDY0IGNvcnJlc3BvbmRzIHRvIHRoZQ0KZG91YmxlLXByZWNpc2lvbiBmb3JtYXQoNjQtYml0KSBpbiBJRUVFIDc1NC4gQSBmbG9hdGluZy1wb2ludCBsaXRlcmFsIHVzdWFsbHkgY29udGFpbnMgYW4gaW50ZWdlcg0KcGFydCwgYSBmcmFjdGlvbmFsIHBhcnQgKGluY2x1ZGluZyBhIGRlY2ltYWwgcG9pbnQpLCBhbmQgYW4gZXhwb25lbnRpYWwgcGFydC4gVGhlcmUgYXJlIHR3byBmb3JtcyBvZg0KcmVwcmVzZW50YXRpb246IGRlY2ltYWwgb3IgaGV4YWRlY2ltYWwuIEluIHRoZSBkZWNpbWFsIHJlcHJlc2VudGF0aW9uLCBhIGZsb2F0aW5nLXBvaW50IG51bWJlcg0KbXVzdCBjb250YWluIGFuIGludGVnZXIgcGFydCBvciBhIGZyYWN0aW9uYWwgcGFydC4gQW4gZXhwb25lbnRpYWwgcGFydCAocHJlZml4ZWQgd2l0aCBlIG9yIEUsIGFuZA0KYmFzZSAxMCkgaXMgcmVxdWlyZWQgd2hlbiB0aGVyZSBpcyBubyBkZWNpbWFsIHBhcnQuIEluIHRoZSBoZXhhZGVjaW1hbCByZXByZXNlbnRhdGlvbiwgYSBmbG9hdGluZw0KMGIwMDAxXzEwMDAgJiMxNjA7JiMxNjA7Ly8gQmluYXJ5Lg0KMG8zMCAmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsvLyBPY3RhbC4NCjI0ICYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOy8vIERlY2ltYWwuDQoweDE4ICYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOy8vIEhleGFkZWNpbWFsLg0KMQ0KMg0KMw0KNA0KcG9pbnQgbnVtYmVyIG11c3QgY29udGFpbiBhdCBsZWFzdCBvbmUgaW50ZWdlciBwYXJ0IG9yIGZyYWN0aW9uYWwgcGFydCAocHJlZml4ZWQgd2l0aCAweCkgYW5kIG11c3QNCmNvbnRhaW4gYW4gZXhwb25lbnRpYWwgcGFydCAocHJlZml4ZWQgd2l0aCBwIG9yIFAsIGFuZCBiYXNlIDIpLiBJbiBhZGRpdGlvbiwgdGhlIGZvbGxvd2luZyBhcmUNCmFkZGl0aW9uYWwgc3BlY2lhbCBmbG9hdGluZy1wb2ludCBsaXRlcmFsczogcG9zaXRpdmUgaW5maW5pdHkgKCBQT1NJVElWRV9JTkZJTklUWSApLCBuZWdhdGl2ZSBpbmZpbml0eQ0KKCBORUdBVElWRV9JTkZJTklUWSApLCBOb3QgYSBOdW1iZXIgKCBOYU4gKSwgcG9zaXRpdmUgMCAoICswLjAgKSBhbmQgbmVnYXRpdmUgMCAoLSAwLjAgKS4gIGluZmluaXR5DQpyZXByZXNlbnRzIHRoZSByZXN1bHQgb2YgYW4gb3BlcmF0aW9uIGJleW9uZCB0aGUgcmFuZ2Ugb2YgdGhlIGZsb2F0aW5nLXBvaW50IHR5cGUuIEZvciBleGFtcGxlLCBpZg0KdHdvIGxhcmdlIGZsb2F0aW5nLXBvaW50IG51bWJlcnMgYXJlIG11bHRpcGxpZWQgb3IgYSBub24temVybyBudW1iZXIgaXMgZGl2aWRlZCBieSAgMCAsIHRoZSByZXN1bHQNCmlzICBpbmZpbml0eSAuIE5vdGUgdGhhdCB0aGUgc2lnbiBvZiB0aGUgIGluZmluaXR5IGlzIGRldGVybWluZWQgYnkgdGhlIHNpZ25zIG9mIHRoZSBvcGVyYW5kcy4NCk5hTiByZXByZXNlbnRzIGEgdmFsdWUgdGhhdCBpcyBuZWl0aGVyIGEgcmVhbCB2YWx1ZSBub3IgaW5maW5pdHkuIEZvciBleGFtcGxlLCB0aGUgcmVzdWx0IG9mDQpQT1NJVElWRV9JTkZJTklUWSAqIDAgaXMgIE5hTiAuIFRoZSBmb2xsb3dpbmcgYXJlIGV4YW1wbGVzIG9mIGZsb2F0aW5nLXBvaW50IGxpdGVyYWxzLg0KU2VlIHNlY3Rpb24gRmxvYXRpbmcgUG9pbnQgTGl0ZXJhbHMgZm9yIHRoZSBzeW50YXggb2YgZmxvYXRpbmctcG9pbnQgbGl0ZXJhbHMuDQoyLjEuMS4yIE9wZXJhdG9ycyBTdXBwb3J0ZWQgYnkgTnVtYmVyIFR5cGVzDQpPcGVyYXRvcnMgc3VwcG9ydGVkIGJ5IG51bWVyaWMgdHlwZXMgaW5jbHVkZTogYXJpdGhtZXRpYyBvcGVyYXRvcnMsIGJpdHdpc2Ugb3BlcmF0b3JzLA0KcmVsYXRpb25hbCBvcGVyYXRvcnMsIGluY3JlbWVudC9kZWNyZW1lbnQgb3BlcmF0b3JzLCB1bmFyeSBuZWdhdGl2ZSBvcGVyYXRvcnMsIGFuZCAoY29tcG91bmQpDQphc3NpZ25tZW50IG9wZXJhdG9ycy4gQWxsIHRoZSBwcmVjZWRpbmcgb3BlcmF0b3JzIGFyZSBkZWZpbmVkIGZvciBpbnRlZ2VyIHR5cGVzLiBBbGwgYnV0IGJpdHdpc2UNCm9wZXJhdG9ycyBhcmUgZGVmaW5lZCBmb3IgZmxvYXRpbmctcG9pbnQgdHlwZXMuIEluIHRoZSBmb2xsb3dpbmcsIHdlIGZvY3VzIG9uIGludHJvZHVjaW5nIGhvdw0KdGhlc2Ugb3BlcmF0b3JzIGFyZSBkZWZpbmVkIGZvciBpbnRlZ2VyIHR5cGVzLCB3aXRoIHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgc2FtZSBhcHBsaWVzIHRvDQpmbG9hdGluZy1wb2ludCB0eXBlcy4NCkFyaXRobWV0aWMgb3BlcmF0b3JzIGluY2x1ZGUgYWRkaXRpb24oICsgKSwgc3VidHJhY3Rpb24oIC0gKSwgbXVsdGlwbGljYXRpb24oICogKSwgZGl2aXNpb24oIC8gKSwNCnJlbWluZGVyKCAlICksIGFuZCBwb3dlciggKiogKS4gSWYgYXJpdGhtZXRpYyBvcGVyYXRvcnMgYXJlIG5vdCBvdmVybG9hZCAoc2VlIHNlY3Rpb24gb3BlcmF0b3INCm92ZXJsb2FkaW5nKSwgdGhlIG9wZXJhbmRzIG9mIHRoZW0gbXVzdCBoYXZlIHRoZSBzYW1lIHR5cGUuIEV4cGxpY2l0IHR5cGUgY29udmVyc2lvbiBtdXN0IGJlDQpwZXJmb3JtZWQgZmlyc3QgdG8gcGVyZm9ybSBvcGVyYXRpb25zIG9uIG9wZXJhbmRzIHdpdGggZGlmZmVyZW50IHR5cGVzLiBUaGUgZm9sbG93aW5nIHNob3dzDQpleGFtcGxlcyBvZiBhcml0aG1ldGljIG9wZXJhdGlvbnMuIFRoZSByZWFkZXJzIGFyZSByZWZlcnJlZCB0byBzZWN0aW9uIEFyaXRobWV0aWMgRXhwcmVzc2lvbnMgZm9yDQp0aGUgcHJlY2VkZW5jZSBhbmQgYXNzb2NpYXRpdml0eSBvZiB0aGUgYXJpdGhtZXRpYyBvcGVyYXRvcnMuDQpCaXR3aXNlIG9wZXJhdG9ycyBpbmNsdWRlIGJpdHdpc2Ugbm90ICggISApLCBiaXR3aXNlIGxlZnQgc2hpZnQgKCAmbHQ7Jmx0OyApLCBiaXR3aXNlIHJpZ2h0IHNoaWZ0ICggJmd0OyZndDsgKSwgYml0d2lzZQ0KYW5kICggJiApLCBiaXR3aXNlIHhvciAoIF4gKSwgYW5kIGJpdCBvciAoIHwgKS4gRm9yIGRldGFpbHMgYWJvdXQgcHJlY2VkZW5jZSwgc2VlIHRoZSBkZXNjcmlwdGlvbiBvZg0KYml0d2lzZSBleHByZXNzaW9ucyBpbiBDaGFwdGVyIDQuIFRoZSBmb2xsb3dpbmcgYXJlIHNpbXBsZSBleGFtcGxlcyBvZiBiaXQgb3BlcmF0aW9ucyBvbg0KaW50ZWdlcnMuDQozLjE0IC8vIGRlY2ltYWwgRmxvYXQ2NCAzLjE0Lg0KMi40ZS0xIC8vIGRlY2ltYWwgRmxvYXQ2NCAwLjI0Lg0KMmUzIC8vIGRlY2ltYWwgRmxvYXQ2NCAyMDAwLjAuDQouOCAvLyBkZWNpbWFsIEZsb2F0NjQgMC44Lg0KLjEyM2UyIC8vIGRlY2ltYWwgRmxvYXQ2NCAxMi4zLg0KMHgxLjFwMCAvLyBoZXhhZGVjaW1hbCBGbG9hdDY0IDEuMDYyNSAoZGVjaW1hbCB2YWx1ZSkuDQoweDFwMiAvLyBoZXhhZGVjaW1hbCBGbG9hdDY0IDQgKGRlY2ltYWwgdmFsdWUpLg0KMHguMnA0IC8vIGhleGFkZWNpbWFsIEZsb2F0NjQgMiAoZGVjaW1hbCB2YWx1ZSkuDQoxDQoyDQozDQo0DQo1DQo2DQo3DQo4DQoyICsgMyAmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsvLyBhZGQgcmVzdWx0OiA1DQozIC0gMSAmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsvLyBzdWIgcmVzdWx0OiAyDQozICogOSAmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsvLyBtdWwgcmVzdWx0OiAyNw0KMjQgLyA4ICYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOy8vIGRpdiByZXN1bHQ6IDMNCjcgJSAzICYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOy8vIG1vZCByZXN1bHQ6IDENCjIgKiogMyAmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsvLyBwb3dlciByZXN1bHQ6IDgNCjUgKyAxNSAtIDIgKiAxMCAvIDQgJiMxNjA7JiMxNjA7Ly8gcmVzdWx0OiAxNQ0KNSArIDEwIC0gMyAqIDQgKiogMiAvIDMgJSA1ICYjMTYwOy8vIHJlc3VsdDogMTQNCjENCjINCjMNCjQNCjUNCjYNCjcNCjgNClJlbGF0aW9uYWwgb3BlcmF0b3JzIGluY2x1ZGUgbGVzcyB0aGVuKCAmbHQ7ICksIGdyZWF0ZXIgdGhhbiggJmd0OyApLCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8oICZsdDs9ICksIGdyZWF0ZXINCnRoYW4gb3IgZXF1YWwgdG8oICZndDs9ICksIGVxdWFsIHRvKCA9PSApLCBhbmQgbm90IGVxdWFsIHRvKCAhPSApLiBUaGVpciByZXN1bHRzIGFyZSBCb29sZWFuIHZhbHVlcyAoaS5lLg0KdHJ1ZSBvciBmYWxzZSkuIEZvciBkZXRhaWxzIGFib3V0IHJlbGF0aW9uYWwgb3BlcmF0aW9ucywgc2VlIHRoZSBkZXNjcmlwdGlvbiBvZiByZWxhdGlvbmFsIG9wZXJhdG9ycw0KaW4gQ2hhcHRlciA0LiBUaGUgZm9sbG93aW5nIGFyZSBleGFtcGxlcyByZWxhdGlvbmFsIG9wZXJhdGlvbnMgb24gaW50ZWdlcnMuDQpTZWxmLWluY3JlbWVudC9kZWNyZW1lbnQgb3BlcmF0b3JzIGluY2x1ZGUgdGhlIHNlbGYtaW5jcmVtZW50KCArKyApIGFuZCBzZWxmLWRlY3JlbWVudCggLS0gKS4NClRoZXNlIGNhbiBiZSByZWdhcmRlZCBhcyBzcGVjaWFsIGFzc2lnbm1lbnQgb3BlcmF0b3IsIHVzaW5nIGZvciBhZGRpbmcgb3Igc3VidHJhY3RpbmcgIDEgZm9yIHRoZQ0KdmFyaWFibGUuIEluIGFkZGl0aW9uLCB0aGUgaW5jcmVtZW50IChkZWNyZW1lbnQpIG9wZXJhdG9ycyBjYW4gb25seSBiZSB1c2VkIGFzIHRoZSBwb3N0Zml4DQpvcGVyYXRvcnMsIGFuZCBjYW4gb25seSBiZSBhcHBsaWVkIHRvIG51bWVyaWMgdmFyaWFibGVzLCBhcyB0aGUgdmFsdWVzIG9mIG51bWVyaWMgY29uc3RhbnRzIGFuZA0KbnVtZXJpYyBsaXRlcmFscyBjYW5ub3QgYmUgbW9kaWZpZWQuIEZvciBkZXRhaWxzIGFib3V0IHRoZSBzZWxmLWluY3JlbWVudCAoZGVjcmVtZW50KSBvcGVyYXRpb25zLA0Kc2VlIENoYXB0ZXIgNC4gVGhlIGZvbGxvd2luZyBhcmUgZXhhbXBsZXMgb2Ygc2VsZi1pbmNyZW1lbnQgKGRlY3JlbWVudCkgb3BlcmF0aW9ucyBvbiBpbnRlZ2Vycy4="
        res = fromBase64String(str)
        arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        tmp = [50, 46, 49, 46, 49, 46, 49, 32, 78, 117, 109, 101, 114, 105, 99, 32, 76, 105, 116, 101, 114, 97, 108, 115,
            13, 10, 84, 101, 114, 109, 115, 32, 115, 117, 99, 104, 32, 97, 115, 32, 32, 53, 32, 44, 32, 32, 50, 52, 32,
            44, 32, 32, 50, 46, 57, 32, 44, 32, 97, 110, 100, 32, 32, 51, 46, 49, 52, 32, 97, 114, 101, 32, 114, 101,
            102, 101, 114, 114, 101, 100, 32, 116, 111, 32, 97, 115, 32, 110, 117, 109, 101, 114, 105, 99, 32, 108, 105,
            116, 101, 114]
        for (i in 0..100) {
            @Assert(arr[i], tmp[i])
        }
        @Expect(arr[arr.size - 2], 115)
        @Expect(arr[arr.size - 1], 46)
    }

    @TestCase
    func inputNullArrayReturnNullString(): Unit {
        var arr = Array<UInt8>()
        var str = toBase64String(arr)
        @Expect(str, "")
    }

    @TestCase
    func inputArrayReturnString(): Unit {
        var arr: Array<UInt8> = [99, 97, 110, 103, 106, 105, 101] //"cangjie"
        var str = toBase64String(arr)
        @Expect(str, "Y2FuZ2ppZQ==")
    }

    @TestCase
    func encodeAndDecode(): Unit {
        var input: Array<UInt8> = [126, 149, 21, 37, 48, 214, 94, 4, 90, 102, 75, 174, 24, 197, 216, 31, 53, 193, 17,
            159, 246, 48, 6, 64, 150, 233, 139, 188, 150, 155, 201, 69, 236, 2, 5, 130, 229, 198, 54, 218, 237, 71, 202,
            98, 232, 124, 29, 145, 180, 166, 132, 158, 5, 66, 49, 248, 158, 48, 223, 202, 21, 178, 1, 222, 243, 201, 77,
            147, 163, 43, 104, 53, 204, 8, 17, 136, 36, 214, 84, 114, 9, 36, 8, 233, 76, 12, 73, 87, 237, 130, 124, 42,
            63, 94, 190, 233, 133, 96, 117, 140, 28, 213, 249, 251, 48, 223, 204, 152, 49, 17, 137, 50, 116, 192, 9, 115,
            73, 107, 215, 123, 210, 204, 212, 252, 176, 114, 144, 10, 98, 59, 69, 98, 214, 119, 204, 162, 217, 254, 248,
            111, 21, 84, 4, 143, 34, 64, 44, 10, 190, 225, 187, 232, 170, 22, 110, 164, 90, 33, 232, 243, 118, 216, 179,
            241, 31, 145, 155, 80, 100, 94, 199, 65, 158]
        var str = toBase64String(input)
        var res = fromBase64String(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Assert(input.size, arr.size)
        for (i in 0..input.size) {
            @Assert(input[i], arr[i])
        }
    }
}
