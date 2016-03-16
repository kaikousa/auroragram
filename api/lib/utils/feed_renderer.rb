class Auroragram::Utils::FeedRenderer

  def self.format_image(image)
    {
      :type => image.type,
      :url => image.url,
      :width => image.width,
      :height => image.height
    }
  end

  def self.format_images(post)
    images = { :standard_resolution => nil , :low_resolution => nil, :thumbnail => nil }

    post.images.each do |image|
      if image.type == "low_resolution"
        images[:low_resolution] = format_image(image)
      elsif image.type == "standard_resolution"
        images[:standard_resolution] = format_image(image)
      elsif image.type == "thumbnail"
        images[:thumbnail] = format_image(image)
      end
    end

    images
  end

  def self.format_output(post)
    {
      :id => post.id,
      :igId => post.ig_id,
      :link => post.link,
      :location => post.location,
      :country => post.country,
      :countryCode => post.country_code,
      :images => format_images(post),
      :user => {
        :username => post.user.username
      }
    }
  end

end
