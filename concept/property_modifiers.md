# Godot 属性修饰符指南

## 常用属性修饰符

### @export

- **作用**：使属性在编辑器中可见和可编辑
- **使用场景**：需要在编辑器中配置的属性
- **示例**：

```gdscript
@export var speed: float = 100.0
@export var player_name: String = "Player1"
@export var is_alive: bool = true
```

### @onready

- **作用**：延迟初始化，在节点进入场景树时自动获取引用
- **使用场景**：需要引用其他节点的属性
- **示例**：

```gdscript
@onready var player = $Player
@onready var health_bar = $UI/HealthBar
```

### @export_group

- **作用**：在编辑器中创建属性分组
- **使用场景**：组织相关属性
- **示例**：

```gdscript
@export_group("Player Settings")
@export var health: int = 100
@export var speed: float = 300.0

@export_group("Weapon Settings")
@export var damage: int = 10
@export var fire_rate: float = 0.5
```

### @export_subgroup

- **作用**：在组内创建子组
- **使用场景**：进一步组织属性
- **示例**：

```gdscript
@export_group("Player")
@export_subgroup("Stats")
@export var health: int = 100
@export var stamina: int = 100

@export_subgroup("Movement")
@export var speed: float = 300.0
@export var jump_force: float = 500.0
```

### @export_range

- **作用**：限制数值范围
- **使用场景**：需要限制范围的数值属性
- **示例**：

```gdscript
@export_range(0, 100) var health: int = 100
@export_range(0.0, 1.0) var volume: float = 0.5
```

### @export_enum

- **作用**：创建枚举选择器
- **使用场景**：需要从预定义选项中选择的属性
- **示例**：

```gdscript
@export_enum("Red", "Green", "Blue") var color: String = "Red"
@export_enum("Easy", "Medium", "Hard") var difficulty: String = "Medium"
```

### @export_flags

- **作用**：创建位标志选择器
- **使用场景**：需要组合多个选项的属性
- **示例**：

```gdscript
@export_flags("Fire", "Water", "Earth", "Air") var elements: int = 0
```

### @export_file

- **作用**：创建文件选择器
- **使用场景**：需要选择文件的属性
- **示例**：

```gdscript
@export_file var config_file: String
@export_file("*.png") var texture_file: String
```

### @export_dir

- **作用**：创建目录选择器
- **使用场景**：需要选择目录的属性
- **示例**：

```gdscript
@export_dir var save_directory: String
```

### @export_multiline

- **作用**：创建多行文本编辑器
- **使用场景**：需要编辑多行文本的属性
- **示例**：

```gdscript
@export_multiline var description: String
```

### @export_placeholder

- **作用**：添加输入框占位符文本
- **使用场景**：需要提示用户输入内容的属性
- **示例**：

```gdscript
@export_placeholder("Enter player name") var player_name: String
```

### @export_node_path

- **作用**：创建节点路径选择器
- **使用场景**：需要选择场景中节点的属性
- **示例**：

```gdscript
@export_node_path("Node2D") var target_node: NodePath
```

### @export_global_file

- **作用**：创建全局文件选择器
- **使用场景**：需要选择项目外文件的属性
- **示例**：

```gdscript
@export_global_file var external_config: String
```

### @export_global_dir

- **作用**：创建全局目录选择器
- **使用场景**：需要选择项目外目录的属性
- **示例**：

```gdscript
@export_global_dir var external_data: String
```

## 使用建议

1. **选择合适的修饰符**：

   - 根据属性的用途选择最合适的修饰符
   - 考虑属性的可编辑性和可见性需求

2. **组织属性**：

   - 使用 `@export_group` 和 `@export_subgroup` 组织相关属性
   - 保持属性分组清晰和逻辑性

3. **类型安全**：

   - 始终指定属性类型
   - 使用适当的范围限制

4. **性能考虑**：

   - 避免过度使用 `@onready`，只在必要时使用
   - 合理使用 `@export`，不要暴露不需要编辑的属性

5. **文档化**：
   - 为重要的导出属性添加注释说明
   - 说明属性的用途和限制

参见文档

1. https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_exports.html

2. https://docs.godotengine.org/en/stable/classes/class_%40gdscript.html#annotations
