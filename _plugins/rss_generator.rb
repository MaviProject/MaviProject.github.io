module Jekyll
  class RSSGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # 创建RSS feed内容
      rss_content = <<~RSS
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
        <channel>
          <title>#{site.config['title'] || 'MaviProject 技术博客'}</title>
          <description>#{site.config['description'] || '计算机视觉、目标检测、大语言模型技术分享'}</description>
          <link>#{site.config['url'] || 'https://maviproject.github.io'}#{site.config['baseurl'] || ''}</link>
          <atom:link href="#{site.config['url'] || 'https://maviproject.github.io'}#{site.config['baseurl'] || ''}/feed.xml" rel="self" type="application/rss+xml"/>
          <language>zh-CN</language>
          <lastBuildDate>#{Time.now.rfc822}</lastBuildDate>
          <generator>Jekyll RSS Generator</generator>
          
          #{generate_items(site)}
        </channel>
        </rss>
      RSS

      # 创建RSS页面
      site.pages << StaticFile.new(site, site.source, "", "feed.xml", rss_content)
    end

    private

    def generate_items(site)
      items = ''
      
      # 获取所有文章页面（Markdown文件）
      site.pages.each do |page|
        # 跳过非文章页面
        next unless page.path.end_with?('.md')
        next if ['ReadMe.md', 'About.md', 'Guess.md', 'index.md'].include?(page.name)
        
        # 构建文章URL
        url = "#{site.config['url'] || 'https://maviproject.github.io'}#{site.config['baseurl'] || ''}#{page.url}"
        
        # 获取文章标题（从Front Matter或文件名）
        title = page.data['title'] || page.name.gsub('.md', '').gsub('_', ' ')
        
        # 获取日期（从Front Matter或文件修改时间）
        date = page.data['date'] || File.mtime(page.path)
        
        # 生成描述
        description = generate_description(page)
        
        items << <<~ITEM
          <item>
            <title><![CDATA[#{title}]]></title>
            <link>#{url}</link>
            <guid>#{url}</guid>
            <pubDate>#{date.rfc822}</pubDate>
            <description><![CDATA[#{description}]]></description>
          </item>
        ITEM
      end
      
      items
    end

    def generate_description(page)
      # 从页面内容中提取描述
      content = page.content.to_s
      
      # 移除Front Matter
      content = content.gsub(/^---\s*\n.*?\n---\s*\n/m, '')
      
      # 提取前150个字符作为描述
      description = content.strip[0..150]
      description += '...' if content.length > 150
      
      # 简单清理HTML标签
      description.gsub!(/<[^>]*>/, '')
      description
    end
  end
end
