# Template project

## Used tools

1. `cookiecutter` - Is an open source library for building coding project templates.
2. `nix` - Is a cross-platform package manager for Unix-like systems.
3. `task` - Is a task runner / build tool that aims to be simpler and easier to use than, for example, GNU Make.
4. `uv` - An extremely fast Python package and project manager, written in Rust.

## Install tools

### [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/installation.html)

Install using `brew`

```sh
brew install cookiecutter
```

### [nix](https://nixos.org/download/)

Example macos

```sh
sh <(curl -L https://nixos.org/nix/install)
```

### [taskfile](https://taskfile.dev/)

It does not require installation because it will be activated when nix-sell is activated

### [uv](https://docs.astral.sh/uv/getting-started/installation/)

It does not require installation because it will be activated when nix-sell is activated

## About tools

`cookiecutter` - allows you to create a project framework from a template in a minute

`nix` - is used to manage python versions in a project. You can fix the version in the `shell.nix` file or add a tool used only for this project

`uv` - quickly installs all dependencies. Allows you to speed up the assembly of the docker locally and create a virtual environment

`task` -  I use "task" instead of "makefile". It's really easy to use if you're lazy like me.

### About `Task`

I'm using `task` instead of `makefile`. It's really simple to use if you are a lazy as me

It's also only alias for command like this

```sh
task lint
```

this command will start this

```sh
pre-commit run --all-files
```

You can customize your command in file `Taskfile.yml`

For me, it is very useful

### About lints

All these settings will work only for a current project. You can change the setting for a new project

`pyproject.toml` - a single place of all configs here. For `ruff`, `mypy`, `pytest`, `pyright`, `vulture`, `uv` etc.

#### mypy

settings for mypy

#### ruff

`select = ["ALL"]` checks according to all implemented rules

#### vulture [github](https://github.com/jendrikseipp/vulture)

`vulture` - finds unused code in Python programs

#### pyright

most need when you use `vscode`

## Using

### Steps

1. First

    ```sh
    cookiecutter https://github.com/zimkaa/project_template.git
    ```

    or use local folder with template

    ```sh
    cookiecutter [path/to/folder_settings]
    ```

2. Second

    ```sh
    cd [project_folder]
    ```

3. Third

    ```sh
    nix-shell
    ```

4. Fourth. At this stage will be installed python dependencies for local development

    ```sh
    task install
    ```

5. Fifth

    All ready

## Используемые инструменты

1. `cookiecutter` - позволяет вам создать каркас проекта из шаблона за минуту
2. `nix` - кросс-платформенный пакетный менеджер
3. `task` - замена `makefile` более читабельный и более удобный в использовании
4. `uv` - пакетный и проектный менеджер для python.

## Установка инструментов

### nix [сайт](https://nixos.org/download/)

Пример macos

```sh
sh <(curl -L https://nixos.org/nix/install)
```

### task [сайт](https://taskfile.dev/)

Не требует установки т.к. будет активирован при активации nix-sell

### uv [сайт](https://docs.astral.sh/uv/getting-started/installation/)

Не требует установки т.к. будет активирован при активации nix-sell

## О используемых инструментах

`cookiecutter` - позволяет из шаблона создать каркас проекта за минуту

`nix` - используется для управления версиями питона в проекте. Исправить версию можно в файле `shell.nix` или добавить используемый инструмент только для этого проекта

`uv` - быстро устанавливает все зависимости. Позволяет ускорить сборку докера локально и создать виртуальное окружение

`task` - Я использую "task" вместо "makefile". Это действительно просто в использовании, если вы ленивый как я

### О `Task`

Я использую `task` вместо `makefile`. Это действительно просто в использовании, если вы ленивый как я

Это также псевдоним для такой команды, как эта

```sh
task lint
```

эта команда запустит это

```sh
pre-commit run --all-files
```

Вы можете настроить свою команду в файле `Task file.yml`

Для меня это очень полезно

### О линтерах

Все эти настройки будут работать только для текущего проекта. Вы можете изменить настройки для нового проекта

`pyproject.toml` -  здесь находится единое место для всех конфигураций. Для `ruff`, `mypy`, `pytest`, `pyright`, `vulture`, `uv` и т.д.

#### Настройки ruff

`select = ["ALL"]` проверяет в соответствии со всеми внедренными правилами

#### Настройки vulture [github](https://github.com/jendrikseipp/vulture)

`vulture` - находит неиспользуемый код в программах на Python

#### Настройки pyright

больше всего это нужно, когда вы используете `vscode`

## Использование

### Шаги

1. Первый

    ```sh
    cookiecutter https://github.com/zimkaa/project_template.git
    ```

    или используйте локальную папку с шаблоном

    ```sh
    cookiecutter [path/to/folder_settings]
    ```

2. Второй

    ```sh
    cd [project_folder]
    ```

3. Третий

    ```sh
    nix-shell
    ```

4. Четвертый На этом этапе установятся зависимости для локальной разработки

    ```sh
    task install
    ```

5. Пятый

    Все готово
