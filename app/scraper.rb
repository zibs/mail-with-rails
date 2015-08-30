require 'mechanize'
require 'nokogiri'

	
def get_random_poetry
	browser = Mechanize.new { |agent|
		  agent.user_agent_alias = 'Mac Safari'
		}
	# GET: Poetry Page
	poetry_foundation = browser.get('http://www.poetryfoundation.org/widget/home/?1=1&browse_nav_class=home') 
	# GET: Random Poem AND RESPONSE is NEW POEM
	@aleatoric_poem_page  = poetry_foundation.link_with(:text=>/Find another random poem/).
																	click.link_with(:class=>/title/).click
end


def parse_poem_title

	@title  = aleatoric_poem_page.parser.at_xpath('//*[@id="poem-top"]/h1').text.squeeze(" ")
	@author = aleatoric_poem_page.parser.at_xpath('//*[@id="poemwrapper"]/span/a').text.squeeze(" ") 

end

def get_glossary_term
	# http://feeds.poetryfoundation.org/GlossaryTermOfTheDay
end


