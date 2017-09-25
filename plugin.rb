# name: Discourse Myanimelist Onebox
# about: Adds support for properly embedding Anime-View and Manga-View within Discourse.
# version: 1.0
# authors: Armin Seidling
# url: https://github.com/Machigatta/discourse-AnimeAndManga-onebox

# Onebox for Myanimelist-Manga
class Onebox::Engine::MyanimelistMangaOneBox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?myanimelist\.net\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})$/
    matches_regexp REGEX
    
    def viewurl
        "https://api.kokoro-ko.de/onebox/onebox.php"
    end

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
        "<iframe src=\"{viewurl}?api=mal&type={type}&name={name}&id={id}/\" frameborder=\"0\" width=\"100%\" height=\"255\">
        </iframe>"
	end
end

# Onebox for Myanimelist-Anime
class Onebox::Engine::MyanimelistAnimeOneBox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?myanimelist\.net\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})\/(?!directory)([a-zA-Z0-9_]{4,25})$/
    matches_regexp REGEX
    
    def viewurl
        "https://api.kokoro-ko.de/onebox/onebox.php"
    end

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
        "<iframe src=\"{viewurl}?api=mal&type={type}&name={name}&id={id}/\" frameborder=\"0\" width=\"100%\" height=\"255\">
        </iframe>"
	end
end

# Onebox for AnimeNewsNetwork-Anime
class Onebox::Engine::AnimeNewsNetworkOneBox
	include Onebox::Engine

	REGEX = /^http?:\/\/(?:www\.)?animenewsnetwork\.com\/encyclopedia\/anime.php\?id=([a-zA-Z0-9_]{4,25})$/
    matches_regexp REGEX
    
    def viewurl
        "https://api.kokoro-ko.de/onebox/onebox.php"
    end

    def id
        @url.match(REGEX)[1]
    end
	
	def to_html
        "<iframe src=\"{viewurl}?api=ann&id={id}/\" frameborder=\"0\" width=\"100%\" height=\"255\">
        </iframe>"
	end
end
