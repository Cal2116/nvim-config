# nvim 配置文件

## 快捷键合集

| 快捷键        | 功能                        |
| ------------- | --------------------------- |
| `<Tab>`       | 下一个 buffer               |
| `<S-Tab>`     | 上一个 buffer               |
| `<leader>bh`  | 当前 buffer 左移            |
| `<leader>bl`  | 当前 buffer 右移            |
| `<leader>bd`  | 删除当前 buffer（不关窗口） |
| `<leader>1~9` | 跳转到第 N 个 buffer        |
| `<leader>te`  | 打开目录树                  |
| `<leader>tf`  | 在目录树中查找当前文件      |
| `<leader>tc`  | 折叠所有目录                |
| `<leader>p`   | 查找项目中的文件            |
| `<leader>g`   | 全局搜索字符串（支持正则）  |
| `<leader>b`   | 显示当前打开的 buffer 列表  |
| `<leader>h`   | 查找帮助文档                |
| `<leader>r`   | 恢复上一次搜索结果          |
| `<leader>cc`  | 打开 copilot 对话框         |
| `<leader>ce`  | 使用 copilot 解释当前代码   |
| `<leader>co`  | 使用 copilot 优化当前代码   |
| `<leader>cf`  | 使用 copilot 修复当前代码   |
| `<leader>lc`  | 重命名变量                  |
| `<leader>ld`  | 跳转到变量定义处            |
| `<leader>lR`  | 找到变量的使用处            |
| `<C-z>`       | 撤销                        |

## 插件

### LSP

#### vue-language-server

在安装`vue-language-server`之前需要安装`node`和`npm`, 并通过npm在全局安装`typescript`

```shell
$ npm install -g typescript
```

### nvim-tree

**快捷键**

| 快捷键       | 功能                   |
| ------------ | ---------------------- |
| `<leader>te` | 打开目录树             |
| `<leader>tf` | 在目录树中查找当前文件 |
| `<leader>tc` | 折叠所有目录           |

### telescope

telescope 是一个用于全局搜索的插件，在安装这个插件之前需要通过`homebrew`额外安装两个插件

```shell
$ brew install fd
$ brew install ripgrep
```

**常用快捷键**

| 快捷键      | 功能                       |
| ----------- | -------------------------- |
| `<leader>p` | 查找项目中的文件           |
| `<leader>g` | 全局搜索字符串（支持正则） |
| `<leader>b` | 显示当前打开的 buffer 列表 |
| `<leader>h` | 查找帮助文档               |
| `<leader>r` | 恢复上一次搜索结果         |
