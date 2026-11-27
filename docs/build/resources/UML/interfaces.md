4 entità rilevate: Player, Environment, Enemy, Item, GameState

```mermaid
---
config:
  theme: redux-dark-color
  layout: neo
---

classDiagram 

class Player <<interface>> {
  +move()
  +attack()
  +block()
  +drop()
  +heal()
  +interact()
  +takeDamage()
}

class CarryableItem <<interface>> {
  +getCount()
  +effect()
}

class NonCarryableItem <<interface>> {
  +interaction()
}

class Environment <<interface>>{
  +playerSpawn()
  +itemSpawn()
  +enemySpawn()
  +deSpawnEntity()
  +changeScenario()
}

class Enemy <<interface>> {
  +move()
  +attack()
  +drop()
  +takeDamage()
}

class GameState <<interface>> {
  +resetLevel()
  +pause()
  +resume()
  +exit()
}

GameState "1" --> "1" Environment
Environment "1" o-- "1" Player
Environment "1"  o-- "0..*" Enemy
Environment "1" o-- "0..*" NonCarryableItem
Enemy "0..*" ..> "1" CarryableItem
Player "1" ..> "0..*" CarryableItem


```