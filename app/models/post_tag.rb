class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  
  # belongs_to :hashtag
  # validates :post_id, presence: true
  # validates :hashtag_id, presence: true
  
  
    def render_with_hashtags(tag_name, tag_id)
      tag_name.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/item/hashtag/#{word.delete("#")}?tag_id=#{tag_id}"}.html_safe
    end

end

