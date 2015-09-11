namespace :poetry do 
	
require 'mechanize'
require 'nokogiri'

desc "Mass Email Poetry to Readers"

	task :diffuse => :environment do


# This will run once a day. Therefore, will update poem daily.
		def send_email
			# Instantiate the poem
			@poem          = get_random_poetry
			# Provide the Url
			@poem_url      = @poem.uri.to_s
			# Strip Author and Title
			@title         = parse_poem_title(@poem).strip
			@author        = parse_poem_author(@poem).strip
			@glossary_page = get_glossary_page
			@glossary_term = get_glossary_term(@glossary_page)

			
			# Send the email! 
			@readers = Reader.order("created_at DESC")
			@readers.each do |reader|
				PoetryMailer.daily_poetry(reader, @poem, @title, @author, @poem_url, @glossary_page, @glossary_term).deliver_later
			end

			# Update the archives!
			PoemArchive.create(url:"#{@poem_url}", author: @author, title: @title, glossary_url: "#{@glossary_page}", glossary_term: @glossary_term)

		end



  			private 

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

		      def parse_poem_author(poetrypage)
		      poetrypage.parser.at_xpath('//*[@id="poemwrapper"]/span/a').text.squeeze(" ") 
		      end

		      def parse_poem_title(poetrypage)
		       poetrypage.parser.at_xpath('//*[@id="poem-top"]/h1').text.squeeze(" ")
		      end

		      # GET GLOSSARY
		      
		      def get_glossary_page
		      	browser = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
		        glossary_page = browser.get('http://feeds.poetryfoundation.org/GlossaryTermOfTheDay')
		        @glossary_term_page = glossary_page.search("link")[1].children.inner_text
		      end

		      def get_glossary_term(glossary_page)
		      	browser = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
		      	glossary_page  = browser.get(glossary_page)
		      	@glossary_term = glossary_page.parser.at_xpath('//*[@id="lab"]/div[5]/h1').text
		      end



# CALL THE METHOD AND SEND THE EMAILS! SPREAD THE POEISIE!
		send_email
	end


end
