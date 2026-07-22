/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.io.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class IoBranchApiTest {

    // === ByteBuffer ===
    @TestCase
    func test_bytebuffer_basic(): Unit {
        let buf = ByteBuffer()
        buf.write([72, 73])
        @Expect(buf.bytes().size, 2)
        @Expect(buf.bytes()[0], 72)
    }

    @TestCase
    func test_bytebuffer_read(): Unit {
        let buf = ByteBuffer([1, 2, 3])
        let arr = Array<Byte>(3, repeat: 0)
        let n = buf.read(arr)
        @Expect(n, 3)
        @Expect(arr[0], 1)
        @Expect(arr[2], 3)
    }

    @TestCase
    func test_bytebuffer_read_empty(): Unit {
        let buf = ByteBuffer()
        let arr = Array<Byte>(3, repeat: 0)
        let n = buf.read(arr)
        @Expect(n, 0)
    }

    @TestCase
    func test_bytebuffer_readbyte(): Unit {
        let buf = ByteBuffer([10, 20])
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 10)
            case None => @Assert(false)
        }
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 20)
            case None => @Assert(false)
        }
        match (buf.readByte()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_bytebuffer_writebyte(): Unit {
        let buf = ByteBuffer()
        buf.writeByte(42)
        @Expect(buf.bytes().size, 1)
        @Expect(buf.bytes()[0], 42)
    }

    @TestCase
    func test_bytebuffer_clone(): Unit {
        let buf = ByteBuffer([1, 2, 3])
        let cloned = buf.clone()
        @Expect(cloned.bytes().size, 3)
    }

    @TestCase
    func test_bytebuffer_clear(): Unit {
        let buf = ByteBuffer([1, 2, 3])
        buf.clear()
        @Expect(buf.bytes().size, 0)
    }

    @TestCase
    func test_bytebuffer_setlength_negative(): Unit {
        let buf = ByteBuffer()
        var caught = false
        try {
            buf.setLength(-1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_bytebuffer_reserve_negative(): Unit {
        let buf = ByteBuffer()
        var caught = false
        try {
            buf.reserve(-1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_bytebuffer_seek_begin(): Unit {
        let buf = ByteBuffer([1, 2, 3, 4, 5])
        buf.seek(Begin(2))
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_bytebuffer_seek_current(): Unit {
        let buf = ByteBuffer([1, 2, 3, 4, 5])
        buf.readByte()
        buf.seek(Current(1))
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_bytebuffer_seek_end(): Unit {
        let buf = ByteBuffer([1, 2, 3, 4, 5])
        buf.seek(End(-1))
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 5)
            case None => @Assert(false)
        }
    }

    // === SeekPosition enum ===
    @TestCase
    func test_seekposition_current(): Unit {
        let sp = SeekPosition.Current(10)
        match (sp) {
            case SeekPosition.Current(v) => @Expect(v, 10)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_seekposition_begin(): Unit {
        let sp = SeekPosition.Begin(0)
        match (sp) {
            case SeekPosition.Begin(v) => @Expect(v, 0)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_seekposition_end(): Unit {
        let sp = SeekPosition.End(-5)
        match (sp) {
            case SeekPosition.End(v) => @Expect(v, -5)
            case _ => @Assert(false)
        }
    }

    // === ContentFormatException ===
    @TestCase
    func test_content_format_exception_no_arg(): Unit {
        let e = ContentFormatException()
        @Assert(true)
    }

    @TestCase
    func test_content_format_exception_with_msg(): Unit {
        let e = ContentFormatException("format error")
        @Assert(e.message.contains("format error"))
    }

    // === StringWriter ===
    @TestCase
    func test_stringwriter_write_string(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write("hello")
        sw.flush()
        let result = buf.bytes()
        @Expect(result.size, 5)
        @Expect(result[0], 104) // 'h'
    }

    @TestCase
    func test_stringwriter_write_empty(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write("")
        sw.flush()
        @Expect(buf.bytes().size, 0)
    }

    @TestCase
    func test_stringwriter_write_int64(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write(Int64(42))
        sw.flush()
        let result = buf.bytes()
        @Expect(result.size, 2)
    }

    @TestCase
    func test_stringwriter_write_uint64(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write(UInt64(99))
        sw.flush()
        @Expect(buf.bytes().size, 2)
    }

    @TestCase
    func test_stringwriter_write_bool(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write(true)
        sw.flush()
        let result = buf.bytes()
        @Expect(result.size, 4) // "true"
    }

    @TestCase
    func test_stringwriter_writeln(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.writeln("line1")
        sw.flush()
        let result = buf.bytes()
        @Expect(result.size, 6) // "line1\n"
    }

    @TestCase
    func test_stringwriter_write_rune(): Unit {
        let buf = ByteBuffer()
        let sw = StringWriter<ByteBuffer>(buf)
        sw.write(r'A')
        sw.flush()
        @Expect(buf.bytes().size, 1)
    }

    // === StringReader ===
    @TestCase
    func test_stringreader_read(): Unit {
        let buf = ByteBuffer("hello".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        match (sr.read()) {
            case Some(r) => @Expect(r, r'h')
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_stringreader_readln(): Unit {
        let buf = ByteBuffer("line1\nline2".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        match (sr.readln()) {
            case Some(s) => @Expect(s, "line1")
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_stringreader_readtoend(): Unit {
        let buf = ByteBuffer("hello world".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        @Expect(sr.readToEnd(), "hello world")
    }

    @TestCase
    func test_stringreader_readuntil(): Unit {
        let buf = ByteBuffer("hello,world".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        match (sr.readUntil(r',')) {
            case Some(s) => @Expect(s, "hello,")
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_stringreader_lines(): Unit {
        let buf = ByteBuffer("a\nb\nc".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        var count = 0
        for (line in sr.lines()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_stringreader_runes(): Unit {
        let buf = ByteBuffer("abc".toArray())
        let sr = StringReader<ByteBuffer>(buf)
        var count = 0
        for (r in sr.runes()) {
            count++
        }
        @Expect(count, 3)
    }

    // === BufferedInputStream ===
    @TestCase
    func test_buffered_input_stream(): Unit {
        let buf = ByteBuffer([1, 2, 3, 4, 5])
        let bis = BufferedInputStream<ByteBuffer>(buf)
        let arr = Array<Byte>(3, repeat: 0)
        let n = bis.read(arr)
        @Expect(n, 3)
        @Expect(arr[0], 1)
    }

    @TestCase
    func test_buffered_input_stream_readbyte(): Unit {
        let buf = ByteBuffer([10, 20])
        let bis = BufferedInputStream<ByteBuffer>(buf)
        match (bis.readByte()) {
            case Some(b) => @Expect(b, 10)
            case None => @Assert(false)
        }
    }

    // === BufferedOutputStream ===
    @TestCase
    func test_buffered_output_stream(): Unit {
        let buf = ByteBuffer()
        let bos = BufferedOutputStream<ByteBuffer>(buf)
        bos.write([1, 2, 3])
        bos.flush()
        @Expect(buf.bytes().size, 3)
    }

    @TestCase
    func test_buffered_output_stream_writebyte(): Unit {
        let buf = ByteBuffer()
        let bos = BufferedOutputStream<ByteBuffer>(buf)
        bos.writeByte(42)
        bos.flush()
        @Expect(buf.bytes()[0], 42)
    }

    // === ChainedInputStream ===
    @TestCase
    func test_chained_input_stream(): Unit {
        let buf1 = ByteBuffer([1, 2])
        let buf2 = ByteBuffer([3, 4])
        let cis = ChainedInputStream<ByteBuffer>([buf1, buf2])
        let arr = Array<Byte>(4, repeat: 0)
        let n = cis.read(arr)
        @Assert(n > 0)
    }

    // === MultiOutputStream ===
    @TestCase
    func test_multi_output_stream(): Unit {
        let buf1 = ByteBuffer()
        let buf2 = ByteBuffer()
        let mos = MultiOutputStream<ByteBuffer>([buf1, buf2])
        mos.write([1, 2, 3])
        mos.flush()
        @Expect(buf1.bytes().size, 3)
        @Expect(buf2.bytes().size, 3)
    }
}
