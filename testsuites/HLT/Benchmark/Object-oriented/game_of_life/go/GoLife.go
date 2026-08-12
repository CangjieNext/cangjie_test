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
  "os"
  "strconv"
  "strings"
  "io/ioutil"
  "time"
)

type Point struct {
  x, y uint64
}

const NUM_OF_NEIGHBORS = 8

type Location struct {
  current *Point
  neighbors [NUM_OF_NEIGHBORS]*Point
}

func NewLocation(curr *Point) *Location {
  l := new(Location)
  l.current = curr
  l.neighbors = [NUM_OF_NEIGHBORS]*Point{
       &Point{curr.x - 1, curr.y - 1},
       &Point{curr.x,     curr.y - 1},
       &Point{curr.x + 1, curr.y - 1},
       &Point{curr.x - 1, curr.y},
       &Point{curr.x + 1, curr.y},
       &Point{curr.x - 1, curr.y + 1},
       &Point{curr.x,     curr.y + 1},
       &Point{curr.x + 1, curr.y + 1}}
  return l
}

type Human struct {
  place *Location
}

func NewHuman(point *Point) *Human {
  h := new(Human)
  h.place = NewLocation(point)
  return h
}

func (h *Human) countNeighbors(s *Planet) uint64 {
  count := uint64(0)
  for i := 0; i < NUM_OF_NEIGHBORS; i++ {
    friendPoint := h.place.neighbors[i]
    if (s.onPlanet(friendPoint) && s.isPopulationAlive(friendPoint)) {
      count++;
    }
  }
  return count
}

func (h *Human) reproduction(s, ns *Planet) {
  n := h.countNeighbors(s)

  if (n > 1 && n < 4 && !ns.isPopulationAlive(h.place.current)) {
      ns.occupyPlace(h.place.current, h)
  }

  for i := 0; i < NUM_OF_NEIGHBORS; i++ {
    friend := NewHuman(h.place.neighbors[i])

    if (ns.onPlanet(friend.place.current) && !s.isPopulationAlive(friend.place.current) && !ns.isPopulationAlive(friend.place.current) && friend.countNeighbors(s) == 3) {
      ns.occupyPlace(friend.place.current, NewHuman(friend.place.current))
    }
  }
}


type Planet struct {
  sizex, sizey uint64
  day uint64
  towns [][]*Human
}

func NewPlanet(sizex, sizey uint64) *Planet {
  p := new(Planet)
  p.sizex = sizex
  p.sizey = sizey
  p.day = 0
  p.towns = make([][]*Human, sizex)
  for i := range p.towns {
    p.towns[i] = make([]*Human, sizey)
    for j := range p.towns[i] {
      p.towns[i][j] = nil
    }
  }
  return p
}

func (p *Planet) onPlanet(t *Point) bool {
  return t.x >= 0 && t.y >= 0 && t.x < p.sizex && t.y < p.sizey
}

func (p *Planet) isPopulationAlive(t *Point) bool {
  return p.towns[t.x][t.y] != nil
}

func (p *Planet) occupyPlace(t *Point, h *Human) {
  p.towns[t.x][t.y] = h
}

func (p *Planet) newDay() {
  ns := NewPlanet(p.sizex, p.sizey)
  for x := uint64(0); x < p.sizex; x++ {
    for y := uint64(0); y < p.sizey; y++ {
      if (p.towns[x][y] != nil) {
        p.towns[x][y].reproduction(p, ns)
      }
    }
  }
  p.towns = ns.towns
  p.day++
}

func (p *Planet) survivors() uint64 {
  var result uint64 = 0
  for x := uint64(0); x < p.sizex; x++ {
    for y := uint64(0); y < p.sizey; y++ {
      if (p.towns[x][y] != nil) {
        result++
      }
    }
  }
  return result
}

func (p *Planet) printGrid() {
  fmt.Printf("+")
  for x := uint64(0); x < p.sizex; x++ {
    fmt.Printf("-")
  }
  fmt.Printf("+")
  fmt.Printf("\n")

  for y := uint64(0); y < p.sizey; y++ {
    fmt.Printf("|")
    for x := uint64(0); x < p.sizex; x++ {
      if (p.towns[x][y] != nil) {
        fmt.Printf("*")
      } else {
        fmt.Printf(" ")
      }
    }
    fmt.Printf("|")
    fmt.Printf("\n")
  }

  fmt.Printf("+")
  for x := uint64(0); x < p.sizex; x++ {
    fmt.Printf("-")
  }
  fmt.Printf("+")
  fmt.Printf("\n")
}

func (p *Planet) print() {
  fmt.Printf("Day: %d\n", p.day)
  p.printGrid()
}

func (p *Planet) initializeFromGrid(grid []string) {
  for x := range grid {
    if grid[x][0] == '+' {
      continue
    }
    for y := range grid[x] {
      if grid[x][y] == '|' {
        continue
      }
      if grid[x][y] == '*' {
        point := Point{uint64(y - 1), uint64(x - 1)}
        p.occupyPlace(&point, NewHuman(&point))
      }
    }
  }
}

func measure() {
  b, err := ioutil.ReadFile("data.txt")
  if err != nil {
      panic (err)
  }

  lines := strings.Split(string(b), "\n")
  sizeAndDays := strings.Split(lines[0], " ")
  size, err := strconv.Atoi(sizeAndDays[0])
  if err != nil {
      panic(err)
  }

  days, err := strconv.Atoi(sizeAndDays[1])
  if err != nil {
      panic(err)
  }

  earth := NewPlanet(uint64(size), uint64(size))
  earth.initializeFromGrid(lines[1:])

  fmt.Printf("Starting a simulation for %d days\n", days)
  var start = time.Now()

  for i := 0; i < days; i++ {
    earth.newDay()
  }

  var timeMs = time.Since(start).Milliseconds()
  fmt.Printf("Total time: %d ms\n", timeMs)
  fmt.Printf("Survivors after simulation: %d\n", earth.survivors())
}

func main() {
  args := os.Args
  if len(args) != 2 {
      fmt.Println("Usage: program <repeats>")
      return
  }

  var R, err = strconv.Atoi(args[1])
  if err != nil {
      return
  }

  for i := 0; i < R; i++ {
    measure()
  }

}
