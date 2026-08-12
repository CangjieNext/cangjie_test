/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_blockingqueue

import (
	"fmt"
	"testing"
	"strings"
)

type Event interface {
	IsExit() bool
	Clone() Event
}

type IntEvent struct {
	Val int64
}

type StrEvent struct {
	Val string
}

type CheapStrEvent struct {
	Val *string
}

type CloneStrEvent struct {
	Val string
}

func NewIntEvent(seed int64) Event {
	return IntEvent{seed}
}

func NewStrEvent(seed int64) Event {
	return StrEvent{strings.Repeat("A", int(seed))}
}

func NewCloneEvent(seed int64) Event {
	return CloneStrEvent{strings.Repeat("A", int(seed))}
}

func NewCheapStrEvent(seed int64) Event {
	s := strings.Repeat("A", int(seed))
	return CheapStrEvent{Val: &s}
}

func (e IntEvent) IsExit() bool {
	return e.Val == -1
}

func (e StrEvent) IsExit() bool {
	return e.Val == "exit"
}

func (e CloneStrEvent) IsExit() bool {
	return e.Val == "exit"
}

func (e CheapStrEvent) IsExit() bool {
	return *e.Val == "exit"
}

func (e IntEvent) Clone() Event {
	return IntEvent{e.Val}
}

func (e StrEvent) Clone() Event {
	return StrEvent{e.Val}
}

func (e CloneStrEvent) Clone() Event {
	return CloneStrEvent{strings.Clone(e.Val)}
}

func (e CheapStrEvent) Clone() Event {
	return CheapStrEvent{e.Val}
}

func worker(queue chan Event, done chan int64, doneTarget int64) {
	n := int64(0)
	for i := int64(0); i < doneTarget; i++ {
		event := <-queue
		if !event.IsExit() {
			n += 1
		}
	}
	close(queue)
	done <- n
}

func dispatchTo(event Event, events int64, addr chan Event) {
	for i := int64(0); i < events; i++ {
		copiedEvent := event.Clone()
		addr <- copiedEvent
	}
}

func dispatch(events, eventSize int64, address []chan Event, eventType int) {
	var event Event
	switch eventType {
	case 0:
		event = NewIntEvent(eventSize)
	case 1:
		event = NewStrEvent(eventSize)
	case 2:
		event = NewCheapStrEvent(eventSize)
	case 3:
		event = NewCloneEvent(eventSize)
	default:
		panic(fmt.Sprintf("invalid event type %d", eventType))
	}
	for i := 0; i < len(address); i++ {
		go dispatchTo(event, events, address[i])
	}
}

func NameOfEventtype(eventType int) string {
	switch eventType {
	case 0:
		return "int"
	case 1:
		return "str"
	case 2:
		return "str_ptr"
	case 3:
		return "str_clone"
	default:
		return "unknown"
	}
}

func benchmarkLinkedBlockingQueue_class(
    b *testing.B,
    workers int64,
	events int64,
    eventType int,
    eventSize int64,
    queueSize int64,
) {
	for i := 0; i < b.N; i++ {
		done := make(chan int64, workers)
		// address is the send port of all workers
		address := make([]chan Event, workers)

		// startup workers
		for i := int64(0); i < workers; i++ {
			queue := make(chan Event, queueSize)
			address[i] = queue
			go worker(queue, done, events)
		}

		// spawn the dispatch
		go dispatch(events, eventSize, address, eventType)

		// wait all task done
		sn := int64(0)
		for i := int64(0); i < workers; i++ {
			sn += <-done
		}
	}
}

func BenchmarkLinkedBlockingQueue_struct_SingleWorker_IntEvent(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 1, 10000, 0, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_SingleWorker_StrEvent(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 1, 10000, 1, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_Int_Worker_N8(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 0, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_Worker_N16(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 16, 100000, 1, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_Int_Worker_N32(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 32, 100000, 0, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_Worker_N64(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 64, 100000, 1, 64, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_EventSize_S8(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 1, 8, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_EventSize_S1024(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 1, 1024, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_EventSize_S65536(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 1, 65536, 64)}
func BenchmarkLinkedBlockingQueue_struct_Str_QueueSize_N16(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 1, 64, 16)}
func BenchmarkLinkedBlockingQueue_struct_Int_QueueSize_N256(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 0, 64, 256)}
func BenchmarkLinkedBlockingQueue_struct_Str_QueueSize_N1024(b *testing.B)    {benchmarkLinkedBlockingQueue_class(b, 8, 100000, 1, 64, 1024)}