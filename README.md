# NixOS 配置

个人基于 Nix/NixOS 的配置管理系统，用于 macOS (Darwin) 和 Linux 环境。该配置允许使用声明式方法管理系统和应用程序包，确保环境一致性和可复现性。

> 本配置基于 [Mitchell Hashimoto 的 nixos-config](https://github.com/mitchellh/nixos-config) 项目进行定制和扩展。

## 功能特点

- **跨平台支持**: 同时支持 macOS (Darwin) 和 Linux (NixOS) 系统
- **声明式配置**: 所有系统配置和软件包都通过 Nix 语言声明式定义
- **可重现环境**: 确保开发环境和系统配置的一致性和可重现性
- **版本控制**: 所有配置均通过 Git 进行版本控制，易于回滚和分享
- **模块化设计**: 系统功能通过模块组织，便于复用和扩展

## 包含内容

- 常用命令行工具和开发工具
- 终端配置 (可选启用)
- 系统偏好设置
- 包管理和依赖项

## 安装指南

### 先决条件

- 对于 macOS 用户，请确保已安装 [Nix](https://nixos.org/download.html) 包管理器
- 对于 Linux 用户，建议安装完整的 NixOS 系统

### 本地安装

1. 克隆本仓库到本地：

```bash
git clone https://github.com/mingeme/nixos-config.git ~/.nixconfig
cd ~/.nixconfig
```

2. 从本地构建和应用配置：

```bash
# 对于 macOS (Darwin) 系统
nix run .#build-switch

# 或对于 NixOS 系统
nix run .#build-switch
```

### 通过 GitHub 直接安装（无需克隆）

可以直接从 GitHub 运行配置，无需先克隆仓库：

```bash
# 对于 macOS (Darwin) 系统
nix run github:mingeme/nixos-config#build-switch

# 或对于 NixOS 系统
nix run github:mingeme/nixos-config#build-switch
```

## 自定义配置

可以根据个人需求修改配置文件：

- `modules/shared/packages.nix`: 定义跨平台共用的软件包
- `modules/darwin/packages.nix`: 定义 macOS 特定的软件包
- `modules/nixos/packages.nix`: 定义 NixOS 特定的软件包
- `modules/shared/home-manager.nix`: 定义用户级配置（如 shell 和编辑器配置）

## 实用命令

```bash
# 构建并切换到新配置
nix run .#build-switch

# 仅构建但不应用配置（用于测试）
nix run .#build

# 回滚到上一个配置（如果有问题）
nix run .#rollback
```
