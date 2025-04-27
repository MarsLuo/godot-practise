# Godot 信号系统指南

## 信号是什么？

信号是 Godot 的消息传递机制，类似于事件系统或观察者模式。它允许节点间进行松耦合的通信。

## 基本用法

### 1. 定义信号

```gdscript
signal health_changed(new_health: int)  # 带参数的信号
signal game_over                        # 不带参数的信号
```

### 2. 发送信号

```gdscript
emit_signal("health_changed", 80)     # 发送带参数的信号
emit_signal("game_over")              # 发送不带参数的信号
```

### 3. 连接信号

```gdscript
func _ready():
    player.connect("health_changed", _on_player_health_changed)
```

## 实际示例

### 玩家脚本示例：

```gdscript
extends CharacterBody2D

signal health_changed(new_health: int)
signal player_died

var health: int = 100

func take_damage(amount: int) -> void:
    health -= amount
    emit_signal("health_changed", health)

    if health <= 0:
        emit_signal("player_died")
```

### UI 脚本示例：

```gdscript
extends Control

@onready var health_label = $HealthLabel
@onready var player = $"../Player"

func _ready():
    # 连接信号
    player.connect("health_changed", _on_player_health_changed)
    player.connect("player_died", _on_player_died)

func _on_player_health_changed(new_health: int):
    health_label.text = "Health: " + str(new_health)

func _on_player_died():
    health_label.text = "Game Over!"
```

## 信号系统优势

### 1. 解耦合：

- 发送者不需要知道接收者
- 多个接收者可以响应同一信号
- 动态添加或移除连接

### 2. 清晰的代码结构：

- 清晰的事件流
- 易于维护
- 符合事件驱动编程

### 3. 灵活性：

- 可携带多个参数
- 可在编辑器中可视化连接
- 动态连接和断开

## 使用建议

### 1. 命名规范：

- 信号名使用过去时态（health_changed 而非 change_health）
- 处理函数以*on*开头

### 2. 参数传递：

- 只传必要参数
- 使用类型提示

### 3. 性能考虑：

- 信号系统有少量开销
- 避免在高频率循环中过度使用

### 4. 调试：

- 可在编辑器中查看信号连接
- 使用 print 调试信号的发送和接收
