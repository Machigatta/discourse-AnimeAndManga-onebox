
<a href="https://www.kokoro-ko.de/">![Logo](https://www.kokoro-ko.de/uploads/default/original/1X/c425edbe738ac1f92e584cfb94305d1570042f45.png)</a>

# discourse-AnimeAndManga-onebox

This plugin for Discourse extends Onebox to add support for properly embedding [Myanimelist.net](https://myanimelist.net/) Anime and Manga in Discourse posts. Using the base attributes:

- Episodes / Chapters
- Status
- Premiered
- Score

## Installation

Add the plugin's repository URL to your container's `app.yml` file, for example:

```yml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/Machigatta/discourse-myanimelist-onebox
```

Rebuild the container:

```sh
cd /var/discourse
./launcher rebuild app
```

For the plugin to apply retroactively, you'll need to rebake old posts:

```sh
cd /var/discourse
./launcher enter app
rake posts:rebake
```

## License

[MIT License](LICENSE).