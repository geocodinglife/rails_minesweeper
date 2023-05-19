module ApplicationHelper
  def format_created_at_date(object)
    object.created_at.in_time_zone(Time.zone).strftime("%m/%d/%Y %I:%M %p")
  end

  def render_cell(value)
    if value >= 9
      content_tag(:img, nil, class: 'board-cell board-cell-icon', src: 'https://freesvg.org/img/bomb-3175208.png')
    else
      content_tag(:div, nil, class: 'board-cell')
    end
  end
end
