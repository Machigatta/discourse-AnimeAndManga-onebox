# name: Discourse Myanimelist Onebox
# about: Adds support for properly embedding Anime-View and Manga-View within Discourse.
# version: 1.0
# authors: Armin Seidling
# url: https://github.com/Machigatta/discourse-myanimelist-onebox

# Onebox for Myanimelist-Manga
class Onebox::Engine::MyanimelistMangaOneBox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?myanimelist\.net\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})$/
	matches_regexp REGEX

	def id
		@url.match(REGEX)[2]
    end
    
    def type
        @url.match(REGEX)[1]
    end

    def name
        @url.match(REGEX)[3]
    end
	
	def to_html
        "<div src=\"https://wshbr.de/mal_onebox.php?type={type}&id={id}/\"  
            style=\"width:100% !important;\">
        </div>"
	end
end

# Onebox for Myanimelist-Anime
class Onebox::Engine::MyanimelistAnimeOneBox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?myanimelist\.net\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})$/
	matches_regexp REGEX

    def id
		@url.match(REGEX)[2]
    end
    
    def type
        @url.match(REGEX)[1]
    end

    def name
        @url.match(REGEX)[3]
    end   
	
	def to_html
        "<div src=\"https://wshbr.de/mal_onebox.php?type={type}&id={id}/\" 
            style=\"width:100% !important;\">
        </div>"
	end
end
