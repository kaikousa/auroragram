class Auroragram::Services::PostService

  def self.create(media_item)
    if media_item.location != nil
      if Post.where(:ig_id => media_item['id']).count == 0

        post = Post.new(
          :ig_id => media_item['id'],
          :link => media_item['link'],
          :created_at => Time.now.getutc
          )

        location = Location.new(:latitude => media_item.location.latitude, :longitude => media_item.location.longitude)
        post.location = location

        thumbnail = Image.new(
          :type => 'thumbnail',
          :url => media_item.images.thumbnail.url,
          :width => media_item.images.thumbnail.width,
          :height => media_item.images.thumbnail.height
          )

        low_resolution = Image.new(
          :type => 'low_resolution',
          :url => media_item.images.low_resolution.url,
          :width => media_item.images.low_resolution.width,
          :height => media_item.images.low_resolution.height
          )

        standard_resolution = Image.new(
          :type => 'standard_resolution',
          :url => media_item.images.standard_resolution.url,
          :width => media_item.images.standard_resolution.width,
          :height => media_item.images.standard_resolution.height
          )

        post.images.push(thumbnail)
        post.images.push(low_resolution)
        post.images.push(standard_resolution)

        post.save!

      end
    end
  end

end


