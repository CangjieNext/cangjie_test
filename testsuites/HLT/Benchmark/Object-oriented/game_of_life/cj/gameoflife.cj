/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: ../data.txt
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC: %export cjHeapSize=768mb && %export JETVMPROP="-Djet.gc.heaplimit=768m" && %run %run_opt %output 3 %run_args

import std.fs.*
import std.convert.*
import std.random.Random
import std.time.*
import std.io.*

class Point {
  public Point(var x: Int64, var y: Int64) {
  }
}

class Location {

    public static let NUM_OF_NEIGHBORS = 8

    public var current: Point
    public var neighbors: Array<Point>

    public Location(curr: Point) {
      current = curr;
      neighbors = [Point(curr.x - 1, curr.y - 1), 
                   Point(curr.x,     curr.y - 1), 
                   Point(curr.x + 1, curr.y - 1), 
                   Point(curr.x - 1, curr.y), 
                   Point(curr.x + 1, curr.y), 
                   Point(curr.x - 1, curr.y + 1), 
                   Point(curr.x,     curr.y + 1), 
                   Point(curr.x + 1, curr.y + 1)]
    }
}

class Human <: Equatable<Human> {
  public var place : Location

  public Human(point: Point) {
    place = Location(point)
  }

  public init() {
    place = Location(Point(0, 0))
  }

  public func countNeighbors(s: Planet): Int64 {
    var count = 0
    for (i in 0..Location.NUM_OF_NEIGHBORS) {
      let friendPoint = place.neighbors[i]
      if (s.onPlanet(friendPoint) && s.isPopulationAlive(friendPoint)) {
        count++;
      }
    }
    count
  }

  public func reproduction(s: Planet, ns: Planet) {
    let n = countNeighbors(s)

    if (n > 1 && n < 4 && !ns.isPopulationAlive(this.place.current)) {
        ns.occupyPlace(this.place.current, this);
    }

    for (i in 0..Location.NUM_OF_NEIGHBORS) {
      let friend = Human(this.place.neighbors[i]);

      if (ns.onPlanet(friend.place.current) && !s.isPopulationAlive(friend.place.current) && !ns.isPopulationAlive(friend.place.current) && friend.countNeighbors(s) == 3) {
        ns.occupyPlace(friend.place.current, Human(friend.place.current))
      }
    }
  }

  public operator func ==(that : Human) : Bool {
    (this.place.current.x == that.place.current.x) && 
    (this.place.current.y == that.place.current.y)
  }

  public operator func !=(that : Human) : Bool {
    !(this == that)
  }
}

class Planet {

    public var day  : Int64
    public var towns: Array<Array<Option<Human>>>

    public Planet(var sizex: Int64, var sizey: Int64) {
      day = 0
      towns = Array<Array<Option<Human>>>(sizex) { item => Array<Option<Human>>(sizey) { item => None } }
    } 

    public func onPlanet(t: Point): Bool {
        return t.x >= 0 && t.y >= 0 && t.x < sizex && t.y < sizey
    }

    public func isPopulationAlive(t: Point): Bool {
        match (towns[t.x][t.y]) {
            case Some(v) => true
            case None    => false
        }
    }

    public func occupyPlace(t: Point, h: Human) {
      towns[t.x][t.y] = Some(h)
    }

    public func newDay() {
      let ns = Planet(this.sizex, this.sizey)
      for (y in 0..sizey) {
        for (x in 0..sizex) {
          if (towns[x][y] != None) {
            let h = towns[x][y]
            h.getOrThrow().reproduction(this, ns)
          }
        }
      }
      towns = ns.towns
      day++
    }

    public func runLife(days: UInt64) {
      for (i in 0..days) {
        newDay()
      }
    } 

    public func survivors() : Int64 {
      var result = 0
      for (x in 0..sizex) {
        for (y in 0..sizey) {
          if (towns[x][y] != None) {
            result++
          }  
        }
      }
      result
    }

    public func print() {
      print("Day: " + day.toString() + "\n")
      printGrid()
    }

    public func printGrid() {
      print("+")
      for (i in 0..sizex) {
        print("-")
      }
      print("+")
      print("\n")

      for (y in 0..sizey) {
        print("|")
        for (x in 0..sizex) {
          if (towns[x][y] != None) {
            print("*")
          } else {
            print(" ")
          }
        }
        print("|")
        print("\n")
      }

      print("+")
      for (i in 0..sizex) {
        print("-")
      }
      print("+")
      print("\n")
    }

  public operator func ==(that : Planet) : Bool {
    if (this.sizex != that.sizex || this.sizey != that.sizey || this.day != that.day) {
      return false
    } 
    for (i in 0..this.sizex) {
      for (j in 0..this.sizey) {
        if (this.towns[i][j] != that.towns[i][j]) {
          return false
        }
      }
    }
    true
  }

  public operator func !=(that : Planet) : Bool {
    !(this == that)
  }
}

func createSquarePlanet(size: Int64, rand: Random): Planet {
  let planet = Planet(size, size)

  for (x in 0..size) {
    for (y in 0..size) {
      if (rand.nextUInt64(100) < 40) {
        let p = Point(x, y)
        planet.occupyPlace(p, Human(p))
      }
    }
  }
  planet
}

func readPlanet(day: Int64, data: Array<String>): Planet {
  let sizey = data.size - 2 // skip header and footer
  let sizex = data[0].size - 2 // skip borders

  let planet = Planet(sizex, sizey)
  planet.day = day
  for (x in 0..sizex) {
    for (y in 0..sizey) {
      if (data[y + 1][x + 1] == UInt8(UInt32(r'*'))) {
        let p = Point(x, y)
        planet.occupyPlace(p, Human(p))
      }
    }
  }
  planet
}

func readPlanetFromFile(fs: File): (Planet, UInt64) {
  let content = String.fromUtf8(readToEnd(fs))
  let contentSplit = content.split("\n")
  let sizeAndDays = contentSplit[0].split(" ")
  let size = UInt64.tryParse(sizeAndDays[0]) 
  let days = UInt64.tryParse(sizeAndDays[1])

  //assert(size == contentSplit.size - 3) // 1 for meta info, 1 for header and 1 for footer

  let range = 1..=(contentSplit.size - 1):1
  (readPlanet(0, contentSplit[range]), days.getOrThrow())
}

func measure() {
  var fs: File = File("data.txt", Read)
  var (planet, days) = readPlanetFromFile(fs)
  fs.close()

  println("Starting a simulation for ${days} days")
  let start = DateTime.now()
  planet.runLife(days)
  let end = DateTime.now()
  let timeMs = (end - start).toMilliseconds()
  println("Total time: ${timeMs} ms")
  println("Survivors after simulation: ${planet.survivors()}") 
}

main(args: Array<String>): Int64 {

  if (args.size != 1) {
    println("Usage: program <repeats>")
    return 1
  }

  let R = Int64.tryParse(args[0]).getOrThrow()
  
  let VALIDATION_ENABLED = false

  if (VALIDATION_ENABLED) {
    // validation on small field
    let rand = Random(1)

    let planetForValidation = createSquarePlanet(10, rand)
    planetForValidation.runLife(5)
    let planetReference = readPlanet(5,  ["+----------+",
                                          "|      **  |",
                                          "|     * *  |",
                                          "|      *   |",
                                          "|          |",
                                          "|          |",
                                          "|          |",
                                          "|  *  * ** |",
                                          "| **     * |",
                                          "| **    ** |",
                                          "|     **   |",
                                          "+----------+"]) 

    if (planetForValidation != planetReference) {
      print("Basic validation failed\n")
      print("Planet for validation:\n")
      planetForValidation.print()
      print("Reference planet:\n")
      planetReference.print()
      return 1
    } else {
      print("Basic validation succeed\n")
    }
  }

  for (i in 0..R) {
    measure()
  }

  0
}
