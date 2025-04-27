# Godot 中的单例模式实现指南

## 在 Godot 中实现单例有两种主要方法：

1. 使用 AutoLoad (推荐方法)
2. 通过 GDScript 代码实现经典单例模式

## 方法一：使用 AutoLoad (推荐方法)

```gdscript
extends Node

# 示例：游戏管理器
var score: int = 0
var player_health: int = 100
var is_game_paused: bool = false

# 全局方法
func update_score(points: int) -> void:
    score += points

func reset_game() -> void:
    score = 0
    player_health = 100
    is_game_paused = false
```

### 使用方法：

1. 创建上述脚本文件
2. 在 Project > Project Settings > AutoLoad 中添加
3. 给它一个名字（如"GameManager"）并点击"Add"
4. 在其他脚本中直接使用：`GameManager.score = 10`

## 方法二：传统单例模式

```gdscript
# game_manager.gd
extends Node

var score: int = 0
var player_health: int = 100

static var instance: GameManager = null

func _init():
    if instance != null:
        push_error("GameManager already exists!")
        return
    instance = self

static func get_instance() -> GameManager:
    if instance == null:
        instance = GameManager.new()
    return instance
```

### 使用方法：

```gdscript
var game_manager = GameManager.get_instance()
```

## AutoLoad vs 手动单例的区别

### AutoLoad 优势：

1. 自动集成到场景树中
2. 可以使用节点的所有功能（\_ready, \_process 等）
3. 可以使用信号系统
4. 由引擎管理生命周期
5. 可在编辑器中配置和调试

### 手动单例限制：

1. 默认不在场景树中
2. 需要手动管理添加和移除
3. 可能出现重复添加或遗漏问题
4. 不能直接使用节点功能

## 实际应用示例

### 适用场景：

- 全局游戏状态管理
- 玩家数据保存
- 全局设置
- 场景管理
- 音频管理
- 事件系统
