/*
 * Copyright (c) 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: certs

// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt -Woff all -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.{File, OpenMode}
import std.io.*
import std.net.{TcpServerSocket, TcpSocket}
import std.sync.*
import std.collection.ArrayList
import stdx.crypto.x509.X509Certificate
import stdx.net.tls.*
import stdx.net.tls.common.*
import std.unittest.*
import std.unittest.testmacro.*

/*
 * Regression test for issue 992 (defect 1):
 * TlsSocket.keylessCallback (stdx net/tls/tls_socket.cj:31) is a `static var`
 * plain std.collection.HashMap, the process-global keyless sign/decrypt
 * callback registry. It is WRITTEN by TlsSocket.server(...) (tls_socket.cj:89)
 * on whatever thread creates a keyless server socket, and READ inside the
 * native sign-callback wrapper (handshake.cj:65/:89) on whatever thread runs a
 * keyless handshake - with no synchronization. Concurrent TlsSocket.server()
 * calls race on HashMap.add's non-atomic appendIndex read-modify-write
 * (std/collection hash_map.cj:315-316) and on resize(); registrations are
 * permanently lost, and handshakes for the lost certs then deterministically
 * fail with "Keyless sign callback not found." even after every registering
 * thread has joined. A synchronized map can never lose an entry whose add()
 * completed, so any miss after quiescence is the defect.
 *
 * Scenario (public API only; real loopback TCP pairs, real TLS 1.3 handshakes):
 *   1. provision N real accepted TCP pairs + distinct configs (one keyless
 *      registration each, tagged by index);
 *   2. W worker threads concurrently call TlsSocket.server(...) on their share
 *      (a start gate makes them race together);
 *   3. after all workers join, every registration is probed sequentially:
 *      the server-side keyless handshake must find the sign callback (the
 *      user callback returns an intentionally invalid signature - reaching it
 *      proves the lookup found the entry).
 */

func readTextFromFile(path: String): String {
    var str = ""
    try (file = File(path, Read)) {
        str = String.fromUtf8(readToEnd(file))
    }
    str
}

// Synchronized ledger of sign-callback invocations (test-side bookkeeping).
class CallbackLedger {
    private let mutex = Mutex()
    private var reached: ArrayList<String> = ArrayList<String>()

    func note(tag: String): Unit {
        synchronized (mutex) {
            reached.add(tag)
        }
    }
}

let ledger = CallbackLedger()

func signingCallbackFor(tag: String): KeylessSignFunc {
    // Records that it was reached, then returns an intentionally invalid
    // signature (the handshake will fail with a decrypt/bad-signature alert -
    // which is fine: "callback reached" is the observable, and it proves the
    // registry lookup succeeded).
    return { _ => ledger.note(tag); Array<Byte>(16, repeat: 0) }
}

// One pre-provisioned registration slot built before the racing phase.
class Registration {
    let tag: String
    let config: KeylessTlsServerConfig
    let serverSock: TcpSocket
    let clientSock: TcpSocket
    // TlsSocket created by TlsSocket.server(); None until registered.
    var tls: ?TlsSocket = None

    init(tag: String, config: KeylessTlsServerConfig, serverSock: TcpSocket, clientSock: TcpSocket) {
        this.tag = tag
        this.config = config
        this.serverSock = serverSock
        this.clientSock = clientSock
    }
}

// Each worker owns its listener so no two threads accept() on the same server
// socket (keeps std.net accept semantics out of the code path under test).
class PairFactory {
    private let listener = TcpServerSocket(bindAt: UInt16(0))
    init() {
        listener.bind()
    }
    func make(): (TcpSocket, TcpSocket) {
        let addr = listener.localAddress
        let connectFut = spawn {
            let c = TcpSocket(addr)
            c.connect()
            c
        }
        let serverSide = listener.accept()
        let clientSide = connectFut.get(Duration.second * 10)
        return (serverSide, clientSide)
    }
}

func loadCert(idx: Int64): X509Certificate {
    // certs/ carries three identities; rotate them to synthesize
    // per-registration configs (each registration is a separate add()).
    let names = ["server_rsa", "server_ecc", "server2_rsa"]
    let text = readTextFromFile("./certs/${names[idx % 3]}.crt")
    let arr = X509Certificate.decodeFromPem(text)
    if (arr.isEmpty()) {
        @Fail("empty pem certs/${names[idx % 3]}.crt")
    }
    return arr[0]
}

// Runs one real keyless handshake pair over a pre-provisioned TCP pair.
// Returns true when the server side observed a registry miss.
func probeRegistration(e: Registration): Bool {
    let clientFut = spawn {
        var cc = TlsClientConfig()
        cc.verifyMode = CertificateVerifyMode.TrustAll
        try {
            let ctls = TlsSocket.client(e.clientSock, clientConfig: cc)
            ctls.handshake(timeout: Duration.second * 10)
            "client-ok"
        } catch (ex: Exception) {
            "client-err:${ex.message}"
        }
    }
    let serverFut = spawn {
        try {
            match (e.tls) {
                case Some(t) => t.handshake(timeout: Duration.second * 10)
                case None => throw Exception("not registered")
            }
            "server-handshake-ok"
        } catch (ex: Exception) {
            "EXC:${ex.message}"
        }
    }
    var serverRes = "EXC:no-result"
    var missed = false
    try {
        serverRes = serverFut.get(Duration.second * 60)
    } catch (te: Exception) {
        serverRes = "EXC:handshake-hang"
        missed = true
    }
    if (serverRes.contains("Keyless sign callback not found") ||
        serverRes.contains("Keyless decrypt callback not found") ||
        serverRes.contains("Missing keyless sign callback") ||
        serverRes.contains("Missing keyless decrypt callback")) {
        missed = true
    }
    try {
        clientFut.get(Duration.second * 30)
    } catch (_: Exception) {
    }
    return missed
}

@Test
class Test_TlsSocket_Keyless_Registry_Concurrent_Registration {
    /*
     * Concurrent TlsSocket.server() must not throw and must not lose
     * registrations: after all registering threads joined, every completed
     * registration must be findable by a subsequent keyless handshake.
     */
    static const workerCount: Int64 = 8
    static const certsPerWorker: Int64 = 24 // 192 concurrent registrations

    @TestCase
    func concurrentRegistrationsAreAllFindable(): Unit {
        let registrations = ArrayList<Registration>()
        let registrationErrors = ArrayList<String>()
        let listMutex = Mutex()

        // ---- Phase 1: provision pairs + configs (sequential w.r.t. the map).
        let total = workerCount * certsPerWorker
        let provisionFuts = ArrayList<Future<Unit>>()
        let provisionMutex = Mutex()
        for (w in 0..workerCount) {
            let wid = w
            let f = spawn {
                let pf = PairFactory()
                for (j in 0..certsPerWorker) {
                    let idx = wid * certsPerWorker + j
                    let cert = loadCert(idx)
                    let tag = "e-${idx}"
                    let cfg = KeylessTlsServerConfig([cert], signingCallbackFor(tag))
                    let (s, c) = pf.make()
                    synchronized (provisionMutex) {
                        registrations.add(Registration(tag, cfg, s, c))
                    }
                }
            }
            provisionFuts.add(f)
        }
        for (f in provisionFuts) {
            f.get(Duration.second * 600)
        }
        @Expect(registrations.size == total, true)

        // ---- Phase 2: racing concurrent TlsSocket.server() calls.
        let gate = AtomicBool(false)
        let raceFuts = ArrayList<Future<Unit>>()
        for (w in 0..workerCount) {
            let wid = w
            let f = spawn {
                // all workers start registering together
                while (!gate.load()) {}
                let lo = wid * certsPerWorker
                for (j in 0..certsPerWorker) {
                    let e = registrations[lo + j]
                    try {
                        e.tls = Some(TlsSocket.server(e.serverSock, serverConfig: e.config))
                    } catch (ex: Exception) {
                        synchronized (listMutex) {
                            registrationErrors.add("${e.tag}: ${ex.message}")
                        }
                    }
                }
            }
            raceFuts.add(f)
        }
        gate.store(true)
        for (f in raceFuts) {
            f.get(Duration.second * 600)
        }

        // Concurrent registration must not throw. The observed defect also
        // surfaces as "The length of the array is N, but the index is N."
        // from the appendIndex race inside HashMap.add.
        @Expect(registrationErrors.isEmpty(), true)

        // ---- Phase 3: quiesced probe; every registration must be findable.
        var misses: Int64 = 0
        var missedTags = ""
        for (e in registrations) {
            if (probeRegistration(e)) {
                misses += 1
                if (missedTags.size < 300) {
                    missedTags = "${missedTags} ${e.tag}"
                }
            }
            try {
                e.clientSock.close()
            } catch (_: Exception) {}
        }
        @Expect(misses == 0, true)
        @Expect(missedTags, "")
    }
}
