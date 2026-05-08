/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

package test_utf8_diagnosed

import std.unittest.*
import std.unittest.testmacro.*

let validMixedUtf8: Array<Byte> = [
    b'a',
    0xE4u8, 0xB8u8, 0xADu8,
    b'b',
    0xF0u8, 0x9Fu8, 0x98u8, 0x80u8
]

let invalidAfterPrefixUtf8: Array<Byte> = [b'a', 0xE4u8, 0xB8u8, 0xADu8, 0x80u8, b'b']

func assertUtf8Error(err: Utf8Error, from!: Int64, length!: Int64): Unit {
    assertEqual("from", "err.from", from, err.from)
    assertEqual("length", "err.length", length, err.length)
}

func assertUtf8ResultOk(result: Utf8Result, expected!: String): Unit {
    match (result) {
        case Utf8Result.Ok(str) =>
            assertEqual("expected string", "str", expected, str)
        case Utf8Result.Error(prefix, err) =>
            fail("Unexpected Utf8Result.Error(prefix=${prefix}, err=${err})")
    }
}

func assertUtf8ResultError(result: Utf8Result, expectedPrefix!: String, from!: Int64, length!: Int64): Unit {
    match (result) {
        case Utf8Result.Ok(str) =>
            fail("Unexpected Utf8Result.Ok: ${str}")
        case Utf8Result.Error(prefix, err) =>
            assertEqual("expected prefix", "prefix", expectedPrefix, prefix)
            assertUtf8Error(err, from: from, length: length)
    }
}

func assertUtf8ResultsEqual(expected: Utf8Result, actual: Utf8Result): Unit {
    match (expected) {
        case Utf8Result.Ok(str) =>
            assertUtf8ResultOk(actual, expected: str)
        case Utf8Result.Error(prefix, err) =>
            assertUtf8ResultError(actual, expectedPrefix: prefix, from: err.from, length: err.length)
    }
}

func assertThrowsIllegalArgument(body: () -> Unit): Unit {
    try {
        body()
        fail("Expected IllegalArgumentException to be thrown.")
    } catch (_: IllegalArgumentException) {
    }
}

@Test
class Utf8DiagnosedTest {
    @TestCase
    func fromUtf8DiagnosedShouldAcceptEmptyArray(): Unit {
        let bytes: Array<Byte> = []
        assertUtf8ResultOk(String.fromUtf8Diagnosed(bytes), expected: "")
    }

    @TestCase
    func stringBuilderAppendFromUtf8DiagnosedShouldAcceptEmptyArray(): Unit {
        let bytes: Array<Byte> = []
        let sb = StringBuilder("prefix")
        let err = sb.appendFromUtf8Diagnosed(bytes)
        assertEqual("None", "err", None, err)
        assertEqual("\"prefix\"", "sb.toString()", "prefix", sb.toString())
    }

    @TestCase
    func fromUtf8DiagnosedShouldReturnOkForValidUtf8(): Unit {
        assertUtf8ResultOk(String.fromUtf8Diagnosed(validMixedUtf8), expected: "a中b😀")
    }

    @TestCase
    func stringBuilderAppendFromUtf8DiagnosedShouldAppendWholeValidUtf8(): Unit {
        let sb = StringBuilder("pre")
        let err = sb.appendFromUtf8Diagnosed(validMixedUtf8)
        assertEqual("None", "err", None, err)
        assertEqual("\"prea中b😀\"", "sb.toString()", "prea中b😀", sb.toString())
    }

    @TestCase
    func fromUtf8DiagnosedShouldReturnPrefixAndErrorForInvalidUtf8(): Unit {
        assertUtf8ResultError(
            String.fromUtf8Diagnosed(invalidAfterPrefixUtf8),
            expectedPrefix: "a中",
            from: 4,
            length: 1
        )
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportTruncatedTailLength(): Unit {
        let bytes: Array<Byte> = [b'a', 0xE4u8, 0xB8u8]
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "a", from: 1, length: 2)
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportSingleByteTruncatedTail(): Unit {
        let bytes: Array<Byte> = [0xE4u8]
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "", from: 0, length: 1)
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportTwoByteTruncatedTail(): Unit {
        let bytes: Array<Byte> = [0xE4u8, 0xB8u8]
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "", from: 0, length: 2)
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportThreeByteTruncatedTail(): Unit {
        let bytes: Array<Byte> = [0xF0u8, 0x9Fu8, 0x98u8]
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "", from: 0, length: 3)
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportFailingEncodingUnitLength(): Unit {
        let bytes: Array<Byte> = [b'a', 0xE4u8, b'A', b'b']
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "a", from: 1, length: 2)
    }

    @TestCase
    func fromUtf8DiagnosedShouldReportThreeByteFailingEncodingUnitLength(): Unit {
        let bytes: Array<Byte> = [0xE4u8, 0x80u8, b'A']
        assertUtf8ResultError(String.fromUtf8Diagnosed(bytes), expectedPrefix: "", from: 0, length: 3)
    }

    @TestCase
    func stringBuilderAppendFromUtf8DiagnosedShouldReportTruncatedTail(): Unit {
        let bytes: Array<Byte> = [b'a', 0xE4u8, 0xB8u8]
        let sb = StringBuilder()
        let err = sb.appendFromUtf8Diagnosed(bytes) ?? fail("Expected Utf8Error.")
        assertEqual("\"a\"", "sb.toString()", "a", sb.toString())
        assertUtf8Error(err, from: 1, length: 2)
    }

    @TestCase
    func stringBuilderAppendFromUtf8DiagnosedShouldOnlyAppendValidPrefix(): Unit {
        let sb = StringBuilder()
        let err = sb.appendFromUtf8Diagnosed(invalidAfterPrefixUtf8) ?? fail("Expected Utf8Error.")
        assertEqual("\"a中\"", "sb.toString()", "a中", sb.toString())
        assertUtf8Error(err, from: 4, length: 1)
    }

    @TestCase
    func stringBuilderAppendFromUtf8DiagnosedShouldKeepExistingPrefix(): Unit {
        let sb = StringBuilder("pre")
        let err = sb.appendFromUtf8Diagnosed([b'a', 0x80u8]) ?? fail("Expected Utf8Error.")
        assertEqual("\"prea\"", "sb.toString()", "prea", sb.toString())
        assertUtf8Error(err, from: 1, length: 1)
    }

    @TestCase
    func stringBuilderAppendFromUtf8ShouldBeAtomicForEmptyBuilder(): Unit {
        let bytes: Array<Byte> = [b'a', 0x80u8]
        unsafe {
            let handle = acquireArrayRawData(bytes)
            try {
                let sb = StringBuilder()
                assertThrowsIllegalArgument({ =>
                    sb.appendFromUtf8(handle.pointer, bytes.size)
                })
                assertEqual("\"\"", "sb.toString()", "", sb.toString())
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func stringBuilderAppendFromUtf8ShouldBeAtomicForExistingBuilder(): Unit {
        let bytes: Array<Byte> = [b'a', 0x80u8]
        unsafe {
            let handle = acquireArrayRawData(bytes)
            try {
                let sb = StringBuilder("pre")
                assertThrowsIllegalArgument({ =>
                    sb.appendFromUtf8(handle.pointer, bytes.size)
                })
                assertEqual("\"pre\"", "sb.toString()", "pre", sb.toString())
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func fromUtf8ShouldThrowForInvalidPointerInput(): Unit {
        let bytes: Array<Byte> = [b'a', 0x80u8, b'b']
        unsafe {
            let handle = acquireArrayRawData(bytes)
            try {
                assertThrowsIllegalArgument({ =>
                    String.fromUtf8(handle.pointer, bytes.size)
                })
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func cPointerDiagnosedOverloadsShouldMatchArrayBehaviourForValidUtf8(): Unit {
        let expected = String.fromUtf8Diagnosed(validMixedUtf8)
        unsafe {
            let handle = acquireArrayRawData(validMixedUtf8)
            try {
                assertUtf8ResultsEqual(expected, String.fromUtf8Diagnosed(handle.pointer, validMixedUtf8.size))

                let builder = StringBuilder("pre")
                let err = builder.appendFromUtf8Diagnosed(handle.pointer, validMixedUtf8.size)
                assertEqual("None", "err", None, err)
                assertEqual("\"prea中b😀\"", "builder.toString()", "prea中b😀", builder.toString())

                assertEqual("\"a中b😀\"", "String.fromUtf8(handle.pointer, validMixedUtf8.size)", "a中b😀", String.fromUtf8(handle.pointer, validMixedUtf8.size))
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func cPointerDiagnosedOverloadsShouldMatchArrayBehaviourForInvalidUtf8(): Unit {
        let expected = String.fromUtf8Diagnosed(invalidAfterPrefixUtf8)
        unsafe {
            let handle = acquireArrayRawData(invalidAfterPrefixUtf8)
            try {
                assertUtf8ResultsEqual(expected, String.fromUtf8Diagnosed(handle.pointer, invalidAfterPrefixUtf8.size))

                let builder = StringBuilder()
                let err = builder.appendFromUtf8Diagnosed(handle.pointer, invalidAfterPrefixUtf8.size) ?? fail("Expected Utf8Error.")
                assertEqual("\"a中\"", "builder.toString()", "a中", builder.toString())
                assertUtf8Error(err, from: 4, length: 1)
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func cPointerOverloadsShouldTreatZeroLengthAsEmptyInput(): Unit {
        let bytes: Array<Byte> = [b'x']
        unsafe {
            let handle = acquireArrayRawData(bytes)
            try {
                assertUtf8ResultOk(String.fromUtf8Diagnosed(handle.pointer, 0), expected: "")
                assertEqual("\"\"", "String.fromUtf8(handle.pointer, 0)", "", String.fromUtf8(handle.pointer, 0))

                let builder = StringBuilder("pre")
                let err = builder.appendFromUtf8Diagnosed(handle.pointer, 0)
                assertEqual("None", "err", None, err)
                builder.appendFromUtf8(handle.pointer, 0)
                assertEqual("\"pre\"", "builder.toString()", "pre", builder.toString())
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func cPointerOverloadsShouldRejectNegativeLength(): Unit {
        let bytes: Array<Byte> = [b'x']
        unsafe {
            let handle = acquireArrayRawData(bytes)
            try {
                assertThrowsIllegalArgument({ =>
                    String.fromUtf8Diagnosed(handle.pointer, -1)
                })
                assertThrowsIllegalArgument({ =>
                    String.fromUtf8(handle.pointer, -1)
                })
                assertThrowsIllegalArgument({ =>
                    let sb = StringBuilder()
                    sb.appendFromUtf8Diagnosed(handle.pointer, -1)
                })
                assertThrowsIllegalArgument({ =>
                    let sb = StringBuilder()
                    sb.appendFromUtf8(handle.pointer, -1)
                })
            } finally {
                releaseArrayRawData(handle)
            }
        }
    }

    @TestCase
    func runeGetFirstUTF8IndexShouldSkipInvalidBytes(): Unit {
        let bytes: Array<Byte> = [0x80u8, 0xBFu8, b'a', 0xE4u8, 0xB8u8, 0xADu8]
        assertEqual("Some(2)", "Rune.getFirstUTF8Index(bytes, 0)", Some(2), Rune.getFirstUTF8Index(bytes, 0))
        assertEqual("Some(3)", "Rune.getFirstUTF8Index(bytes, 2)", Some(3), Rune.getFirstUTF8Index(bytes, 2))
        assertEqual("None", "Rune.getFirstUTF8Index(bytes, 3)", None, Rune.getFirstUTF8Index(bytes, 3))
        assertEqual("None", "Rune.getFirstUTF8Index(bytes, bytes.size)", None, Rune.getFirstUTF8Index(bytes, bytes.size))
    }

    @TestCase
    func runeGetFirstUTF8IndexShouldRespectBoundaryRules(): Unit {
        assertEqual("None", "Rune.getFirstUTF8Index([b'a'], 0)", None, Rune.getFirstUTF8Index([b'a'], 0))
        assertEqual("Some(1)", "Rune.getFirstUTF8Index([b'a', b'b'], 0)", Some(1), Rune.getFirstUTF8Index([b'a', b'b'], 0))
        assertEqual("Some(1)", "Rune.getFirstUTF8Index([0x80u8, b'a'], 0)", Some(1), Rune.getFirstUTF8Index([0x80u8, b'a'], 0))
        assertEqual("None", "Rune.getFirstUTF8Index([0x80u8, 0xBFu8], 0)", None, Rune.getFirstUTF8Index([0x80u8, 0xBFu8], 0))
    }

    @TestCase
    func runeGetFirstUTF8IndexShouldRejectNegativeIndex(): Unit {
        let bytes: Array<Byte> = [b'a', b'b']
        assertThrowsIllegalArgument({ =>
            Rune.getFirstUTF8Index(bytes, -1)
        })
    }
}
