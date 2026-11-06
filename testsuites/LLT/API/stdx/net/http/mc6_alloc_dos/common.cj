/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package mc6utils

import std.collection.*
import std.convert.Parsable
import std.fs.*
import std.io.*
import std.time.*
import stdx.net.tls.*

public let h2Preface = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()

public const FT_DATA: UInt8 = 0
public const FT_HEADERS: UInt8 = 1
public const FT_RST_STREAM: UInt8 = 3
public const FT_SETTINGS: UInt8 = 4
public const FT_PING: UInt8 = 6
public const FT_GOAWAY: UInt8 = 7
public const FT_WINDOW_UPDATE: UInt8 = 8
public const FT_CONTINUATION: UInt8 = 9
public const FT_PRIORITY_UPDATE: UInt8 = 10

public const FLAG_END_STREAM: UInt8 = 0x1
public const FLAG_END_HEADERS: UInt8 = 0x4
public const FLAG_ACK: UInt8 = 0x1

public class H2Frame {
    public let ftype: UInt8
    public let flags: UInt8
    public let streamId: UInt32
    public let payload: Array<UInt8>

    public init(ftype: UInt8, flags: UInt8, streamId: UInt32, payload: Array<UInt8>) {
        this.ftype = ftype
        this.flags = flags
        this.streamId = streamId
        this.payload = payload
    }

    public func errorCode(): UInt32 {
        if (payload.size < 8) {
            return 0
        }
        return (UInt32(payload[4]) << 24) + (UInt32(payload[5]) << 16) + (UInt32(payload[6]) << 8) + UInt32(payload[7])
    }

    public func debugMessage(): String {
        if (payload.size <= 8) {
            return ""
        }
        let bytes = Array<UInt8>(payload.size - 8, repeat: 0)
        for (i in 0..(payload.size - 8)) {
            bytes[i] = payload[Int64(i) + 8]
        }
        return String.fromUtf8(bytes)
    }
}

public func frameBytes(t: UInt8, flags: UInt8, streamId: UInt32, payload: Array<UInt8>): Array<UInt8> {
    let len = payload.size
    let out = ArrayList<UInt8>()
    out.add(UInt8((UInt32(len) >> 16) & 0xff))
    out.add(UInt8((UInt32(len) >> 8) & 0xff))
    out.add(UInt8(UInt32(len) & 0xff))
    out.add(t)
    out.add(flags)
    out.add(UInt8((streamId >> 24) & 0xff))
    out.add(UInt8((streamId >> 16) & 0xff))
    out.add(UInt8((streamId >> 8) & 0xff))
    out.add(UInt8(streamId & 0xff))
    out.add(all: payload)
    return out.toArray()
}

public func readAll(conn: TlsSocket, buf: Array<UInt8>): Bool {
    var got: Int64 = 0
    while (got < buf.size) {
        var n: Int64 = 0
        try {
            let tmp = Array<UInt8>(buf.size - got, repeat: 0)
            n = conn.read(tmp)
            if (n <= 0) {
                return false
            }
            tmp.copyTo(buf, 0, got, n)
        } catch (e: Exception) {
            return false
        }
        got += n
    }
    return true
}

// read one h2 frame, None on EOF/timeout/error
public func readH2Frame(conn: TlsSocket): ?H2Frame {
    let head = Array<UInt8>(9, repeat: 0)
    if (!readAll(conn, head)) {
        return None
    }
    let len = (Int64(head[0]) << 16) + (Int64(head[1]) << 8) + Int64(head[2])
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0 && !readAll(conn, payload)) {
        return None
    }
    let streamId = (UInt32(head[5]) << 24) + (UInt32(head[6]) << 16) + (UInt32(head[7]) << 8) + UInt32(head[8])
    return Some(H2Frame(head[3], head[4], streamId & 0x7fffffff, payload))
}

/*
 * h2 connection preface for a raw client:
 * send preface + empty SETTINGS, read server SETTINGS, then ACK server settings.
 * The ack is sent only after the server's SETTINGS has been read, otherwise
 * the server may reject it ("Unexpected ack settings").
 */
public func h2ClientHandshake(conn: TlsSocket): Bool {
    try {
        conn.readTimeout = Some(Duration.second * 5)
    } catch (e: Exception) {
        return false
    }
    try {
        conn.write(h2Preface)
        conn.write(frameBytes(FT_SETTINGS, 0, 0, Array<UInt8>()))
        var found = false
        while (!found) {
            let frame = readH2Frame(conn) ?? return false
            if (frame.ftype == FT_SETTINGS && (frame.flags & FLAG_ACK) == 0) {
                found = true
            }
        }
        conn.write(frameBytes(FT_SETTINGS, FLAG_ACK, 0, Array<UInt8>()))
        return true
    } catch (e: Exception) {
        return false
    }
}

// collect frames until deadline; SETTINGS frames are skipped.
// each read waits at most `readTimeout` per frame.
public func collectFrames(conn: TlsSocket, total: Duration, readTimeout!: Duration = Duration.millisecond * 300,
    maxCount!: Int64 = 1000): ArrayList<H2Frame> {
    let result = ArrayList<H2Frame>()
    try {
        conn.readTimeout = Some(readTimeout)
    } catch (e: Exception) {
        return result
    }
    let deadline = MonoTime.now() + total
    while (MonoTime.now() < deadline && result.size < maxCount) {
        let frame = readH2Frame(conn)
        match (frame) {
            case Some(f) =>
                if (f.ftype != FT_SETTINGS) {
                    result.add(f)
                }
            case None => break
        }
    }
    return result
}

/*
 * keep writing `payload` until a write fails (the peer has closed the
 * connection) or the deadline expires. GOAWAY delivery is not guaranteed by
 * the implementation, so connection errors are observed through the socket
 * instead of the GOAWAY frame.
 * Returns the elapsed milliseconds at the first failed write, -1 if the peer
 * never closed within `total`.
 */
public func writeProbeUntilFailure(conn: TlsSocket, total: Duration, payload: Array<UInt8>,
    interval!: Duration = Duration.millisecond * 100): Int64 {
    let start = MonoTime.now()
    while (MonoTime.now() - start < total) {
        try {
            conn.write(payload)
        } catch (e: Exception) {
            return (MonoTime.now() - start).toMilliseconds()
        }
        sleep(interval)
    }
    return -1
}

// an 8-byte PING frame, used as probe payload
public func pingProbe(): Array<UInt8> {
    return frameBytes(FT_PING, 0, 0, [0, 0, 0, 0, 0, 0, 0, 1])
}

// read a single memory metric in kB from /proc/self/status, -1 when unavailable
public func procStatusMetricKb(metric!: String): Int64 {
    let content = String.fromUtf8(readToEnd(File("/proc/self/status", Read)))
    for (line in content.split("\n")) {
        if (line.startsWith(metric)) {
            var value: Int64 = 0
            var started = false
            for (r in line) {
                if (r >= 48u8 && r <= 57u8) { // '0'..'9'
                    value = value * 10 + Int64(r - 48u8)
                    started = true
                } else if (started) {
                    break
                }
            }
            return value
        }
    }
    return -1
}

// current process resident memory in kB
public func vmRssKb(): Int64 {
    return procStatusMetricKb(metric: "VmRSS:")
}

// current process peak resident memory in kB (monotonic, immune to GC timing)
public func vmHwmKb(): Int64 {
    return procStatusMetricKb(metric: "VmHWM:")
}

// HPACK block of a complete GET request headers:
// :method GET (static index 2), :scheme https (static index 7), :path / (static index 4),
// :authority: 127.0.0.1 (literal with incremental indexing, name index 1)
public func getHeaderBlock(host!: String = "127.0.0.1"): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x82)
    out.add(0x87)
    out.add(0x84)
    out.add(0x41)
    let hostBytes = host.toArray()
    out.add(UInt8(hostBytes.size))
    out.add(all: hostBytes)
    return out.toArray()
}
