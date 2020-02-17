class HttpMiddleware
  def initialize(query:)
    @file = query.downcase.split(' ').join('-')
  end

  def read
    begin
      File.read("files/#{@file}.html")
    rescue Exception => e  
       puts e.message  
    end
  end
end
