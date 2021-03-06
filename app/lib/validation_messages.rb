module ValidationMessages

    METRICS = 
    {
      distance: ApplicationSettings.config['distance_metrics'],
      pace:     ApplicationSettings.config['pace_metrics']
    }
  
    def presence_msg(attribute)
      "a #{self.to_s.downcase} must have #{indefinite_articlerize(parse(attribute))}"
    end

    def numeric_msg(attribute)
      "#{parse(attribute)} must be a number"
    end

    def intensity_content_msg
      'intensity must be one of bruce lee, high, medium, low'
    end

    def metric_content_msg(attribute)
      "metric must be either #{METRICS[attribute].join(' or ')}"
    end 

    private

    def parse(attribute)
      attribute.to_s.gsub('_',' ')
    end 

    def indefinite_articlerize(word)
      %w(a e i o u).include?(word[0].downcase) ? "an #{word}" : "a #{word}"
    end

end