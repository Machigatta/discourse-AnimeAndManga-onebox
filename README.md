
<a href="https://www.kokoro-ko.de/">![Logo](https://www.kokoro-ko.de/uploads/default/original/1X/c425edbe738ac1f92e584cfb94305d1570042f45.png)</a>

# discourse-kokoro-box

This plugin for Discourse uses the discourse-api to decorate the cooked-posts. Primary usage is for properly embedding Anime- and Manga-Links in Discourse posts and parsing them into better looking iframes. Using these base attributes:

#### Anime:
- Episodes
- Status
- Rating
- Release

#### Manga:
- Volumes
- Chapters
- Status
- Release
- Rating

#### Supported sites:
- [Myanimelist.net](https://myanimelist.net/) for Anime, Manga
- [AnimeNewsNetwork](http://www.animenewsnetwork.com/) for Anime, Manga

## Installation

Add the plugin's repository URL to your container's `app.yml` file, for example:

```yml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/Machigatta/discourse-kokoro-box.git
```

Rebuild the container:

```sh
cd /var/discourse
./launcher rebuild app
```

## License

[MIT License](LICENSE).
