/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 10000 -connections 100 %run_args

import std.net.*
import std.process.*
import std.sync.*
import std.convert.*
import std.collection.*
import std.time.*

class Echo {
    
    let BYTE_ARR_SIZE = 16
    let initialMsg = Array<Byte>(BYTE_ARR_SIZE, { i => UInt8(i) })
    let connections: Int64
    let iters: Int64
    let port: UInt16
    
    let tasks: Array<(()->Unit)> 
    let latch: SyncCounter

    init(connections: Int64, iters: Int64, port: UInt16) {
        this.tasks = Array<(()->Unit)>(connections, { _ => { => ()} })
        
        this.connections = connections
        this.iters = iters
        this.port = port

        this.latch = SyncCounter(connections)
    }

    func startAndWait(): Unit {
        let serverAddress = IPSocketAddress(IPv4Address.localhost, this.port)
        let server = TcpServerSocket(bindAt: serverAddress)
        server.reuseAddress = true
        server.reusePort = true

        server.backlogSize = 2048
        server.bind()

        let ser = spawn {
            for (i in 0..connections) {
                let conn = server.accept()
                let buf = initialMsg.toArray()
                
                tasks[i] = { => 
                    for (i in 0..iters) {
                        conn.write(buf)
                        verifyn(conn.read(buf))
                    }
                    conn.close()
                    verify(buf)
                    latch.dec()
                }
            }

            server.close()
            ()
        }

        let list = ArrayList<Future<Unit>>(2 * connections)

        for (i in 0..connections) {
            let conn = TcpSocket("127.0.0.1", port)
            conn.noDelay = true
            conn.connect() 

            let f = spawn {
                let buf = Array<Byte>(BYTE_ARR_SIZE, repeat: 0)
                
                for (j in 0..iters) {
                    verifyn(conn.read(buf))
                    conn.write(buf)
                }
                conn.close()
                ()
            }
            list.add(f, at: 0)
        }

        ser.get()

        let startTime = DateTime.now()

        for (i in 0..connections) {
            let f = spawn { => tasks[i]() }
            list.add(f, at: 0)
        }
       
        latch.waitUntilZero()

        let result = (DateTime.now() - startTime).toMilliseconds()

        println("Time: ${result}")
        
        for (f in list) {
            f.get()
        }
    }

    func verifyn(n: Int64) {
        if (n != BYTE_ARR_SIZE) {
            throw Exception("error compare")
        }
    }

    func verify(buf: Array<Byte>) {
        for (i in 0..BYTE_ARR_SIZE) {
            if (buf[i] != initialMsg[i]) {
                throw Exception("error compare")
            }
        }
    }
}

var nIter = 10000
var nConn = 100

func parseArgs(args: ArrayList<String>) {
  var pos = 0
  while(pos < args.size) {
    let option = args[pos]
    let value = Int64.tryParse(args[pos+1]).getOrThrow()

    if (value <= 0) {
      throw Exception()
    }

    if (option == "-iter") {
        nIter = value;
    } else if (option == "-connections") {
        nConn = value;
    } else {
        throw Exception();
    }
    pos += 2
  }
}

main() {
    try {
        let args = Process.current.arguments
        let arr = ArrayList<String>(args)
        parseArgs(arr);
    } catch (_) {
        print("Usage: [-iter <num>] [-connections <num>]");
        return 1
    }

    Echo(100, 10000, 27015).startAndWait() // warmup
    Echo(nConn, nIter, 27016).startAndWait()
    0
}
