module SessionsHelper
  def group_check(session)
    return if session.group.nil?

    # rubocop:disable Layout/LineLength
    image_tag(session.group.icon, class: 'group__image', onerror: 'this.error=null;this.src="https://placeimg.com/50/50/tech"')
  end
end

# rubocop:enable Layout/LineLength
