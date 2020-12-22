# require libraries/modules here
require 'open-uri'
require 'nokogiri'
require 'pry'




def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html) 
  # project => kickstarter.css("li.project.grid_4")
  # project title => project.css("h2.bbcard_name strong a").text 
  # image_link =>   project.css("div.project-thumbnail a img").attribute("src").value
  # Description => project.css("p.bbcard_blurb").text.strip
  # Location => project.css("li a span.location-name").text
  # Percent Funded => project.css("li.first.funded strong").text.gsub("%", "").to_i
# binding.pry
  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|   # Interate through each project
    project_title = project.css("h2.bbcard_name strong a").text #Gets project title using selector found earlier
    projects[project_title.to_sym] = {                              #Creates a nested empty hash for each individual project with a key of the project title
            image_link: project.css("div.project-thumbnail a img").attribute("src").value, 
            description: project.css("p.bbcard_blurb").text.strip,
            location: project.css("li a span.location-name").text,
            percent_funded: project.css("li.first.funded strong").text.gsub("%", "").to_i
    } 
  end
  projects    #returns hash
end


binding.pry
0
