# Giscus 评论系统配置指南

## 什么是Giscus？
Giscus 是一个基于 GitHub Discussions 的评论系统，可以让访问者在你的博客文章下发表评论。

## 配置步骤

### 1. 准备工作
1. 确保仓库是公开的
2. 在仓库设置中启用 GitHub Discussions
   - 进入仓库 Settings → General
   - 找到 "Features" 部分
   - 勾选 "Discussions"

### 2. 安装 Giscus App
1. 访问 https://github.com/apps/giscus
2. 点击 "Install"
3. 选择 `MaviProject/MaviProject.github.io` 仓库
4. 完成安装

### 3. 配置 Giscus
1. 访问 https://giscus.app/zh-CN
2. 填写配置信息：
   - **仓库**: `MaviProject/MaviProject.github.io`
   - **页面 ↔ discussions 映射关系**: 选择 "URL"
   - **Discussion 分类**: 选择 "Announcements" 或新建分类
   - **功能**: 启用反应、按日期排序等

### 4. 获取配置代码
配置完成后，Giscus 会生成一段 JavaScript 代码。将以下代码添加到 `index.html` 的评论区域：

```html
<div class="giscus-container">
    <script src="https://giscus.app/client.js"
        data-repo="MaviProject/MaviProject.github.io"
        data-repo-id="你的仓库ID"
        data-category="Announcements"
        data-category-id="你的分类ID"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="dark"
        data-lang="zh-CN"
        crossorigin="anonymous"
        async>
    </script>
</div>
```

### 5. 添加到博客
将上面的代码插入到博客页面中合适的位置（如文章底部）。

## 注意事项
- 首次加载可能需要几分钟生效
- 确保网络可以访问 GitHub
- 评论数据存储在 GitHub Discussions 中
- 可以通过 GitHub 管理评论（审核、删除等）

## 备用方案
如果不想使用 Giscus，可以考虑：
1. **Utterances** - 基于 GitHub Issues
2. **Disqus** - 传统评论系统（有广告）
3. **自建评论系统** - 需要后端支持
