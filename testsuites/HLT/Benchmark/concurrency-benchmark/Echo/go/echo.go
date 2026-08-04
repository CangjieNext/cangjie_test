/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
	"fmt"
	"net"
	"os"
  "strconv"
	"sync"
	"time"
)

const (
	BYTE_ARR_SIZE = 16
)

type Echo struct {
	initialsMsg [BYTE_ARR_SIZE]byte

	connections int
	iters       int

	tasks []BufSock
	latch sync.WaitGroup
	port  int
}

type BufSock struct {
	conn *net.Conn
	buf  []byte
}

func initEcho(echo *Echo, connections int, iters int, port int) *Echo {
	for i := 0; i < BYTE_ARR_SIZE; i++ {
		echo.initialsMsg[i] = byte(i)
	}

	echo.connections = connections
	echo.iters = iters
	echo.port = port

	echo.latch.Add(connections)

	echo.tasks = make([]BufSock, connections, connections)
	return echo
}

func initBuf(buf *[]byte, initial *[BYTE_ARR_SIZE]byte) {
	for i := 0; i < BYTE_ARR_SIZE; i++ {
		(*buf)[i] = initial[i]
	}
}

func startAndWait(echo *Echo) {
	var invokeAllLatch sync.WaitGroup
	server, err := net.Listen("tcp", fmt.Sprintf(":%d", echo.port))
	if err != nil {
		fmt.Println("error: listener creation")
		os.Exit(1)
	}
	invokeAllLatch.Add(1)

	go func() {
		for i := 0; i < echo.connections; i++ {
			conn, e := server.Accept()
			if e != nil {
				os.Exit(4)
			}
			echo.tasks[i].conn = &conn
			echo.tasks[i].buf = make([]byte, BYTE_ARR_SIZE)
		}
		_ = server.Close()
		invokeAllLatch.Done()
	}()

	var waitAllLatch sync.WaitGroup
	waitAllLatch.Add(echo.connections * 2)

	address := fmt.Sprintf("[::1]:%d", echo.port)
	for i := 0; i < echo.connections; i++ {
		conn, _ := net.Dial("tcp", address)

		go func() {
			buf := make([]byte, BYTE_ARR_SIZE)
			for j := 0; j < echo.iters; j++ {
				_, e := conn.Read(buf)
				if e != nil {
					os.Exit(2)
				}
				_, a := conn.Write(buf)
				if a != nil {
					os.Exit(3)
				}
			}
			_ = conn.Close()
			waitAllLatch.Done()
		}()
	}

	invokeAllLatch.Wait()
	startTime := time.Now()

	for i := 0; i < echo.connections; i++ {
		j := i
		go func() {
			conn := *echo.tasks[j].conn
			buf := echo.tasks[j].buf
			initBuf(&buf, &echo.initialsMsg)

			for v := 0; v < echo.iters; v++ {
				_, a := conn.Write(buf)
				if a != nil {
					os.Exit(5)
				}
				_, e := conn.Read(buf)
				if e != nil {
					os.Exit(6)
				}
			}

			_ = conn.Close()
			echo.latch.Done()
			waitAllLatch.Done()
		}()
	}

	echo.latch.Wait()
	result := time.Since(startTime).Milliseconds()
	fmt.Printf("Time: %d\n", result)

	waitAllLatch.Wait()
}

func parseArgs(args []string) {
  defer func() {
    if err := recover(); err != nil {
      fmt.Println("Usage: [-iter <num>] [-connections <num>]")
      os.Exit(1)
    }
  }()
  for pos := 0; pos < len(args); pos += 2 {
    option := args[pos]

    value, err := strconv.Atoi(args[pos+1])

    if value <= 0 || err != nil {
      panic("value not valid!")
    }

    if option == "-iter" {
      nIter = value
    } else if option == "-connections" {
      nConn = value
    } else {
      panic("option not valid!")
    }
  }
}

var nConn = 100
var nIter = 10000

func main() {
  args := os.Args
  parseArgs(args[1:])

	startAndWait(initEcho(&Echo{}, 100, 10000, 27015))
	startAndWait(initEcho(&Echo{}, nConn, nIter, 27016))
}
