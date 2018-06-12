module ApplicationHelper
    def markdown(text)
      options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
      }
  
      extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
      }
  
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
  
      markdown.render(text).html_safe
    end

    def partner?(u)
        return u.has_role? :partner
    end

    def lecturer?(u)
        return u.has_role? :lecturer
    end

    def student?(u)
        return u.has_role? :student
    end

    def get_info(u)
        if partner?(u)
            return u.partner_info
        elsif student?(u)
            return u.student_info
        elsif lecturer?(u)
            return u.lecturer_info
        end
    end

    def get_avatar(u)
        if partner?(u)
            return u.partner_info.logo
        elsif student?(u)
            return u.student_info.avatar
        elsif lecturer?(u)
            return u.lecturer_info.avatar
        end
    end
    def set_title(page_title)
        content_for(:title) { page_title }
    end
  end