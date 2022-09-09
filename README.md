# HITsz Assignment LaTeX: 哈尔滨工业大学（深圳）电子作业 LaTeX 模板示例

## 简介

本 LaTeX 模板基于一些课程的教师提供的电子作业示例编写。

仅在 Texlive 2022 的 XeLaTeX 上测试通过。不保证在其他 LaTeX 引擎和编译器上可用，且不予以技术支援。

## 使用

- 克隆仓库，或直接下载 `assignment.cls` 文件；
- 根据实际需求放置资源文件（图片、字体等）；
- 在同一目录下编写 `main.tex` 文件；
- 使用 `make` 或其他方式编译出 PDF 文件。

## 主要特点和配置

### 个人信息栏

默认显示个人信息栏，可以在文档首页头部显示作者姓名、学号、专业和照片。这些元素的高度均固定，不建议文本框超出一行。

若需要隐藏个人信息栏，在 `main.tex` 的文档类中添加 `anonymous` 属性：

```latex
\documentclass[anonymous]{assignment}
```

若无需添加照片，将

```latex
\portrait{landscape.png}
```

一行花括号内的路径设空即可。

### 多级标题

题号和“解”“证明”分别对应 `\section` 和 `\subsection` 两个级别的标题。

### 解答题和证明题

解答题和证明题分别使用两个命令 `\solveprob{<prob-id>}{<answer>}{<solution>}` 和 `\proveprob{<prob-id>}{<proof>}` 实现。第一个参数为题号；`\solveprob` 第二个参数为答案，第三个参数为解答过程；`\proveprob` 的第二个参数为证明过程。

### 字体

为保证正常显示示例中的日文和繁体字体，默认使用 [Noto Serif CJK](https://github.com/googlefonts/noto-cjk/)。

## 示例

可以在 [Releases](/releases/tag/v1.0.0) 中下载编译出的 PDF 文件。

## 参考资料和许可证

示例中 `landscape.png` 的资源源地址位于 [yande.re](https://yande.re/post/show/1017791)。

示例中使用的 Noto Serif CJK 字体位于 [GitHub](https://github.com/googlefonts/noto-cjk/)。

这些资料可以在 [Releases](/releases/tag/other-resources) 中下载。

其他参见 [LICENSE](LICENSE)。

## 其他说明

示例文档中出现的作者姓名、学号等信息来源于网络，不保证图文相关，不代表仓库维护者立场。